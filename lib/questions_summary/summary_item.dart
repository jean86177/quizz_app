// Import necessary Flutter and Google Fonts packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizz_app/questions_summary/question_identifier.dart'; // Importing the QuestionIdentifier widget

// SummaryItem widget to display a summary of a single question's result
class SummaryItem extends StatelessWidget {
  // Constructor that takes a map containing the question data
  const SummaryItem(this.itemData, {super.key});

  // A map that holds data related to the question, such as question text, user answer, and correct answer
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    // Determine if the user's answer is correct by comparing it to the correct answer
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align items at the start of the row
      children: [
        // QuestionIdentifier widget to show question index and if the answer was correct
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer, // Pass if the answer is correct
          questionIndex:
              itemData['question_index'] as int, // Pass the question index
        ),
        const SizedBox(width: 20), // Add horizontal spacing
        Expanded(
          // Expanded widget to make the following column take up the remaining width
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align content to the start
            children: [
              // Display the question text
              Text(
                itemData['question'] as String, // Question text
                style: GoogleFonts.lato(
                  // Apply Lato font style from Google Fonts
                  color: Colors.white, // White text color
                  fontSize: 16, // Font size
                  fontWeight: FontWeight.bold, // Bold text for emphasis
                ),
              ),
              const SizedBox(
                height: 5, // Add vertical spacing between texts
              ),
              // Display the user's answer in a different color
              Text(
                itemData['user_answer'] as String, // User's selected answer
                style: const TextStyle(
                  color: Color.fromARGB(
                      255, 172, 70, 62), // Red color for incorrect answers
                ),
              ),
              // Display the correct answer in a different color
              Text(
                itemData['correct_answer'] as String, // Correct answer
                style: const TextStyle(
                  color: Color.fromARGB(
                      255, 48, 171, 52), // Green color for correct answers
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
