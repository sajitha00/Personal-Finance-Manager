import "package:cashapp/Screens/addDetails.dart";
import "package:cashapp/Screens/creditScore.dart";
import "package:cashapp/Screens/details.dart";
import "package:cashapp/Screens/report.dart";
import "package:cashapp/Screens/user.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:cashapp/Screens/DebtsListScreen.dart';
import "package:flutter/widgets.dart";

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return DebtsListScreen();
                    }));
                  },
                  child: Container(
                      height: 111,
                      width: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFEDBF),
                            Color(0xFF92D899),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Debts",
                          style: TextStyle(
                              color: Color.fromARGB(106, 106, 106, 1),
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ReportScreen();
                    }));
                  },
                  child: Container(
                      height: 111,
                      width: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFEDBF),
                            Color(0xFF92D899),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Report",
                          style: TextStyle(
                              color: Color.fromARGB(106, 106, 106, 1),
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return DetailsScreen();
                    }));
                  },
                  child: Container(
                      height: 111,
                      width: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFEDBF),
                            Color(0xFF92D899),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Budget",
                          style: TextStyle(
                              color: Color.fromARGB(106, 106, 106, 1),
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return CreditScore();
                    }));
                  },
                  child: Container(
                      height: 111,
                      width: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFEDBF),
                            Color(0xFF92D899),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Credit",
                          style: TextStyle(
                              color: Color.fromARGB(106, 106, 106, 1),
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return User();
                    }));
                  },
                  child: Container(
                      height: 111,
                      width: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFEDBF),
                            Color(0xFF92D899),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Settings",
                          style: TextStyle(
                              color: Color.fromARGB(106, 106, 106, 1),
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return AddDetails();
                    }));
                  },
                  child: Container(
                      height: 111,
                      width: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFEDBF),
                            Color(0xFF92D899),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "ADD",
                          style: TextStyle(
                              color: Color.fromARGB(106, 106, 106, 1),
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
