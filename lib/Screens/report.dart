import 'package:cashapp/components/BottomMainNavigationBar.dart';
import 'package:cashapp/components/CustomizedAppBar.dart';
import 'package:cashapp/components/GradientText.dart';
import 'package:cashapp/components/PrimaryContainer.dart';
import 'package:cashapp/components/PrimaryTextComponent.dart';
import 'package:cashapp/components/SecondaryContainer.dart';
import 'package:flutter/material.dart';
import 'package:cashapp/components/BarChart.dart';
import 'package:cashapp/data/expencesvsincome.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({
    super.key,
  });

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  List<ExpensesVsIncome>? _chartData;

  @override
  void initState() {
    _chartData = ExpensesVsIncome.getExpenseVsIncome();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMainNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomizedAppBar(
          headingText: "Report",
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    BarChart(chartData: _chartData),
                    SizedBox(
                      height: 5.0,
                    ),
                    PrimaryContainer(
                      componentWidgets: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryTextComponent(
                                textStatement: "Income",
                                fontColor: Color(0xFF007D0D),
                              ),
                              PrimaryTextComponent(
                                textStatement: "35,000",
                                fontSize: 35.0,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          GradientText(
                            text: ">",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF007D0D),
                                Color(0xFFAA7A00),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              PrimaryTextComponent(
                                textStatement: "Expences",
                                fontColor: Color(0xFFAA7A00),
                              ),
                              PrimaryTextComponent(
                                textStatement: "11,000",
                                fontSize: 35.0,
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
                      componentWidgets: Text(
                        "Great! you are getting better at saving money",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
