import 'package:flutter/material.dart';
import '../widgets/expense_summary.dart';
import '../widgets/transaction_list.dart';
import 'add_transaction_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        children: <Widget>[
          ExpenseSummary(),
          Expanded(
            child: TransactionList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              return AddTransactionScreen();
            }),
          );
        },
      ),
    );
  }
}
