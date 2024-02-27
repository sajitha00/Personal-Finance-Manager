import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:cashapp/components/BottomMainNavigationBar.dart";
import "package:cashapp/components/CustomizedAppBar.dart";
import 'package:cashapp/components/PrimaryTextComponent.dart';
import 'package:cashapp/components/PrimaryContainer.dart';
import 'package:cashapp/components/SecondaryContainer.dart';
class CreditScore extends StatelessWidget {
  const CreditScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomMainNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomizedAppBar(
          headingText: "Credit Scroe",
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
                child:Padding(
        padding: EdgeInsets.only(
          right: 25.0,
          left: 25.0,
          bottom: 25.0,
        ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 50.0,
                          ),
                          PrimaryTextComponent(
                            textStatement: "This Week",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          PrimaryContainer(
                            componentWidgets: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Debts you have paid",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text(
                                  "10/18",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 40.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 50.0,
                              ),
                              PrimaryTextComponent(
                                textStatement: "Your Score",
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              PrimaryTextComponent(
                                textStatement: "90%",
                                fontFamily: "PoetsenOne",
                                fontSize: 64.0,
                                fontWeight: FontWeight.w400,
                              ),
                              Divider(
                                color: Colors.black,
                                thickness:1.2,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 74,
                                width: 335,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 231, 191,1,),
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      PrimaryTextComponent(
                                        textStatement: "Well done your are keeping up",
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      PrimaryTextComponent(
                                        textStatement: "this week",
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              Text(
                                "Tip,Pay tour upcoming debts to",
                                style: TextStyle(
                                    color: Color.fromRGBO(106, 106, 106, 1),
                                    fontSize: 14.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "get your credit score up!",
                                style: TextStyle(
                                    color: Color.fromRGBO(106, 106, 106, 1),
                                    fontSize: 14.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
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
