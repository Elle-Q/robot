import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:robot/pages/home/camController.dart';
import 'package:robot/pages/home/camera.dart';
import 'package:robot/pages/home/moveController.dart';
import 'package:robot/pages/home/sliders.dart';
import 'package:robot/pages/home/video.dart';
import 'package:robot/pages/home/alert.dart';

import '../../constants/constants.dart';
import 'dialButtom.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title, required this.camera}) : super(key: key);

  final String title;
  final CameraDescription camera;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 44, 40,1),
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(widget.title),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/logo.svg"),
            onPressed: () {},
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 10,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
            ),
          Column(
            children: [
              Stack(children: [
                const Video(),
                Camera(camera: widget.camera),
              ]),
            ],
          ),
            // const TypeRadio(),
            const Alert(),
            const Sliders(),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: size.width * 0.5+35,
              child: Stack(
                children: [
                  CamController(size: size),
                  MoveController(size: size),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const DialButton()
    );
  }
}
