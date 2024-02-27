import 'package:flutter/material.dart';

class CustomizedAppBar extends StatelessWidget {
  late String headingText;

  CustomizedAppBar({super.key, headingText}) {
    this.headingText = headingText;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        headingText,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400),
      ),
      flexibleSpace: Transform.translate(
        offset: Offset(0, 0),
        child: Transform.scale(
          scale: 1.0,
          child: Image(
            image: AssetImage(
              'images/Rectangle2.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
