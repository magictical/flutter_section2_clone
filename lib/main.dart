import 'package:flutter/material.dart';
import 'package:section2_expenseapp_clone/widgets/new_transaction.dart';
import './widgets/chart.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly eateries ',
      amount: 15.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Weekly eateries ',
      amount: 15.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Weekly eateries ',
      amount: 15.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Weekly eateries ',
      amount: 15.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Weekly eateries ',
      amount: 15.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransAction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
        actions: <Widget>[Icon(Icons.add)],
      ),
      body: SingleChildScrollView(
        child: Column(
          // chart
          children: <Widget>[
            Chart(),
            TransactionList(_userTransactions),
          ],
          // transaction_list
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
