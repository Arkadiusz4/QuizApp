import 'dart:convert';

import 'package:quiz_app/models/question_model.dart';
import 'package:http/http.dart' as http;

const base = 'https://opentdb.com/api.php';

Future<List<Question>> getQuestions(
    category, int numberOfQuestion, String difficulty) async {
  String url =
      '$base?amount=$numberOfQuestion&category=${category.id}&diffculty=${difficulty.toLowerCase()}';


  final response = await http.get(Uri.parse(url));

  List<Map<String, dynamic>> questions =
      List<Map<String, dynamic>>.from(jsonDecode(response.body)['results']);

  return Question.fromData(questions);
}
