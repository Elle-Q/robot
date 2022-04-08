import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:robot/constants/constants.dart';


class DialButton extends StatefulWidget {
  const DialButton({Key? key}) : super(key: key);

  @override
  State<DialButton> createState() => _DialButtonState();
}

class _DialButtonState extends State<DialButton> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: kPrimaryColor,
      animatedIcon: AnimatedIcons.menu_home,
      children: [
        SpeedDialChild(
          label: '查看拍摄',
            backgroundColor: Colors.black,
          child: Icon(Icons.image, color:Colors.white)
        ),
        SpeedDialChild(
            label: 'elle',
            backgroundColor: Colors.red,
            child: Icon(Icons.person_outline_rounded, color:Colors.white)
        )
      ],
    );
  }
}
