import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite phone brand?',
      'answers': [
        {'text': 'iPhone', 'score': 10},
        {'text': 'Samsung', 'score': 5},
        {'text': 'Huawei', 'score': 2},
        {'text': 'Honor', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite system?',
      'answers': [
        {'text': 'Windows', 'score': 11},
        {'text': 'Android', 'score': 3},
        {'text': 'iOS', 'score': 5},
        {'text': 'Other', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite app type?',
      'answers': [
        {'text': 'Games', 'score': 4},
        {'text': 'Social', 'score': 3},
        {'text': 'Teaching', 'score': 2},
        {'text': 'Life style', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          shadowColor: Colors.deepOrange,
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
