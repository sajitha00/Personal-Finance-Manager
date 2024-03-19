import "package:flutter/material.dart";

class SecondaryContainer extends StatelessWidget {
  Color? componentColor = Color(0xffFFEDBF);
  Widget? componentWidgets;

  SecondaryContainer({this.componentWidgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: componentColor),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: componentWidgets,
      ),
    );
  }
}
