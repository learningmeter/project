import 'package:project/Question.dart';

class QuizQuestions{
  List<Question>? questions;

  QuizQuestions(
      {this.questions});

  QuizQuestions.fromJson(Map<String, dynamic> json) {
    questions = (json['questions'] as List<dynamic>?)
        ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questions'] = this.questions;
    return data;
  }
}