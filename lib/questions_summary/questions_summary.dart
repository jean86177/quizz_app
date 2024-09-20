// Importing necessary Flutter packages
import 'package:flutter/material.dart';
import 'package:quizz_app/questions_summary/summary_item.dart'; // Importing the SummaryItem widget

// QuestionsSummary widget, a StatelessWidget that displays a summary of all questions
class QuestionsSummary extends StatelessWidget {
  // Constructor accepting a list of summary data maps
  const QuestionsSummary(this.summaryData, {super.key});

  // List of maps where each map contains data related to a quiz question (e.g., question, user's answer, correct answer)
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Setting a fixed height for the summary section
      child: SingleChildScrollView(
        // Enabling vertical scrolling for the column if the content exceeds the container height
        child: Column(
          // Mapping over the summaryData list to generate a list of SummaryItem widgets for each question
          children: summaryData.map(
            (data) {
              // For each item in summaryData, create a SummaryItem widget
              return SummaryItem(data);
            },
          ).toList(), // Converting the mapped items into a list
        ),
      ),
    );
  }
}
