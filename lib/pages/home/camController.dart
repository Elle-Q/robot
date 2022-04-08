import 'package:flutter/material.dart';

class CamController extends StatefulWidget {
  CamController({Key? key, required this.size}) : super(key: key);

  Size size;

  @override
  State<CamController> createState() => _CamControllerState();
}

class _CamControllerState extends State<CamController> {
  late double max;
  late double min = 0.0;

  late double _left;
  late double _top;

  @override
  void initState() {
    super.initState();
    max = widget.size.width * 0.5 - 70;
    _left = widget.size.width * .25 - 35;
    _top = widget.size.width * .25 - 35;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _left,
      top: _top,
      child: GestureDetector(
        onPanEnd: (v) {
          setState(() {
            _left = widget.size.width * .25 - 35;
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
            if ((_top + pos.delta.dy) > max) {
              _top = max;
            } else if (_top + pos.delta.dy <= min) {
              _top = min;
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
            color: Color.fromRGBO(43, 45, 66, 1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(43, 45, 66, 1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(141, 153, 174, 1),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(141, 153, 174, 1),
                    spreadRadius: 2,
                    blurRadius: 5,
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
