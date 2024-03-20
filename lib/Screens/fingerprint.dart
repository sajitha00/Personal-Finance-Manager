import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'home.dart'; // Import the HomeScreen class

class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  _FingerPrintState createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    _authenticateWithBiometrics();
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
      return;
    }

    if (authenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage("images/Rectangle2.png"),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "Hello! User",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Prove us that it’s really you",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: 264,
                              height: 264,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(170, 122, 0, 0.05)),
                            ),
                            Container(
                              width: 214,
                              height: 214,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(170, 122, 0, 0.05)),
                            ),
                            Container(
                              width: 144,
                              height: 144,
                              child: IconButton(
                                icon: Icon(Icons.fingerprint),
                                onPressed: _authenticateWithBiometrics,
                                iconSize: 90,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(170, 122, 0, 0.05)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 54.0,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Set your finger on the scanner",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
