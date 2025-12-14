import 'package:first_app/w10/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseStatistic extends StatelessWidget {
  final List<Expense> expenses;
  const ExpenseStatistic({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...Category.values.map((c) {
            return CategoryBox(expenses: expenses, category: c);
          }),
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final List<Expense> expenses;
  final Category category;
  const CategoryBox({
    super.key,
    required this.expenses,
    required this.category,
  });

  double calculateTotal() {
    double total = 0;
    for (var e in expenses) {
      if (e.category == category) {
        total += e.amount;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(calculateTotal().toString()),
        SizedBox(height: 3),
        Icon(category.icon),
      ],
    );
  }
}
