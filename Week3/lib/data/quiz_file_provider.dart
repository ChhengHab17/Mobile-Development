import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository({required this.filePath});

  Quiz loadQuiz() {
    try {
      final file = File(filePath);
      print('Looking for quiz file at: ${file.absolute.path}');
      if (!file.existsSync()) {
        throw Exception('Quiz file not found: $filePath');
      }

      final content = file.readAsStringSync();
      final jsonData = jsonDecode(content) as Map<String, dynamic>;
      print('Decoded type: ${jsonData.runtimeType}');
      return Quiz.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to load quiz from file: $e');
    }
  }

  void saveQuiz(Quiz quiz) {
    try {
      final file = File(filePath);
      final jsonData = quiz.toJson();
      final jsonString = const JsonEncoder.withIndent('  ').convert(jsonData);
      
      file.writeAsStringSync(jsonString);
    } catch (e) {
      throw Exception('Failed to save quiz to file: $e');
    }
  }
}