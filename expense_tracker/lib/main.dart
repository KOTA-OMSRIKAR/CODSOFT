import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/transactions.dart';
import 'screens/home_screen.dart';

void main() => runApp(ExpenseTrackerApp());

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Transactions(),
      child: MaterialApp(
        title: 'Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
