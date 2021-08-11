import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/widgets/user_transaction.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 0.0,
                color: Colors.blue,
                child: Text('CHART !!'),
              ),
            ),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
