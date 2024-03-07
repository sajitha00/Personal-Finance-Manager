import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class PinLogin extends StatelessWidget {
  const PinLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  height: 20.0,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: SizedBox(
                          height: 51,
                          width: 317,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                )
                              ),
                              hintText: 'Enter Pin Number',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                    ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
