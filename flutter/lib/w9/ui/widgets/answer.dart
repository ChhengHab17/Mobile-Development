import 'package:flutter/material.dart';
import '../../model/answer.dart';

class AnswerWidget extends StatelessWidget {
  final Answer answer;
  final int questionNumber;

  const AnswerWidget({
    super.key,
    required this.answer,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    bool isCorrect = answer.isGoodAnswer();
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question number circle
          CircleAvatar(
            radius: 16,
            backgroundColor: isCorrect ? Colors.green[400] : Colors.red,
            child: Text(
              '$questionNumber',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Question and answers
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question title
                Text(
                  answer.question.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Display all choices with checkmarks
                ...answer.question.choices.map((choice) {
                  bool isUserAnswer = choice == answer.answerChoice;
                  bool isCorrectAnswer = choice == answer.question.goodChoice;
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: (isUserAnswer && isCorrectAnswer) 
                              ? Colors.green[400]
                              : (isUserAnswer && !isCorrectAnswer)
                                  ? Colors.red
                                  : (isCorrectAnswer)
                                      ? Colors.green[400]
                                      : Colors.transparent,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            choice,
                            style: TextStyle(
                              color: (isUserAnswer && isCorrectAnswer)
                                  ? Colors.green[400]
                                  : (isUserAnswer && !isCorrectAnswer)
                                      ? Colors.red
                                      : (isCorrectAnswer)
                                          ? Colors.green
                                          : Colors.black,
                              fontWeight: (isUserAnswer || isCorrectAnswer)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}