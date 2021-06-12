import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_core.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Core coreCompute = Core();

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 41, 59, 95),
        appBar: AppBar(
          title: Text(
            'Kouiz - Sri Balaji(Dev)',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SenRegular',
              fontSize: 23.0,
              letterSpacing: 2.3,
              wordSpacing: 2.3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<String> questionAnswer = [
  //   'A slug\'s blood is green.',
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.'
  // ];
  // List<bool> answers = [true, false, true];
  // var alertStyle = AlertStyle(
  //   animationType: AnimationType.fromTop,
  //   isCloseButton: false,
  //   isOverlayTapDismiss: false,
  //   descStyle: TextStyle(fontWeight: FontWeight.bold),
  //   descTextAlign: TextAlign.start,
  //   animationDuration: Duration(milliseconds: 400),
  //   alertBorder: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(0.0),
  //     side: BorderSide(
  //       color: Colors.grey,
  //     ),
  //   ),
  //   titleStyle: TextStyle(
  //     color: Colors.red,
  //   ),
  //   alertAlignment: Alignment.topCenter,
  // );
  void showDig() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Well Done! Starting from the beginning.',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'SenRegular',
          fontSize: 18.0,
          letterSpacing: 0.5,
          wordSpacing: 0.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  int currentQuestion = 0;
  List<Widget> stateList = [
    Text(
      'Score: ',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Card(
            color: Color.fromARGB(255, 221, 221, 221),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  coreCompute.getQuestion(currentQuestion),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32.0,
                      fontFamily: 'SenRegular',
                      color: Color.fromARGB(255, 41, 59, 95),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            color: Colors.greenAccent.shade700,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                child: Text(
                  'True',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'SenRegular',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  bool correctAnswer = coreCompute.getAnswer(currentQuestion);
                  setState(() {
                    if (correctAnswer == true) {
                      stateList.add(Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                      ));
                    } else {
                      stateList.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    if (currentQuestion == coreCompute.getLength() - 1) {
                      showDig();
                      currentQuestion = 0;
                      stateList = [
                        Text(
                          'Score: ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'SenRegular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ];
                      if (coreCompute.getQuestion(0) !=
                          'Love this App developed by Bajuism?') {
                        coreCompute.setQuestion();
                      }
                      // Alert(
                      //   context: context,
                      //   style: alertStyle,
                      //   type: AlertType.info,
                      //   title: "Well Done!",
                      //   desc: "You have done a great job.",
                      //   buttons: [
                      //     DialogButton(
                      //       child: Text(
                      //         "Cool",
                      //         style:
                      //             TextStyle(color: Colors.white, fontSize: 20),
                      //       ),
                      //       onPressed: () => Navigator.pop(context),
                      //       color: Color.fromRGBO(0, 179, 134, 1.0),
                      //       radius: BorderRadius.circular(0.0),
                      //     ),
                      //   ],
                      // ).show();
                    } else {
                      currentQuestion++;
                    }
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            color: Colors.redAccent,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                child: Text(
                  'False',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  bool correctAnswer = coreCompute.getAnswer(currentQuestion);
                  setState(() {
                    if (correctAnswer == false) {
                      stateList.add(Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                      ));
                    } else {
                      stateList.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    if (currentQuestion == coreCompute.getLength() - 1) {
                      showDig();
                      currentQuestion = 0;
                      stateList = [
                        Text(
                          'Score: ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'SenRegular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ];
                      if (coreCompute.getQuestion(0) !=
                          'Love this App developed by Bajuism?') {
                        coreCompute.setQuestion();
                      }
                      // Alert(
                      //   context: context,
                      //   style: alertStyle,
                      //   type: AlertType.info,
                      //   title: "Well Done!",
                      //   desc: "You have done a great job.",
                      //   buttons: [
                      //     DialogButton(
                      //       child: Text(
                      //         "Cool",
                      //         style:
                      //             TextStyle(color: Colors.white, fontSize: 20),
                      //       ),
                      //       onPressed: () => Navigator.pop(context),
                      //       color: Color.fromRGBO(0, 179, 134, 1.0),
                      //       radius: BorderRadius.circular(0.0),
                      //     ),
                      //   ],
                      // ).show();
                    } else {
                      currentQuestion++;
                    }
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: stateList,
          ),
        )
      ],
    );
  }
}

/*
question1:
question2: , true,
question3: , true,
*/
