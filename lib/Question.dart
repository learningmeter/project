import 'Answers.dart';

class Question {
  String? question;
  Answers? answers;
  String? questionImageUrl;
  String? correctAnswer;
  int? score;

  Question(
      {this.question,
        this.answers,
        this.questionImageUrl,
        this.correctAnswer,
        this.score});

  Question.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answers =
    json['answers'] != null ? new Answers.fromJson(json['answers']) : null;
    questionImageUrl = json['questionImageUrl'];
    correctAnswer = json['correctAnswer'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers!.toJson();
    }
    data['questionImageUrl'] = this.questionImageUrl;
    data['correctAnswer'] = this.correctAnswer;
    data['score'] = this.score;
    return data;
  }
}