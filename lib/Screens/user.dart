import 'package:flutter/material.dart';
import 'package:cashapp/components/BottomMainNavigationBar.dart';
import 'package:cashapp/backend/database_helper.dart';// Adjust the import path as necessary

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMainNavigationBar(),
      body: FutureBuilder<Map<String, dynamic>>(
        future: DatabaseHelper.instance.fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading user data'));
          } else {
            final userData = snapshot.data!;
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("images/Rectangle2.png"),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SafeArea(
                    child: Padding(
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
                          IconButton(
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Change Profile Image'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('Browse'),
                                  ),
                                ],
                              ),
                            ),
                            icon: Image.asset("images/user.png"),
                          ),
                          SizedBox(
                            height: 5.0,
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
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(userData[DatabaseHelper.columnEmail]
                                .toString()),
                          ),
                          SizedBox(
                            height: 30.0,
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
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(userData[DatabaseHelper.columnMobile]
                                .toString()),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          // The rest of your UI code remains unchanged
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
