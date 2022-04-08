import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:robot/pages/home/home.dart';
import 'constants/constants.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final cam = cameras.reversed.first;

  runApp(MaterialApp(
    title: 'robot',
    theme: ThemeData(
      primarySwatch: kPrimaryColor,
    ),
    home: Home(title: 'Barsso Wig', camera: cam),
  ));
}

