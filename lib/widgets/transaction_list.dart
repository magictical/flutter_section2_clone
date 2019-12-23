import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  '\$ ${transaction.amount}',
                ),
              ),
              Column(
                children: <Widget>[
                  Text(transaction.title),
                  Text(DateFormat('yyyy MM/DD').format(transaction.date))
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
