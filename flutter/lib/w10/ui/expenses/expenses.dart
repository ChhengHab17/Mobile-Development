import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';
import 'expense_form.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() {
    return _ExpensesViewState();
  }
}

class _ExpensesViewState extends State<ExpensesView> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.WORK,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.LEISURE,
    ),
  ];
  void onAddClicked(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (c) =>
          Center(child: ExpenseForm(onCreatecallback: createExpense)),
    );
  }

  void createExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void onDismissed(Expense expense) {
    setState(() {
      _expenses.remove(expense);
    });
    _showSnackBar("Deleting Expense!", expense);
  }
  void _showSnackBar(String message, Expense expense) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => createExpense(expense),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _expenses.isEmpty
          ? Center(child: Text("No Expense Found, Try adding some"))
          : ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) => ExpenseItem(
                expense: _expenses[index],
                onDismissed: () => onDismissed(_expenses[index]),
              ),
            ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final VoidCallback onDismissed;
  const ExpenseItem({
    super.key,
    required this.expense,
    required this.onDismissed,
  });

  final Expense expense;

  IconData get expenseIcon {
    switch (expense.category) {
      case Category.FOOD:
        return Icons.free_breakfast;
      case Category.TRAVEL:
        return Icons.travel_explore;
      case Category.LEISURE:
        return Icons.holiday_village;
      case Category.WORK:
        return Icons.work;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(expense.id),
      onDismissed: (direction) => onDismissed(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expense.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("${expense.amount.toStringAsPrecision(2)} \$"),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(expenseIcon),
                    ),
                    Text(DateFormat('MM/dd/yyyy').format(expense.date)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
