import "package:cashapp/components/BottomMainNavigationBar.dart";
import "package:cashapp/components/CustomizedAppBar.dart";
import 'package:cashapp/components/PrimaryContainer.dart';
import 'package:cashapp/components/PrimaryTextComponent.dart';
import 'package:cashapp/components/SecondaryContainer.dart';
import 'package:cashapp/components/homeMenuWidget.dart';
import "package:flutter/material.dart";
import 'package:cashapp/components/GetSectionData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import 'package:cashapp/data/myExpenses.dart';
import 'package:cashapp/components/PieChart.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<MyExpenses> _chartData;

  @override
  void initState() {
    _chartData = MyExpenses.getMyExpense();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMainNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomizedAppBar(
          headingText: "Home",
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(right: 25.0, left: 25.0, bottom: 25.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    HomeMenu(),
                    SizedBox(
                      height: 20.0,
                    ),
                    PrimaryContainer(
                      componentWidgets: Column(
                        children: [
                          Row(
                            children: [
                              PrimaryTextComponent(
                                textStatement: "Save",
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              PrimaryTextComponent(
                                textStatement: "Rs",
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              PrimaryTextComponent(
                                textStatement: "3,000",
                                fontSize: 40.0,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    SecondaryContainer(
                      componentWidgets: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryTextComponent(
                                textStatement: "Your expenses \n reduced by",
                                fontWeight: FontWeight.w500,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PrimaryTextComponent(
                                    textStatement: "10%",
                                    fontSize: 40.0,
                                  ),
                                  PrimaryTextComponent(
                                    textStatement: "This month",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
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
