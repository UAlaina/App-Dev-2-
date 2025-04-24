import 'dart:convert';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Berlin', 'Paris', 'Madrid'],
      'answer': 'Paris',
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '5'],
      'answer': '4',
    },
    {
      'question': 'Who is the president of the USA?',
      'options': ['Joe Biden', 'Donald Trump', 'Barack Obama'],
      'answer': 'Joe Biden',
    },
    {
      'question': 'What is the largest planet in the solar system?',
      'options': ['Earth', 'Jupiter', 'Saturn'],
      'answer': 'Jupiter',
    },
    {
      'question': 'Which language is used for Flutter development?',
      'options': ['Java', 'C++', 'Dart'],
      'answer': 'Dart',
    },
    {
      'question': 'What is the capital of Japan?',
      'options': ['Seoul', 'Beijing', 'Tokyo'],
      'answer': 'Tokyo',
    },
    {
      'question': 'Which of these is a programming language?',
      'options': ['Python', 'HTML', 'CSS'],
      'answer': 'Python',
    },
    {
      'question': 'Which country is known for the Eiffel Tower?',
      'options': ['France', 'Italy', 'USA'],
      'answer': 'France',
    },
    {
      'question': 'What is the boiling point of water?',
      'options': ['100°C', '90°C', '110°C'],
      'answer': '100°C',
    },
    {
      'question': 'What is 5 * 5?',
      'options': ['20', '25', '30'],
      'answer': '25',
    },
  ];

  int _currentIndex = 0;
  String? _selectedOption;
  String? _feedback;
  Color _feedbackColor = Colors.green;
  bool _isNextButtonVisible = false; // Tracks if "Next" button should be visible
  int _correctAnswers = 0; // Tracks the number of correct answers
  int _incorrectAnswers = 0; // Tracks the number of incorrect answers

  void _submitAnswer() {
    if (_selectedOption == _questions[_currentIndex]['answer']) {
      setState(() {
        _feedback = 'Correct!';
        _feedbackColor = Colors.green; // Green for correct answer
        _correctAnswers++; // Increment correct answers count
      });
    } else {
      setState(() {
        _feedback = 'Incorrect!';
        _feedbackColor = Colors.red; // Red for incorrect answer
        _incorrectAnswers++; // Increment incorrect answers count
      });
    }

    setState(() {
      _isNextButtonVisible = true; // Show the "Next" button after submitting
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
        _feedback = null;
        _feedbackColor = Colors.green;
        _isNextButtonVisible = false; // Hide "Next" button until user answers again
      });
    } else {
      // Show result after last question
      double score = (_correctAnswers / _questions.length) * 100;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Quiz Finished'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Correct Answers: $_correctAnswers'),
              Text('Total Incorrect Answers: $_incorrectAnswers'),
              Text('Your Score: $score%'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(currentQuestion['question'], style: TextStyle(fontSize: 18)),
            ...currentQuestion['options'].map<Widget>((option) {
              return RadioListTile(
                title: Text(option),
                value: option,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value as String?;
                    _feedback = null; // Reset feedback when selecting an option
                    _feedbackColor = Colors.green; // Reset feedback color to green
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedOption != null ? _submitAnswer : null, // Only allow submitting if an option is selected
              child: Text('Submit Answer'),
            ),
            if (_feedback != null) ...[
              SizedBox(height: 10),
              Text(_feedback!, style: TextStyle(fontSize: 16, color: _feedbackColor)),
            ],
            SizedBox(height: 20),
            if (_isNextButtonVisible) ...[
              ElevatedButton(
                onPressed: _nextQuestion,
                child: Text('Next'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}