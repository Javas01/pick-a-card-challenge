import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mystery_app/screens/swipe_view/swipe_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.camera});

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mizan\'s 21st Birthday',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SwipeView(camera: camera),
    );
  }
}
