import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app/api/question_api.dart';
import 'package:quiz_app/models/category.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/widgets/options_button.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen(
      {Key? key,
      required this.photo,
      required this.text,
      required this.category})
      : super(key: key);

  final String photo, text;
  final Category category;

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  late int _numberOfQuestions;
  late String _difficulty;
  late bool processing;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    _numberOfQuestions = 10;
    _difficulty = 'easy';
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFFCFCFF),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: loading
          ? _loading(context)
          : SingleChildScrollView(
              child: Stack(
                children: [
                  Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [Colors.transparent, Color(0xFF251F47)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.photo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      left: 20,
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                            color: Color(0xFFFCFCFF), fontSize: 35),
                      ),
                    )
                  ]),
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .4,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Color(0xFF3083DC),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Choose difficulty',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFFFCFCFF),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            OptionsButton(
                              onPressed: () {
                                _selectNumberOfQuestions(10);
                                _selectDifficulty('easy');
                                _startQuiz();
                              },
                              text: 'Easy',
                            ),
                            OptionsButton(
                              onPressed: () {
                                _selectNumberOfQuestions(10);
                                _selectDifficulty('medium');
                                _startQuiz();
                              },
                              text: 'Medium',
                            ),
                            OptionsButton(
                              onPressed: () {
                                _selectNumberOfQuestions(10);
                                _selectDifficulty('hard');
                                _startQuiz();
                              },
                              text: 'Hard',
                            ),
                            OptionsButton(
                              onPressed: () {
                                _selectNumberOfQuestions(15);
                                _selectDifficulty('hard');
                                _startQuiz();
                              },
                              text: 'Expert',
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
    );
  }

  _selectNumberOfQuestions(int i) {
    setState(() {
      _numberOfQuestions = i;
    });
  }

  _selectDifficulty(String string) {
    setState(() {
      _difficulty = string;
    });
  }

  void _startQuiz() async {
    setState(() {
      processing = true;
      loading = true;
    });
    try {
      List<Question> questions =
          await getQuestions(widget.category, _numberOfQuestions, _difficulty);
      Navigator.pop(context);
      // if (questions.length < 1) {
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (_) => ErrorPage(
      //             message:
      //                 "There are not enough questions in the category, with the options you selected.",
      //           )));
      //   return;
      // }

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => QuizScreen(
                    questions: questions,
                    category: widget.category,
                    photo: widget.photo,
                    text: widget.text,
                  )));
      // } on SocketException catch (_) {
      //   Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //           builder: (_) => ErrorPage(
      //                 message:
      //                     "Can't reach the servers, \n Please check your internet connection.",
      //               )));
    } catch (e) {
      (e.toString());
      //   Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //           builder: (_) => ErrorPage(
      //                 message: "Unexpected error trying to connect to the API",
      //               )));
      // }
      setState(() {
        processing = false;
        loading = false;
      });
    }
  }

  Widget _loading(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF251F47),
      body: Center(
          child: Container(
        child: LoadingAnimationWidget.dotsTriangle(
            color: const Color(0xFFFCFCFF), size: 100),
      )),
    );
  }
}
