import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'ui/quiz_app.dart';
import 'data/quiz_repository.dart';
 
void main() async{

  // 1 - Load the quiz data
  WidgetsFlutterBinding.ensureInitialized();
  QuizRepository quizRepository = QuizRepository();
  Quiz quiz = await quizRepository.loadQuiz(); // Default quiz
  

  // 2 - Display the quiz
  runApp(QuizApp(quiz: quiz));
}
