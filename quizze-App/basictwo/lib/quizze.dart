import 'package:basictwo/question.dart';
import 'package:flutter/material.dart';
import 'answer.dart';

class Quize extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questonIndex;
  final Function answerQuestion;

  const Quize(this.questions, this.questonIndex, this.answerQuestion);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Quesstion(questions[questonIndex]['questionText']),
        ...(questions[questonIndex]['answers'] as List<Map<String, Object>>)
            .map((ans) {
          return Answer(ans['text'], () => answerQuestion(ans['score']));
        }).toList(),
      ],
    );
  }
}
