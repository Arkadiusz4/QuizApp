import 'package:quiz_app/enums/difficulty.dart';
import 'package:quiz_app/enums/type.dart';

class Question {
  late final String category;
  late final Type type;
  late final Difficulty difficulty;
  late final String question;
  late final String correctAnswer;
  late final List<dynamic> incorrectAnswer;

  Question(
      {required this.category,
      required this.type,
      required this.difficulty,
      required this.question,
      required this.correctAnswer,
      required this.incorrectAnswer});

  Question.fromMap(Map<String, dynamic> data)
      : category = data['category'],
        type = data['type'] == 'multiple' ? Type.multiple : Type.boolean,
        difficulty = data['difficulty'] == 'easy'
            ? Difficulty.easy
            : data['difficulty'] == 'medium'
                ? Difficulty.medium
                : Difficulty.hard,
        question = data['question'],
        correctAnswer = data['correct_answer'],
        incorrectAnswer = data['incorrect_answers'];

  static List<Question> fromData(List<Map<String, dynamic>> data) =>
      data.map((question) => Question.fromMap(question)).toList();
}
