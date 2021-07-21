import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Presentation/global_components/AnswerWidget.dart';
import 'package:flutter/material.dart';

part 'answeredquestions_state.dart';

List<String> answers = [];

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
