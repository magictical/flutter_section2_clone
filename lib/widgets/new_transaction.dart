import 'package:flutter/material.dart';

class NewTransAction extends StatefulWidget {
  final Function transactionHandler;

  NewTransAction(this.transactionHandler);

  @override
  _NewTransActionState createState() => _NewTransActionState();
}

class _NewTransActionState extends State<NewTransAction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    // data validation
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    // check valid
    if (enteredTitle.isEmpty || enteredAmount < 0 || _selectedDate == null) {
      return;
    }
    widget.transactionHandler(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now())
        .then((pickDate) {
      if (pickDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Title'),
            controller: _titleController,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
          ),
          // always remember Column(Row) is mutually exclusive with Expand(infinite flex)
          // cuz parent want to shrink child's space but child(Expand) want to take space
          // all the way up to it can take
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('date filed'),
                ),
                FlatButton(
                  child: Text('Choose Date'),
                  onPressed: () {
                    _presentDatePicker();
                  },
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              _submitData();
            },
          )
        ],
      ),
    );
  }
}
