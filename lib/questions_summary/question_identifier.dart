// Importing necessary Flutter package
import 'package:flutter/material.dart';

// QuestionIdentifier widget, a StatelessWidget that shows the question number and whether the answer is correct
class QuestionIdentifier extends StatelessWidget {
  // Constructor accepting the correctness of the answer and the index of the question
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer, // Boolean to indicate if the user's answer is correct
    required this.questionIndex, // Index of the current question
  });

  // The index of the question and whether the answer is correct are passed as final fields
  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    // The question number is derived by adding 1 to the zero-based index
    final questionNumber = questionIndex + 1;

    return Container(
      width: 30, // Set width for the container
      height: 30, // Set height for the container
      alignment: Alignment
          .center, // Align the content (text) in the center of the container
      decoration: BoxDecoration(
        // Set the background color based on whether the answer is correct or not
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 37, 121, 71) // Green if correct
            : const Color.fromARGB(255, 144, 61, 72), // Red if incorrect
        borderRadius: BorderRadius.circular(
            100), // Circular shape to make it look like a circle
      ),
      child: Text(
        questionNumber.toString(), // Display the question number
        style: const TextStyle(
          fontWeight: FontWeight.bold, // Bold font for emphasis
          color: Colors.black, // Black text color
        ),
      ),
    );
  }
}
