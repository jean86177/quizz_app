// Importing Flutter package to access Material Design widgets
import 'package:flutter/material.dart';

// Declaring the AnswerButton class, which extends StatelessWidget
class AnswerButton extends StatelessWidget {
  // Constant constructor with parameters answerText and onTap
  const AnswerButton({
    super.key, // Key used to identify this widget in the widget tree
    required this.answerText, // Text of the answer to display on the button
    required this.onTap, // Function to be executed when the button is pressed
  });

  // Declaring final variables
  final String answerText; // Text of the answer option
  final void Function()
      onTap; // Callback function triggered when the button is pressed

  // Build method to construct the widget for the user interface
  @override
  Widget build(BuildContext context) {
    // Returns an elevated button (ElevatedButton)
    return ElevatedButton(
      // Defines the action to be executed when the button is pressed
      onPressed: onTap,
      // Styling the button
      style: ElevatedButton.styleFrom(
        // Defining internal padding (vertical and horizontal)
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        // Setting the background color of the button
        backgroundColor: Colors.green,
        // Setting the text or icon color inside the button
        foregroundColor: Colors.white,
        // Button shape, in this case with rounded corners
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40), // Corner radius of 40
        ),
      ),
      // The text displayed inside the button, centered
      child: Text(answerText, textAlign: TextAlign.center),
    );
  }
}
