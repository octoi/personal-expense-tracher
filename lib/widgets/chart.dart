import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/widgets/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions);

  List<Map> get groupedTransactionValues {
    return List.generate(7, (idx) {
      final weekDay = DateTime.now().subtract(Duration(days: idx));
      var totalSum = 0.00;

      for (var i = 0; i < recentTransactions.length; i++) {
        Transaction tx = recentTransactions[i];
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return CartBar(
            data['day'],
            data['amount'],
            maxSpending == 0.0 ? 0.0 : data['amount'] / maxSpending,
          );
        }).toList(),
      ),
    );
  }
}
