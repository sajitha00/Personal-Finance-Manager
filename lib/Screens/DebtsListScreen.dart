import 'package:flutter/material.dart';
import 'package:cashapp/backend/database_helper.dart';
import 'package:cashapp/components/PrimaryTextComponent.dart';
import 'package:cashapp/components/SecondaryContainer.dart';
import 'package:cashapp/components/CustomizedAppBar.dart';
import 'package:cashapp/components/PrimaryContainer.dart';
import 'package:cashapp/components/BottomMainNavigationBar.dart'; // Import the BottomMainNavigationBar

class DebtsListScreen extends StatefulWidget {
  @override
  _DebtsListScreenState createState() => _DebtsListScreenState();
}

class _DebtsListScreenState extends State<DebtsListScreen> {
  DateTime? _selectedDate;
  final TextEditingController _amountController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _handleIconButtonPress() {
    if (_selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Date Selection Required"),
          content: const Text("Please select a due date before proceeding."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } else {
      if (_amountController.text.isEmpty ||
          double.tryParse(_amountController.text) == null) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Invalid Amount"),
            content: const Text("Please enter a valid amount."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else {
        double _amount = double.parse(_amountController.text);
        DatabaseHelper.instance.insertDebt({
          DatabaseHelper.columnAmount: _amount,
          DatabaseHelper.columnDate: _selectedDate.toString(),
        });
        _amountController.clear();
        setState(() {});
      }
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: CustomizedAppBar(headingText: "My Debts"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: PrimaryContainer(
              componentWidgets: Column(
                children: [
                  Row(
                    children: [
                      PrimaryTextComponent(
                        textStatement: "Add New Debt",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "0",
                            hintStyle:
                                TextStyle(fontSize: 22.0, color: Colors.black),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () => _selectDate(context),
                        child: PrimaryTextComponent(
                          textStatement: "Select Due date",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 3.0,
                            color: Color.fromRGBO(0, 125, 13, 1),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: _handleIconButtonPress,
                        icon: Icon(Icons.check),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverFillRemaining(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: DatabaseHelper.instance.fetchAllDebts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final debt = snapshot.data![index];
                      return SecondaryContainer(
                        componentWidgets: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PrimaryTextComponent(
                                  textStatement:
                                      "Due ${debt[DatabaseHelper.columnDate]}",
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PrimaryTextComponent(
                                  textStatement:
                                      "${debt[DatabaseHelper.columnAmount]}",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40.0,
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      width: 3.0,
                                      color: Color.fromRGBO(170, 122, 0, 1),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: PrimaryTextComponent(
                                    textStatement: "Paid",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMainNavigationBar(), // Corrected method name
      // Add the BottomMainNavigationBar here
    );
  }
}
