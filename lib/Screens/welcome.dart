import 'package:flutter/material.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 125, 13, 1),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(0, 125, 13, 1), Color.fromRGBO(170, 122, 0, 1)],
            )
          ),
          child: Center(
            child: Image(
              width: 370,
              image: AssetImage("images/Logo.png"),
            ),
          ),
        )
    );
  }
}