import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  FOOD(icon: Icons.free_breakfast),
  TRAVEL(icon: Icons.travel_explore),
  LEISURE(icon: Icons.holiday_village),
  WORK(icon: Icons.work);

  final IconData icon;
  const Category({required this.icon});
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
