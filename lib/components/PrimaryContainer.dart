import "package:flutter/material.dart";

  class PrimaryContainer extends StatelessWidget {
  Color componentColor = Color(0xff92D899);
  Widget? componentWidgets;

  PrimaryContainer({this.componentWidgets});

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
