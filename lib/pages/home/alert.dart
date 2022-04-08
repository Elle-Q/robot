import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  bool lightOn = false;

  void toggleLight() {
    setState(() {
      lightOn = !lightOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          iconSize: 40,
          icon: SvgPicture.asset("assets/icons/trumpet.svg"),
          onPressed: () {},
        ),
        Container(
          margin: const EdgeInsets.all(12),
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, .1), shape: BoxShape.circle),
          child: IconButton(
            iconSize: 80,
            color: const Color.fromRGBO(51, 153, 137, 1),
            alignment: Alignment.center,
            icon: const Icon(Icons.keyboard_voice_rounded),
            onPressed: () {},
          ),
        ),
        IconButton(
          iconSize: 40,
          color: Colors.yellow,
          icon: lightOn ? SvgPicture.asset("assets/icons/lighton.svg")
          : SvgPicture.asset("assets/icons/lightoff.svg"),
          onPressed: toggleLight,
        ),
      ],
    );
  }
}
