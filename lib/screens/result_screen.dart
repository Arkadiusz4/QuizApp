import 'package:flutter/material.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/home.dart';
import 'package:quiz_app/screens/options_screen.dart';
import 'package:quiz_app/screens/show_answers_screen.dart';
import 'package:quiz_app/widgets/column_with_icon.dart';
import 'package:quiz_app/widgets/result_column.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {Key? key,
      required this.photo,
      required this.category,
      required this.text,
      required this.questions,
      required this.answers})
      : super(key: key);

  final String photo, text;
  final Category category;
  final List<Question> questions;
  final Map<int, dynamic> answers;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    int correct = 0;
    widget.answers.forEach((index, value) {
      if (widget.questions[index].correctAnswer == value) correct++;
    });
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFF),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * .6 + 70,
                width: constraints.maxWidth,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 70,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(10)),
                        child: Container(
                          foregroundDecoration: const BoxDecoration(
                              gradient: LinearGradient(
                            colors: [Colors.transparent, Color(0xFF251F47)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.photo),
                                fit: BoxFit.cover),
                          ),
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.6,
                        ),
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.5,
                      height: 150,
                      left: 10,
                      right: 10,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFFFCFCFF),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ResultColumn(
                                    textColor1: const Color(0xFF3083DC),
                                    textColor2: Colors.green,
                                    text1:
                                        '${correct / widget.questions.length * 100}%',
                                    subtext1: 'Your score',
                                    text2: '$correct',
                                    subtext2: 'Correct',
                                  ),
                                  ResultColumn(
                                    textColor1: const Color(0xFF3083DC),
                                    textColor2: Colors.red,
                                    text1: '${widget.questions.length}',
                                    subtext1: 'Total Questions',
                                    text2:
                                        '${widget.questions.length - correct}',
                                    subtext2: 'Wrong',
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (() => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OptionsScreen(
                                  category: widget.category,
                                  photo: widget.photo,
                                  text: widget.text,
                                )))),
                    child: const ColumnWithIcon(
                        backgroundColor: Color(0xFFC3DFE0),
                        icon: Icon(Icons.restart_alt_outlined),
                        text: 'Play again'),
                  ),
                  GestureDetector(
                    onTap: (() => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()))),
                    child: const ColumnWithIcon(
                        backgroundColor: Color(0xFFC3DFE0),
                        icon: Icon(Icons.home),
                        text: 'Home'),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowAnswersScreen(
                                  answers: widget.answers,
                                  questions: widget.questions,
                                  photo: widget.photo,
                                ))),
                    child: const ColumnWithIcon(
                        backgroundColor: Color(0xFFC3DFE0),
                        icon: Icon(Icons.remove_red_eye),
                        text: 'Show answer'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
