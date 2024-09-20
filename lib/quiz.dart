import 'package:flutter/material.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/results_screen.dart';

// Main Quiz class as a StatefulWidget
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers =
      []; // List to store the user's selected answers
  var activeScreen =
      'start-screen'; // Variable to control which screen is displayed
  int bestScore =
      0; // Variable to store the highest score achieved in the session

  // Function to switch from the start screen to the question screen
  void switchScreen() {
    setState(() {
      activeScreen =
          'questionScreen'; // Set active screen to the question screen
    });
  }

  // Function to handle when an answer is selected
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer); // Add the selected answer to the list

    // If all questions have been answered
    if (selectedAnswers.length == questions.length) {
      // Calculate the current score by counting correct answers
      int currentScore = selectedAnswers.where((answer) {
        int index = selectedAnswers.indexOf(answer);
        return answer ==
            questions[index]
                .answers[0]; // Check if the selected answer is correct
      }).length;

      // Update the best score if the current score is higher
      if (currentScore > bestScore) {
        bestScore = currentScore;
      }

      // Set the active screen to the results screen
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  // Function to restart the quiz
  void restartQuiz() {
    setState(() {
      selectedAnswers = []; // Reset the list of selected answers
      activeScreen =
          'questionScreen'; // Start the quiz again by showing the question screen
    });
  }

  @override
  Widget build(context) {
    // Start with the start screen as the default
    Widget screenWidget = StartScreen(switchScreen);

    // If the active screen is the question screen, display it
    if (activeScreen == 'questionScreen') {
      screenWidget = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    // If the active screen is the results screen, display it
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswers:
            selectedAnswers, // Pass the selected answers to the result screen
        onRestart: restartQuiz, // Pass the restart function
        bestScore: bestScore, // Pass the best score to display
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            // Add a background gradient color to the whole app
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 1, 58, 105),
                Color.fromARGB(255, 0, 70, 2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget, // Display the current screen
        ),
      ),
    );
  }
}
