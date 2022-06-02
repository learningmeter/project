import 'package:flutter/material.dart';
import 'package:project/Question.dart';
import 'package:project/QuizQuestions.dart';

import 'API.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Future<QuizQuestions> response;

  @override
  void initState() {
    super.initState();
    response = API().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Total score'),
      ),
      body: FutureBuilder<QuizQuestions>(
        future: response,
        builder:  (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            List<Question>? list = snapshot.data!.questions;

            if(list != null) {
              return Center(child: Text(list.first.question!),);
            }else {
              return Container();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );

  }
}


