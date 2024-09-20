import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
    required this.bestScore, // Accepts the best score as a parameter
  });

  final void Function() onRestart; // Function to restart the quiz
  final List<String> chosenAnswers; // List of user's selected answers
  final int bestScore; // Variable to store the best score

  // Method to generate a summary of the quiz results
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i, // Index of the current question
        'question': questions[i].text, // The question text
        'correct_answer': questions[i].answers[0], // The correct answer
        'user_answer': chosenAnswers[i], // The answer selected by the user
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData(); // Get the summary data
    final numTotalQuestions = questions.length; // Total number of questions
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] ==
          data['correct_answer']; // Check correct answers
    }).length; // Number of correct answers

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the user's score
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: GoogleFonts.lato(
                color: Colors.red, // Text color red
                fontSize: 20, // Font size
                fontWeight: FontWeight.bold, // Bold font
              ),
              textAlign: TextAlign.center, // Center-align the text
            ),
            const SizedBox(height: 30),

            // Display the best score
            Text(
              'Best Score: $bestScore',
              style: GoogleFonts.lato(
                color: Colors.green, // Text color green
                fontSize: 20, // Font size
                fontWeight: FontWeight.bold, // Bold font
              ),
              textAlign: TextAlign.center, // Center-align the text
            ),
            const SizedBox(height: 30),

            // Display the summary of all questions and answers
            QuestionsSummary(summaryData),

            const SizedBox(height: 30),

            // Button to restart the quiz
            TextButton.icon(
              onPressed: onRestart, // Calls the onRestart function when pressed
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh), // Icon for the button
              label: const Text('Restart Quiz'), // Button label text
            ),
          ],
        ),
      ),
    );
  }
}
