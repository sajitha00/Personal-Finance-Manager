import 'package:flutter/material.dart';
import 'package:cashapp/backend/database_helper.dart'; // Adjust the import path as necessary

class PaidListScreen extends StatefulWidget {
  @override
  _PaidListScreenState createState() => _PaidListScreenState();
}

class _PaidListScreenState extends State<PaidListScreen> {
  final DatabaseHelper db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Paid Debts'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: db
            .fetchAllPaid(), // Assuming fetchAllPaid returns a Future<List<Map<String, dynamic>>>
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final paidItem = snapshot.data?[index];
                return ListTile(
                  title: Text("Amount Paid: ${paidItem?['amount']}"),
                  subtitle: Text("Date: ${paidItem?['date']}"),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
