import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transactions.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionData = Provider.of<Transactions>(context);
    final transactions = transactionData.transactions;

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(transactions[index].title),
          subtitle: Text(transactions[index].category),
          trailing: Text('\Rs${transactions[index].amount.toStringAsFixed(2)}'),
        );
      },
    );
  }
}
