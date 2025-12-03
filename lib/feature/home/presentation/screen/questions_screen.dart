import 'package:flutter/material.dart';
import 'package:quiz_app/model.dart';
import 'package:quiz_app/feature/home/presentation/view/questions_body.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: PageView.builder(
  itemCount: questions.length,
  itemBuilder: (BuildContext context, int index) => QuestionsBody(index:index),
  ),

    );
  }
}