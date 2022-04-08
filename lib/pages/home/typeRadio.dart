import 'package:flutter/material.dart';

class TypeRadio extends StatefulWidget {
  const TypeRadio({Key? key}) : super(key: key);

  @override
  State<TypeRadio> createState() => _TypeRadioState();
}

enum TYPE { control, follow }

class _TypeRadioState extends State<TypeRadio> {
  TYPE? _type = TYPE.control;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio<TYPE>(
              value: TYPE.control,
              groupValue: _type,
              onChanged: (TYPE? value) {
                setState(() {
                  _type = value;
                });
              },
            ),
            const SizedBox(
              child: SizedBox(
                child: Text('control',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),

          ],
        ),
        Row(
          children: <Widget>[
            Radio<TYPE>(
              hoverColor: Colors.white,
              value: TYPE.follow,
              groupValue: _type,
              onChanged: (TYPE? value) {
                setState(() {
                  _type = value;
                });
              },
            ),
            const SizedBox(
              child: SizedBox(
                child: Text('follow',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),


      ],
    );
  }
}