import 'package:cashapp/components/BottomMainNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMainNavigationBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image(
              image: AssetImage("images/Rectangle2.png"),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SafeArea(child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "User",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Center(
                      child: Image(
                          image: AssetImage("images/user.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Center(
                    child:  Text(
                      "Isuru Jayawardana",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Row(
                    children: [
                    Text(
                    "Email",
                    style: TextStyle(
                        color: Color.fromRGBO(106, 106, 106, 1),
                        fontSize: 18.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                    ],
                  ),
                  Container(
                    child: TextField(),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Adress",
                        style: TextStyle(
                            color: Color.fromRGBO(106, 106, 106, 1),
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Mobile",
                        style: TextStyle(
                            color: Color.fromRGBO(106, 106, 106, 1),
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    child: TextField(),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: [
                      Text("Settings",
                        style: TextStyle(
                            color: Color.fromRGBO(106, 106, 106, 1),
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 9.0,
                  ),
                  Row(
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              Text("Clear",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                              Text("Data",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(146, 216, 153, 1),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        height: 66.0,
                        width: 129.0,
                      ),
                      SizedBox(
                        width: 82.0,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              Text("Clear",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                              Text("Cache",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(146, 216, 153, 1),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        height: 66.0,
                        width: 129.0,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Row(
                    children: [
                      Text("App version : 0.01",
                        style: TextStyle(
                            color: Color.fromRGBO(106, 106, 106, 1),
                            fontSize: 13.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ),
          ],
        ),

      ),

    );
  }
}
