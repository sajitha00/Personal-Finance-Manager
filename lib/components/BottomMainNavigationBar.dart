import 'package:cashapp/Screens/addDetails.dart';
import 'package:cashapp/Screens/home.dart';
import 'package:cashapp/Screens/report.dart';
import 'package:cashapp/Screens/user.dart';
import 'package:cashapp/Screens/DebtsListScreen.dart';
import 'package:flutter/material.dart';

class BottomMainNavigationBar extends StatelessWidget {
  const BottomMainNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0, bottom: 5.0),
      child: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              colors: <Color>[
                Color(0xff007D0D),
                Color(0xffAA7A00),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xff00000040).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedFontSize: 0,
            items: [
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return HomeScreen();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: Image.asset(
                      "images/Home.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                // size: 10,
                label: ("Home"),
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ReportScreen();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: Image.asset(
                      "images/BarChart.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                label: ("BarChart"),
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return DebtsListScreen();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.zero,
                    child: Image.asset(
                      "images/Debt.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                label: ("Debt"),
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return AddDetails();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: Image.asset(
                      "images/Pencil.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                label: ("Pencil"),
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return User();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: Image.asset(
                      "images/MaleUser.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                label: ("User"),
              )
            ],
          )),
    );
  }
}
