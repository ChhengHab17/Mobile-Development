import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() {
  try {
    final provider = QuizRepository(filePath: 'quiz.json');
    final quiz = provider.loadQuiz();
    
    final console = QuizConsole(quiz: quiz);
    console.startQuiz();
    
    provider.saveQuiz(quiz);
    print('\nQuiz data saved to file.');
    
  } catch (e) {
    print('Error: $e');
  }
}
