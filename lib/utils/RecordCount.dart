import 'package:flutter/material.dart';
import 'package:cashapp/backend/database_helper.dart';

class RecordCountWidget extends StatefulWidget {
  @override
  _RecordCountWidgetState createState() => _RecordCountWidgetState();
}

class _RecordCountWidgetState extends State<RecordCountWidget> {
  int? debtsCount = 0; // Changed from int to int?
  int? paidCount = 0; // Changed from int to int?

  @override
  void initState() {
    super.initState();
    _loadCounts();
  }

  Future<void> _loadCounts() async {
    final dbHelper = DatabaseHelper.instance;
    debtsCount = await dbHelper.countDebtsRecords();
    paidCount = await dbHelper.countPaidRecords();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Counts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Debts Count: ${debtsCount ?? 0}'), // Use null-aware operator to display 0 if debtsCount is null
            SizedBox(height: 20),
            Text(
                'Paid Count: ${paidCount ?? 0}'), // Use null-aware operator to display 0 if paidCount is null
          ],
        ),
      ),
    );
  }
}
