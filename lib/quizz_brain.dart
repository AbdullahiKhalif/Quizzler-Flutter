import 'package:quizzler_flutter/question.dart';

class QuizzeBrain {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question(
        q: 'Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.',
        a: true),
    Question(q: 'Abdullahi Khalif is flutter certified.', a: false),
    Question(
        q: 'Node.js is a cross-platform, open-source server environment that can run on Windows, Linux, Unix, macOS, and more.',
        a: true),
    Question(
        q: 'PHP is a general-purpose scripting language geared towards web development',
        a: true),
    Question(
        q: 'MaterialApp is application that uses copertino design.', a: false),
    Question(
        q: 'Scaffold Class is class provides APIs for showing drawers, snack bars, and bottom sheets.',
        a: true),
    Question(
        q: 'Name of the widgets should always begin with a capital letter.',
        a: true),
    Question(
        q: 'import \'package:flutter/material.dart (Imports the copertino library)',
        a: false),
    Question(q: 'hot reload used when we use statelles widgets.', a: true),
    Question(q: 'Constant constructors always create constants', a: false)
  ];

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText!;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer!;
  }

  bool isFinished() {
    if (_questionNumber >= _questions.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
