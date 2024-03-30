import 'package:cashapp/Screens/addDetails.dart';
import 'package:cashapp/Screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterSplashScreen(
        duration: const Duration(milliseconds: 2),
        nextScreen: AddDetails(),
        splashScreenBody: Welcome(),
      ),
    ),
  );
}
