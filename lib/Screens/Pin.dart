import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart'; // Import the HomeScreen class from home.dart

class PinLogin extends StatelessWidget {
  const PinLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pinController = TextEditingController();

    void checkPinAndNavigate(BuildContext context, String pin) {
      if (pin == "0000") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // Handle incorrect PIN
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect PIN')),
        );
      }
    }

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
                    SizedBox(height: 30.0),
                    Text(
                      "Hello! User",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Prove us that it’s really you",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: SizedBox(
                              height: 51,
                              width: 317,
                              child: TextField(
                                controller: pinController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  hintText: 'Enter Pin Number',
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => checkPinAndNavigate(
                                context, pinController.text),
                            child: Text('Submit'),
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
