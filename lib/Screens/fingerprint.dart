import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:cashapp/components/BottomMainNavigationBar.dart";
class FingerPrint extends StatelessWidget {
  const FingerPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Center(
          child: Stack(
            children: [
              Image(
                image: AssetImage("images/Rectangle2.png"),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SafeArea(
                  child:Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                  color: Color.fromRGBO(170, 122, 0, 0.05)                  ),
                            ),
                            Container(
                              width: 214,
                              height: 214,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(170, 122, 0, 0.05),
                              ),
                            ),
                            Container(
                              width: 144,
                              height: 144,
                              child: IconButton(
                                icon: Icon(Icons.fingerprint),
                                onPressed: (){},
                                iconSize: 90,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:Color.fromRGBO(170, 122, 0, 0.05)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
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
                  )
              )
            ],
              ),
        )
        )
    );
  }
}
