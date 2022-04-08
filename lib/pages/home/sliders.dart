import 'package:flutter/material.dart';

class Sliders extends StatefulWidget {
  const Sliders({Key? key}) : super(key: key);

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  late double _speed = 30;
  late double _lightPower = 5;

  void onSppedChanged(value) {
    setState(() {
      _speed = value ;
    });
  }

  void onLightPowerChanged(value) {
    setState(() {
      _lightPower = value ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
              Text("速度",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              Expanded(
                child: Slider(
                    min: 10.0,
                    max: 100.0,
                    value: _speed,
                    onChanged: (value) {
                      onSppedChanged(value);
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceAround,
            children: [
              Text("灯光",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              Expanded(
                child: Slider(
                    min: 1.0,
                    max: 10.0,
                    value: _lightPower,
                    onChanged: (value) {
                      onLightPowerChanged(value);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
