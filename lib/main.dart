import 'package:cashapp/Screens/addDetails.dart';
import 'package:cashapp/Screens/creditScore.dart';
import 'package:cashapp/Screens/debts.dart';
import 'package:cashapp/Screens/fingerprint.dart';
import 'package:cashapp/Screens/report.dart';
import 'package:cashapp/Screens/signup.dart';
import 'package:cashapp/Screens/user.dart';
import 'package:cashapp/Screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:cashapp/Screens/details.dart';
import 'package:cashapp/Screens/home.dart';
import 'package:cashapp/Screens/Pin.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

import 'package:cashapp/Screens/data_display_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterSplashScreen(
        duration: const Duration(milliseconds: 200),
        nextScreen: MyDebts(),
        splashScreenBody: Welcome(),
      ),
    ),
  );
}
