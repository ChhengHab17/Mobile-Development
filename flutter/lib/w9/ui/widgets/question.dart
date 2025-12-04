import 'package:first_app/w9/model/question.dart';
import 'package:first_app/w9/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final Function(String) onAnswerSelected;
  const QuestionCard({
    super.key,
    required this.question,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ...question.choices.map(
              (answer) =>
                  AppButton(answer, onTap: () => onAnswerSelected(answer)),
            ),
          ],
        ),
      ),
    );
  }
}
