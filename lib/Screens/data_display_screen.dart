import 'package:flutter/material.dart';
import 'package:cashapp/backend/database_helper.dart'; // Adjust the import path as necessary

class DataDisplayScreen extends StatefulWidget {
  const DataDisplayScreen({Key? key}) : super(key: key);

  @override
  _DataDisplayScreenState createState() => _DataDisplayScreenState();
}

class _DataDisplayScreenState extends State<DataDisplayScreen> {
  late Future<List<Map<String, dynamic>>> data;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>>? maps =
        await db?.query(DatabaseHelper.table);
    return maps
            ?.map((map) =>
                map.map((key, value) => MapEntry(key, value as dynamic)))
            .toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Display'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index][DatabaseHelper.columnEmail]
                      .toString()),
                  subtitle: Text(snapshot.data![index]
                          [DatabaseHelper.columnMobile]
                      .toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
