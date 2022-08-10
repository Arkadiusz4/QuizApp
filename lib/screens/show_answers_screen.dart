import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:quiz_app/models/question_model.dart';

class ShowAnswersScreen extends StatefulWidget {
  const ShowAnswersScreen(
      {Key? key,
      required this.questions,
      required this.answers,
      required this.photo})
      : super(key: key);

  final List<Question> questions;
  final Map<int, dynamic> answers;
  final String photo;

  @override
  State<ShowAnswersScreen> createState() => _ShowAnswersScreenState();
}

class _ShowAnswersScreenState extends State<ShowAnswersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFF4F3EE),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.transparent, Color(0xFF01172F)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.photo), fit: BoxFit.cover),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: widget.questions.length + 1,
            itemBuilder: _buildItem,
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == widget.questions.length) {
      return ElevatedButton(
        child: const Text("Done"),
        onPressed: () {
          Navigator.of(context)
              .popUntil(ModalRoute.withName(Navigator.defaultRouteName));
        },
      );
    }
    Question question = widget.questions[index];
    bool correct = question.correctAnswer == widget.answers[index];
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              HtmlUnescape().convert(question.question),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
            const SizedBox(height: 5.0),
            Text(
              HtmlUnescape().convert("${widget.answers[index]}"),
              style: TextStyle(
                  color: correct ? Colors.green : Colors.red,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5.0),
            correct
                ? Container()
                : Text.rich(
                    TextSpan(children: [
                      const TextSpan(text: "Answer: "),
                      TextSpan(
                          text: HtmlUnescape().convert(question.correctAnswer),
                          style: const TextStyle(fontWeight: FontWeight.w500))
                    ]),
                    style: const TextStyle(fontSize: 16.0),
                  )
          ],
        ),
      ),
    );
  }
}
