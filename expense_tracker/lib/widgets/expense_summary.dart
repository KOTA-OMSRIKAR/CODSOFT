import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/transaction.dart';
import '../providers/transactions.dart';

class ExpenseSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<Transactions>(context).transactions;

    double totalAmount = transactions.fold<double>(
      0.0,
      (double sum, Transaction item) => sum + item.amount,
    );

    return Text('Total Amount: \Rs${totalAmount.toStringAsFixed(2)}');
  }
}
