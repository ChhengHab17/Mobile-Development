import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

 class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onViewHistory;
  
  const WelcomeScreen({super.key, required this.onStart, required this.onViewHistory});
   
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/w9/quiz-logo.png",
            ),
            Spacer(),
            AppButton(icon: Icons.play_arrow, "Start Quiz", onTap: onStart),
            SizedBox(height: 16),
            AppButton(icon: Icons.history, "View History", onTap: onViewHistory),

          ],
        ),
      ),
    );
  }
}
 
