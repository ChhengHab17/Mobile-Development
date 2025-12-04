import 'package:first_app/w9/ui/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import '../model/quiz.dart';
import '../data/quiz_repository.dart';

final QuizRepository quizRepository = QuizRepository();

enum ScreenState { welcome, question, result, history }

class QuizApp extends StatefulWidget {
  final Quiz quiz;
  const QuizApp({super.key, required this.quiz});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  ScreenState screenState = ScreenState.welcome;

  void changeScreenState(ScreenState newState) {
    setState(() {
      screenState = newState;
    });
  }
  
  void startQuiz() {
    widget.quiz.answers.clear();
    changeScreenState(ScreenState.question);
  }
  
  Future<void> finishQuiz() async{
    widget.quiz.saveSubmission();
    await quizRepository.saveQuiz(widget.quiz);
    changeScreenState(ScreenState.result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: switch (screenState) {
          ScreenState.welcome => WelcomeScreen(
            onStart: startQuiz,
            onViewHistory: () => changeScreenState(ScreenState.history),
          ),
          ScreenState.question => QuestionScreen(
            quiz: widget.quiz,
            onFinish: finishQuiz,
          ),
          ScreenState.result => ResultScreen(
            quiz: widget.quiz,
            onRestart: () {
              changeScreenState(ScreenState.welcome);
            },
            onViewHistory: () => changeScreenState(ScreenState.history),
          ),
          ScreenState.history => HistoryScreen(quiz: widget.quiz, onBack: () => changeScreenState(ScreenState.welcome)),
        },
      ),
    );
  }
}
