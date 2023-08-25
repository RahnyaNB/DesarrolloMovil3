import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> questions = [
    'San Marino is the only country completely surrounded by another country.',
    'Metal Gear Solid V: The Phantom Pain runs on the Fox Engine.',
    'Ottawa is the capital of Canada.',
    'The ADAM collecters in the Bioshock series are known as Little Sisters.',
    'You can tell the age of a ladybird by counting the spots on his back.',
    'Janus was the Roman god of doorways and passageways.',
    'Salt is 100% composed of Sodium.',
    'The United States of America was the first country to launch a man into space.',
    'The Axolotl is an amphibian that can spend its whole life in a larval state.',
    'In the webcomic Homestuck, the first character introduced is Dave Strider.',
    'The National Animal of Scotland is the Unicorn.',
    'The ultimate phrase used by Pharah from Overwatch is: Justice rains from above!',
  ];

  List<bool> answers = [
    false,
    true,
    true,
    true,
    false,
    true,
    false,
    false,
    true,
    false,
    true,
    true,
  ];

  int currentQuestionIndex = 0;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    if (userAnswer == answers[currentQuestionIndex]) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }

    if (currentQuestionIndex == 11) {
      showResultDialog();
    } else {
      setState(() {
        currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
      });
    }
  }


  void showResultDialog() {
    int correctAnswers = scoreKeeper.where((icon) => icon.color == Colors.green).length;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Terminado'),
          content: Text('Has respondido $correctAnswers de 12 preguntas correctamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetQuiz();
              },
              child: Text('Reiniciar'),
            ),
          ],
        );
      },
    );
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      scoreKeeper.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[currentQuestionIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Colors.green;
                  },
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'Verdadero',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Colors.red;
                  },
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scoreKeeper,
        ),

        ),
      ],
    );
  }
}

