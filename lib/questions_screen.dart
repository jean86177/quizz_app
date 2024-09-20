// Import necessary packages
import 'package:flutter/material.dart'; // Widgets for Flutter Material Design
import 'package:quizz_app/answer_button.dart'; // Import the AnswerButton widget
import 'package:quizz_app/data/questions.dart'; // Import quiz questions
import 'package:google_fonts/google_fonts.dart'; // Google Fonts for custom text styling

// Declaration of the QuestionScreen widget, which is a StatefulWidget
class QuestionScreen extends StatefulWidget {
  // Constant constructor with a callback for handling answer selection
  const QuestionScreen({
    super.key,
    required this.onSelectedAnswer, // Function called when an answer is selected
  });

  final void Function(String answer) onSelectedAnswer; // Callback function

  @override
  State<QuestionScreen> createState() {
    // Creates the state associated with this widget
    return _QuestionScreenState();
  }
}

// Declaration of the private state associated with QuestionScreen
class _QuestionScreenState extends State<QuestionScreen> {
  // Index of the current question
  var currentQuestionIndex = 0;

  // Method called when the user selects an answer
  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(
        selectedAnswer); // Calls the function passed by the parent
    setState(() {
      currentQuestionIndex++; // Move to the next question
    });
  }

  @override
  Widget build(context) {
    // Retrieve the current question based on the index
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // The widget takes up the full available width
      child: Container(
        margin: const EdgeInsets.all(40), // Margins around the content
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretch children horizontally
          children: [
            // Display the question text
            Text(
              currentQuestion.text, // The question's text
              style: GoogleFonts.lato(
                  // Use the Lato font
                  color: Colors.white, // Text color
                  fontSize: 24, // Font size
                  fontWeight: FontWeight.bold), // Bold text
              textAlign: TextAlign.center, // Center the text
            ),
            const SizedBox(
                height:
                    30), // Vertical spacing between the question and answers
            // Display answer buttons in a loop
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer, // Text of the answer
                onTap: () {
                  answerQuestion(
                      answer); // Function called when an answer is selected
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
