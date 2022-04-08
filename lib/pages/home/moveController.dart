import 'package:flutter/material.dart';

class MoveController extends StatefulWidget {
  MoveController({Key? key, required this.size}) : super(key: key);

  Size size;
  @override
  State<MoveController> createState() => _MoveControllerState();
}

class _MoveControllerState extends State<MoveController> {

  late double max;
  late double min;
  late double hMax;
  late double hMin = 0.0;

  late double _left;
  late double _top;

  @override
  void initState() {
    super.initState();
    max = widget.size.width - 90;
    min = widget.size.width * 0.5;
    hMax = widget.size.width*.5 - 70;
    _left = widget.size.width * .75 - 35 ;
    _top = widget.size.width * .25 - 35;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:_left,
      top:_top,
      child: GestureDetector(
        onPanEnd: (v) {
          setState(() {
            _left = widget.size.width * .75 - 35 ;
            _top = widget.size.width * .25 - 35;
          });
        },
        onPanUpdate: (pos) {
          setState(() {
            if ((_left + pos.delta.dx) > max) {
              _left = max;
            } else if (_left + pos.delta.dx <= min) {
              _left = min;
            } else {
              _left += pos.delta.dx;
            }
            if ((_top + pos.delta.dy) > hMax) {
              _top = hMax;
            } else if (_top + pos.delta.dy <= hMin) {
              _top = hMin;
            } else {
              _top += pos.delta.dy;
            }
          });
        },
        child: Container(
          margin: const EdgeInsets.all(12),
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(239, 35, 60, 0), shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(239, 35, 60, 1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(237, 242, 244, 1), shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(237, 242, 244, 1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
