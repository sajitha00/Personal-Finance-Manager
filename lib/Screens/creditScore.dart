import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cashapp/components/BottomMainNavigationBar.dart';
import 'package:cashapp/components/CustomizedAppBar.dart';
import 'package:cashapp/components/PrimaryTextComponent.dart';
import 'package:cashapp/components/PrimaryContainer.dart';
import 'package:cashapp/components/SecondaryContainer.dart';
import 'package:cashapp/backend/database_helper.dart';

class CreditScore extends StatefulWidget {
  const CreditScore({Key? key}) : super(key: key);

  @override
  _CreditScoreState createState() => _CreditScoreState();
}

Future<double> calculateCreditScore() async {
  try {
    final dbHelper = DatabaseHelper.instance;
    int? debtsCount = await dbHelper.countDebtsRecords();
    int? paidCount = await dbHelper.countPaidRecords();
    double paymentHistoryScore = (paidCount ?? 0) / (debtsCount ?? 1) * 100;
    return paymentHistoryScore > 100 ? 100 : paymentHistoryScore;
  } catch (e) {
    throw Exception('Failed to calculate credit score: $e');
  }
}

class _CreditScoreState extends State<CreditScore> {
  int? debtsCount = 0;
  int? paidCount = 0;

  @override
  void initState() {
    super.initState();
    _loadCounts();
  }

  Future<void> _loadCounts() async {
    final dbHelper = DatabaseHelper.instance;
    try {
      debtsCount = await dbHelper.countDebtsRecords();
      paidCount = await dbHelper.countPaidRecords();
      setState(() {});
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMainNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomizedAppBar(
          headingText: "Credit Score",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
            child: Column(
              children: [
                PrimaryTextComponent(
                  textStatement: "This Week",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 30.0),
                PrimaryContainer(
                  componentWidgets: Column(
                    children: [
                      Text(
                        "Debts you have paid",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        "${paidCount ?? 0}/${debtsCount ?? 0}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                PrimaryTextComponent(
                  textStatement: "Your Score",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 30.0),
                FutureBuilder<double>(
                  future: calculateCreditScore(),
                  builder:
                      (BuildContext context, AsyncSnapshot<double> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        children: [
                          PrimaryTextComponent(
                            textStatement:
                                "${snapshot.data?.toStringAsFixed(2) ?? '0.00'}%",
                            fontFamily: "PoetsenOne",
                            fontSize: 64.0,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 30.0),
                        ],
                      );
                    }
                  },
                ),
                SizedBox(height: 30.0),
                Divider(color: Colors.black, thickness: 1.2),
                SizedBox(height: 10.0),
                Container(
                  height: 74,
                  width: 335,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 231, 191, 1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 12,
                    ),
                    child: Column(
                      children: [
                        FutureBuilder<double>(
                          future: calculateCreditScore(),
                          builder: (BuildContext context,
                              AsyncSnapshot<double> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return FittedBox(
                                child: PrimaryTextComponent(
                                  textStatement: snapshot.data! < 50
                                      ? "It seems like you're behind. Let's work on that!"
                                      : "Well done, you are keeping up",
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                            }
                          },
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
                SizedBox(height: 30.0),
                Text(
                  "Tip: Pay your upcoming debts to get your credit score up!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
