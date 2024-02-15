import 'package:flutter/material.dart';
import 'dart:async';

class QuizData {
  static List<Map<String, Object>> data = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'Berlin', 'London', 'Madrid'],
      'correctAnswer': 'Paris',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Earth', 'Mars', 'Venus', 'Jupiter'],
      'correctAnswer': 'Mars',
    },
    {
      'question': 'What is the largest mammal?',
      'options': ['Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus'],
      'correctAnswer': 'Blue Whale',
    },
    {
      'question': 'In which year did World War II end?',
      'options': ['1943', '1945', '1950', '1960'],
      'correctAnswer': '1945',
    },
    {
      'question': 'Who wrote "Romeo and Juliet"?',
      'options': ['William Shakespeare', 'Charles Dickens', 'Jane Austen', 'Mark Twain'],
      'correctAnswer': 'William Shakespeare',
    },
    // Add more questions with options and correct answers
  ];
}

class WeeklyQuizkerChallenge extends StatefulWidget {
  const WeeklyQuizkerChallenge({super.key});

  @override
  _WeeklyQuizkerChallengeState createState() => _WeeklyQuizkerChallengeState();
}

class _WeeklyQuizkerChallengeState extends State<WeeklyQuizkerChallenge> {
  int currentQuestionIndex = 0;
  int score = 0;
  late Timer _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void answerQuestion(String selectedOption) {
    if (selectedOption == QuizData.data[currentQuestionIndex]['correctAnswer']) {
      setState(() {
        score++;
      });
    }

    if (currentQuestionIndex < QuizData.data.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Cancel the timer when the quiz is completed
      _timer.cancel();

      // Navigate to the result screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultScreen(
            score: score,
            elapsedSeconds: _elapsedSeconds,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weekly Quizker Challenge',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(30)),
          width: 600,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                QuizData.data[currentQuestionIndex]['question'].toString(),
                style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(height: 20),
              Column(
                children: (QuizData.data[currentQuestionIndex]['options'] as List<String>)
                    .map((option) => ElevatedButton(
                  onPressed: () => answerQuestion(option),
                  child: Text(option),
                ))
                    .toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Time Elapsed: $_elapsedSeconds seconds',
                style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int elapsedSeconds;

  QuizResultScreen({required this.score, required this.elapsedSeconds});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: $score / ${QuizData.data.length}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Time Elapsed: $elapsedSeconds seconds',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reset quiz and navigate back to the first question
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeeklyQuizkerChallenge(),
                  ),
                );
              },
              child: Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: WeeklyQuizkerChallenge()));
}
