//good
// Import necessary Flutter and Google Fonts packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Declaration of StartScreen widget, a StatelessWidget
class StartScreen extends StatelessWidget {
  // Constructor that accepts a function to start the quiz
  const StartScreen(this.startQuiz, {super.key});

  // Function that is called to start the quiz
  final void Function() startQuiz;

  @override
  Widget build(context) {
    // Build method to create the user interface
    return Center(
      // Center the content vertically and horizontally
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Minimizes the column size to fit its children
        children: [
          const SizedBox(height: 80), // Add vertical spacing before the logo
          // Display the quiz logo image
          Image.asset(
            'assets/images/quiz-logo.png', // Path to the logo asset
            width: 300, // Set the width of the image
            // Apply transparency to the image
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80), // Add vertical spacing after the logo
          // Display the main heading text
          Text(
            'learn Flutter the fun way !!!', // Text for the header
            style: GoogleFonts.lato(
              // Apply Lato font style using Google Fonts
              color: Colors.white, // White text color
              fontSize: 24, // Font size
            ),
          ),
          const SizedBox(height: 30), // Add vertical spacing before the button
          // Button to start the quiz, with an icon and label
          OutlinedButton.icon(
            onPressed:
                startQuiz, // When pressed, the startQuiz function is triggered
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  Colors.white, // Set the text and icon color to white
            ),
            icon: const Icon(Icons.arrow_right_alt), // Icon for the button
            label: const Text(
              'Start Quiz', // Label for the button
            ),
          ),
        ],
      ),
    );
  }
}
