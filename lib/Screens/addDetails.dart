import 'package:cashapp/model/budget.dart';
import 'package:flutter/material.dart';
import "package:cashapp/components/BottomMainNavigationBar.dart";
import "package:cashapp/components/CustomizedAppBar.dart";
import 'package:cashapp/components/PrimaryTextComponent.dart';
import 'package:cashapp/components/PrimaryContainer.dart';
import 'package:cashapp/components/SecondaryContainer.dart';
import 'package:cashapp/service/budget_service.dart';
import 'package:cashapp/backend/database_helper.dart';

class AddDetails extends StatefulWidget {
  AddDetails({Key? key}) : super(key: key);

  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {

  var _addDetailsBudgetController = TextEditingController();
  var _addDetailsIncomeController = TextEditingController();
  var _addDetailsExpenseController = TextEditingController();

  var _budget = Budget();
  var _budgetService = BudgetService();


  String budget = '';
  String income = '';
  String expense = '';
  late TextEditingController controller;



  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    Navigator.of(context).pop(controller.text);

    controller.clear();
  }

  Future<String?> addBudget() async {
    String? budget = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Your Budget'),
        content: TextField(
          controller: _addDetailsBudgetController,
          onSubmitted: (_) => submit,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Enter your budget'),
        ),
        actions: [
          TextButton(
            onPressed: ()  {
              final budgetValue = _addDetailsBudgetController.text;
              final weekRange = DateTime.now().toString(); // Example week range
              final result =  DatabaseHelper.instance.insertWeeklyBudget({
                DatabaseHelper.columnWeekRange: weekRange,
                DatabaseHelper.columnBudget: budgetValue,
              });
              if (result != null) {
                Navigator.of(context).pop(); // Close the dialog
              } else {
                // Handle the case where the result is null, if necessary
              }
            },
            child: Text('Submit'),
          ),


          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Close the dialog without any action
            child: Text("Clear"),
          ),
        ],
      ),
    );
    return budget;
  }




  Future<String?> addIncome() async {
    String? budget = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Your Budget'),
        content: TextField(
          controller: _addDetailsIncomeController,
          onSubmitted: (_) => submit,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Enter your income'),
        ),
        actions: [
          TextButton(
            onPressed: ()  {
              final incomeValue = _addDetailsIncomeController.text;
              final weekRange = DateTime.now().toString(); // Example week range
              final result =  DatabaseHelper.instance.insertIncome({
                DatabaseHelper.columnWeekRange: weekRange,
                DatabaseHelper.columnIncome: incomeValue,
              });
              if (result != null) {
                Navigator.of(context).pop(); // Close the dialog
              } else {
                // Handle the case where the result is null, if necessary
              }
            },
            child: Text('Submit'),
          ),


          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Close the dialog without any action
            child: Text("Clear"),
          ),
        ],
      ),
    );
    return budget;
  }


  Future<String?> addExpense() async {
    String? budget = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Your Expense'),
        content: TextField(
          controller: _addDetailsExpenseController,
          onSubmitted: (_) => submit,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Enter your Expense'),
        ),
        actions: [
          TextButton(
            onPressed: ()  {
              final expenseValue = _addDetailsExpenseController.text;
              final weekRange = DateTime.now().toString(); // Example week range
              final result =  DatabaseHelper.instance.insertExpense({
                DatabaseHelper.columnWeekRange: weekRange,
                DatabaseHelper.columnExpense: expenseValue,
              });
              if (result != null) {
                Navigator.of(context).pop(); // Close the dialog
              } else {
                // Handle the case where the result is null, if necessary
              }
            },
            child: Text('Submit'),
          ),


          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Close the dialog without any action
            child: Text("Clear"),
          ),
        ],
      ),
    );
    return budget;
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomMainNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomizedAppBar(
          headingText: "Add Details",
        ),
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
                    Row(
                      children: [
                        PrimaryTextComponent(
                          textStatement: "This Week",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 164.0,
                            width: 340.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color.fromRGBO(0, 125, 13, 1), Color.fromRGBO(170, 122, 0, 1)],
                              ),
                              boxShadow: [
                                BoxShadow(color: Colors.green, spreadRadius: 3),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Budget",
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 40.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 29.5,
                                        left: 13
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 42,
                                          height: 42,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: () async{
                                                final budget = await addBudget();
                                                if (budget == null || budget.isEmpty)
                                                  return ;

                                                setState(() => this.budget = budget);

                                              },
                                              child: Text("+",
                                                style: TextStyle(
                                                  color: Colors.white70,
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
                                            border: Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text("X",
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 75,
                                        ),
                                        Text(
                                          "Rs ",
                                          style: TextStyle(
                                              color: Color.fromRGBO(255, 255, 255, 1),
                                              fontSize: 21.0,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 5,

                                        ),
                                        Text(
                                          budget,
                                          style: TextStyle(
                                              color: Color.fromRGBO(255, 255, 255, 1),
                                              fontSize: 40.0,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400),
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
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Set your budget for this week",
                      style: TextStyle(
                          color: Color.fromRGBO(106, 106, 106, 1),
                          fontSize: 16.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            PrimaryTextComponent(
                              textStatement: "Today",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                    PrimaryContainer(
                      componentWidgets: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryTextComponent(textStatement: "Income"),
                              PrimaryTextComponent(textStatement: "Monday"),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 9.0,
                              left: 13,
                            ),
                            child: Row(
                              children: [


                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Color.fromRGBO(0, 125, 13, 1),),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () async{
                                        final income = await addIncome();
                                        if (income == null || income.isEmpty)
                                          return ;

                                        setState(() => this.income = income);

                                      },
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
                                    border: Border.all(color: Color.fromRGBO(0, 125, 13, 1),),
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
                                  width: 75,
                                ),
                                Text(
                                  "Rs",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 24.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5,

                                ),
                                Text(
                                  income,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 40.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SecondaryContainer(
                      componentWidgets: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryTextComponent(textStatement: "Expences"),
                              PrimaryTextComponent(textStatement: "Monday"),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 9.0,
                              left: 13,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Color.fromRGBO(170, 122, 0, 1)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () async{
                                        final expense = await addExpense();
                                        if (expense == null || expense.isEmpty)
                                          return ;

                                        setState(() => this.expense = expense);

                                      },
                                      child: Text("+",
                                        style: TextStyle(
                                          color: Color.fromRGBO(170, 122, 0, 1),
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
                                    border: Border.all(color: Color.fromRGBO(170, 122, 0, 1)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: (){},
                                      child: Text("X",
                                        style: TextStyle(
                                          color: Color.fromRGBO(170, 122, 0, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 75,
                                ),
                                Text(
                                  "Rs",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 24.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5,

                                ),
                                Text(
                                  expense,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 40.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
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
  void main() {
    runApp(MaterialApp(
      home: AddDetails(),
    ));
  }

}


class BudgetService{

  saveBudget(Budget budget) async {
    print(budget.setbudget);
    print(budget.income);
    print(budget.expense);
  }
}

class Budget{
  late String setbudget;
  late String income;
  late String expense;
}
