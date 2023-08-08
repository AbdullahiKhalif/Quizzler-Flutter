import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizz_brain.dart';

QuizzeBrain quizzeBrain = QuizzeBrain();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> scoreQuizz = [];
  int correctedAnswer = 0;
  int inCorrectAnswer = 0;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizzeBrain.getQuestionAnswer();
    setState(() {
      if (quizzeBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "DONE",
          desc:
              'Awesome! You have finished the quiz and you score is: $correctedAnswer/10.',
          buttons: [
            DialogButton(
              color: Colors.green,
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            ),
          ],
        ).show();
        correctedAnswer = 0;
        inCorrectAnswer = 0;
        quizzeBrain.reset();

        scoreQuizz = [];
      } else {
        if (userAnswer == correctAnswer) {
          correctedAnswer++;
          scoreQuizz.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          inCorrectAnswer++;
          scoreQuizz.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizzeBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: SelectableText(
                    quizzeBrain.getQuestionText(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: scoreQuizz,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
