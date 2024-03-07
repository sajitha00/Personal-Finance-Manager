import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cashapp/components/BottomMainNavigationBar.dart';
import 'package:cashapp/components/PrimaryTextComponent.dart';
import 'package:cashapp/components/CustomizedAppBar.dart';
import 'package:cashapp/components/PrimaryContainer.dart';
import 'package:cashapp/components/SecondaryContainer.dart';
import 'package:flutter/widgets.dart';


class MyDebts extends StatelessWidget {
  const MyDebts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMainNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: CustomizedAppBar(
            headingText: "My Debts"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 25.0,
                    left: 25.0,
                    bottom: 25.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          PrimaryTextComponent(
                            textStatement: "Add New Debt",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        children: [
                          PrimaryContainer(
                            componentWidgets: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    PrimaryTextComponent(
                                      textStatement: "Debts",
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 45
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 42,
                                            height: 42,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(color: Color.fromRGBO(0, 125, 13, 1)),
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: TextButton(
                                                onPressed: (){},
                                                child: Text("+",
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(0, 125, 13, 1),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Container(
                                            width: 42,
                                            height: 42,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(color: Color.fromRGBO(0, 125, 13, 1)
                                              ),
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: TextButton(
                                                onPressed: (){},
                                                child: Text("X",
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(0, 125, 13, 1),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 80.0,
                                          ),
                                          Text(
                                            "Rs",
                                            style: TextStyle(
                                                color: Color.fromRGBO(0, 0, 0, 1),
                                                fontSize: 25.0,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 5,

                                          ),
                                          SizedBox(
                                            width: 100,
                                            height:60,
                                            child: TextField(
                                              style: TextStyle(color: Colors.black,fontSize: 22.0,fontWeight:FontWeight.w600),
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: "0",
                                                hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,

                                ),
                  OutlinedButton(
                    onPressed: () {},
                    child: PrimaryTextComponent(
                      textStatement: "Select Due date",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 3.0, color: Color.fromRGBO(0, 125, 13, 1)
                      ),
                    ),
                     ),
                              IconButton.outlined(
                                color: Color.fromRGBO(0, 125, 13, 1),
                                  onPressed:(){},
                                  icon: Icon(Icons.check),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(width: 2, color: Color.fromRGBO(0, 125, 13, 1))
                                ),
                              ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            children: [
                              PrimaryTextComponent(
                                textStatement: "My upcoming Debts",
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          SecondaryContainer(
                            componentWidgets: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    PrimaryTextComponent(
                                      textStatement: "Due Monday 25th",
                                      fontWeight:FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    PrimaryTextComponent(
                                      textStatement: "35,000",
                                      fontWeight:FontWeight.w400,
                                      fontSize: 40.0,
                                    ),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(width: 3.0, color: Color.fromRGBO(170, 122, 0, 1),
                                        ),
                                      ),
                                        onPressed: (){},
                                        child:PrimaryTextComponent(
                                          textStatement: "Paid",
                                          fontWeight:FontWeight.w400,
                                        ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [SecondaryContainer(
                          componentWidgets: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PrimaryTextComponent(
                                    textStatement: "Due Monday 25th",
                                    fontWeight:FontWeight.w400,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PrimaryTextComponent(
                                    textStatement: "5,000",
                                    fontWeight:FontWeight.w400,
                                    fontSize: 40.0,
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(width: 3.0, color: Color.fromRGBO(170, 122, 0, 1),
                                      ),
                                    ),
                                    onPressed: (){},
                                    child:PrimaryTextComponent(
                                      textStatement: "Paid",
                                      fontWeight:FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ],
                      )
                    ],
                  ),
                )
            )
          ],
        ),

      ),
    );
  }
}
