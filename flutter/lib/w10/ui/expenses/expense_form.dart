import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  final Function(Expense) onCreatecallback;
  const ExpenseForm({super.key, required this.onCreatecallback});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? date;
  Category selectedType = Category.FOOD;
  void setType(value) {
    setState(() {
      selectedType = value!;
    });
  }

  Future<void> pickDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (newDate == null) return;
    setState(() {
      date = newDate;
    });
  }

  void onCreate() {
    // 1 - Create the new expense

    String title = _titleController.text;
    double? amount = double.tryParse(_amountController.text);

    if (title.isEmpty) {
      _showErrorDialog("Invalid Input", "Title can not be empty");
      return;
    }
    if (amount == null) {
      _showErrorDialog("Error!!", "Invalid Amount input");
      return;
    }
    if (amount < 0) {
      _showErrorDialog("Invalid Input", "Amount can not be negative");
      return;
    }
    if (date == null) {
      _showErrorDialog("Invalid Input", "Date cannot be empty");
      return;
    }

    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date!,
      category: selectedType,
    );

    // 2  - Forward the new expense to the parent
    widget.onCreatecallback(newExpense);
    // 3- Close the modal
    Navigator.pop(context);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    date == null
                        ? Text("No Date Selected")
                        : Text(DateFormat('MM/dd/yyyy').format(date!)),
                    IconButton(
                      onPressed: pickDate,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: DropdownButton<Category>(
                  value: selectedType,
                  isExpanded: true,
                  items: Category.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.toString().split('.').last),
                    );
                  }).toList(),
                  onChanged: setType,
                ),
              ),

              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCancel,
                          child: Text("Cancel"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCreate,
                          child: Text("Create"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
