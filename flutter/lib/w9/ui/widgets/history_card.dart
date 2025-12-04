import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/submission.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.percentage,
    required this.score,
    required this.total,
    required this.submission,
  });

  final double percentage;
  final int score;
  final int total;
  final Submission submission;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: percentage >= 70
              ? Colors.green
              : percentage >= 50
                  ? Colors.orange
                  : Colors.red,
          child: Text(
            '${percentage.toStringAsFixed(0)}%',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          '$score / $total',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat('MMM dd, yyyy - hh:mm a')
              .format(submission.date),
        ),
      ),
    );
  }
}