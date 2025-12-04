import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../model/quiz.dart';

class QuizRepository {
  static const String _fileName = 'quiz_data.json';

  // Get file path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }
  Future<Quiz> loadQuiz() async {
    try {
      final file = await _localFile;
      
      if (await file.exists()) {
        String contents = await file.readAsString();
        Map<String, dynamic> jsonData = jsonDecode(contents);
        return Quiz.fromJson(jsonData);
      }
    } catch (e) {
      print('Error loading quiz from file: $e');
    }

    // Fallback to assets
    try {
      String jsonString = await rootBundle.loadString('assets/data/quiz.json');
      Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return Quiz.fromJson(jsonData);
    } catch (e) {
      return _getDefaultQuiz();
    }
  }

  // Fallback default quiz
  Quiz _getDefaultQuiz() {
    return Quiz(
      answers: [],
      questions: [],
      submissions: [],
    );
  }

  // Save quiz to file
  Future<void> saveQuiz(Quiz quiz) async {
    try {
      final file = await _localFile;
      String jsonString = jsonEncode(quiz.toJson());
      await file.writeAsString(jsonString);
    } catch (e) {
      print('❌ Error saving quiz: $e');
    }
  }
}
