import 'dart:convert';
import 'package:http/http.dart';

import 'QuizQuestions.dart';

class API{
  String BASE_URL = 'https://herosapp.nyc3.digitaloceanspaces.com/quiz.json';
  final String contentTypeJson = 'application/json; charset=UTF-8';
  final int statusOK = 200;


  Future<QuizQuestions> fetchData() async {
    final response = await get(
        Uri.parse(BASE_URL),
    );
    if (response.statusCode == statusOK) {
      print(response.body);
      return QuizQuestions.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}