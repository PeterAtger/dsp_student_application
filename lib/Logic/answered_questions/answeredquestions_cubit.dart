import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Presentation/global_components/AnswerWidget.dart';
import 'package:flutter/material.dart';

part 'answeredquestions_state.dart';

List<String> answers = [
  'habiba ashraf is so smart',
  'peter atef is so stupid',
  'biba abdo is so adorable',
  'sara magdi is so kind',
  'tata is so so stupid',
  'tata is donkey',
  'tata is so so donkey i dont know how he lives like this in our society what the fuck is wrong with this creature i will fucking bibi on his donkeys head',
  'please dont make me laugh we are working hard working donkeys',
  'i am a cow',
  'but tata is a buffalo',
  'tata eats caniloni',
  'how come a donkey eats canolino',
  'tata ia a kangaroo',
  'tata ia a kangaroo',
  'tata ia a kangaroo',
  'tata ia a kangaroo',
  'tata ia a kangaroo',
  'tata ia a kangaroo',
  'tata ia a kangaroo',
];

class AnsweredQuestionsCubit extends Cubit<AnsweredQuestionsState> {
  AnsweredQuestionsCubit() : super(AnsweredQuestionsState(null));
  void goToAnsweredQuestions() {
    List<AnswerWidget> templist = [];
    for (int i = 0; i < answers.length; i++) {
      templist.add(AnswerWidget(
        answer: answers[i],
        isGreen: i % 2 == 0,
      ));
    }
    emit(AnsweredQuestionsState(templist));
  }
}
