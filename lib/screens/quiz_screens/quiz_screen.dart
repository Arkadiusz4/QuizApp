import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/home.dart';
import 'package:quiz_app/screens/quiz_screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {Key? key,
      required this.category,
      required this.questions,
      required this.photo,
      required this.text})
      : super(key: key);

  final List<Question> questions;
  final Category category;
  final String photo, text;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrectAnswer;

    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFF),
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.pause,
                color: Color(0xFFFCFCFF),
              ),
              onPressed: () =>
                  showDialog(context: context, builder: _showDialog))
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * .4 + 70,
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
                          height: constraints.maxHeight * 0.4,
                        ),
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.33,
                      height: 120,
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
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Question ${_currentIndex + 1} of ${widget.questions.length}',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, bottom: 5),
                                  child: Text(
                                    HtmlUnescape().convert(widget
                                        .questions[_currentIndex].question),
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ...options.map((option) => RadioListTile<String>(
                            activeColor: const Color(0xFF01172F),
                            title: Text(HtmlUnescape().convert("$option")),
                            value: option,
                            groupValue: _answers[_currentIndex],
                            onChanged: (value) {
                              setState(() {
                                _answers[_currentIndex] = option;
                              });
                            },
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF251F47),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width - 60, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text(
                    _currentIndex == (widget.questions.length - 1)
                        ? "Submit"
                        : "Next",
                    style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xFFFCFCFF),
                        fontWeight: FontWeight.w500),
                  ),
                  onPressed: _nextSubmit,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _nextSubmit() {
    const snackbar = SnackBar(
      content: Text("You must select an answer to continue."),
      backgroundColor: Color(0xFF251F47),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(20),
      elevation: 10,
    );

    if (_answers[_currentIndex] == null) {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => ResultScreen(
                photo: widget.photo,
                category: widget.category,
                text: widget.text,
                answers: _answers,
                questions: widget.questions,
              )));
    }
  }

  Widget _showDialog(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFCFCFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF251F47),
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Pause',
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFFFCFCFF),
                  fontWeight: FontWeight.w700),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       top: 20, bottom: 20, left: 15, right: 15),
            //   child: Container(
            //     color: const Color(0xFF3083DC),
            //     height: 3,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF3083DC),
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFFFCFCFF),
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF3083DC),
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(
                  'Exit',
                  style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFFFCFCFF),
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () =>
                    showDialog(context: context, builder: _alertDialog),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _alertDialog(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFCFCFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF3083DC),
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Warning',
              style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFFFCFCFF),
                  fontWeight: FontWeight.w700),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 15),
              child: Text(
                'Are you sure you want to quit the quiz? All your progress will be lost.',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFCFCFF),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFFCFCFF),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width / 4, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: const Text(
                      'No',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF251F47),
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF251F47),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width / 4, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFFCFCFF),
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const HomeScreen()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
