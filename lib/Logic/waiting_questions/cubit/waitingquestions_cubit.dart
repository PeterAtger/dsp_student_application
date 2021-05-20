import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Presentation/global_components/AnswerWidget.dart';
import 'package:meta/meta.dart';

part 'waitingquestions_state.dart';

List<String> answers = [
  'BEBO IS SO stupid, I think she has a batata in her head',
  'msh 3arf akteb eeee33',
  'ana zh2an awy bgd',
  'tftkro albta3 da hn5lso emta b2aaaa333'
];

class WaitingQuestionsCubit extends Cubit<WaitingQuestionsState> {
  WaitingQuestionsCubit() : super(WaitingQuestionsState(null));

  void goToWaitingQuestion() {
    List<AnswerWidget> templist = [];
    for (int i = 0; i < answers.length; i++) {
      templist.add(AnswerWidget(
        answer: answers[i],
        isGreen: i % 2 == 0,
      ));
    }
    emit(WaitingQuestionsState(templist));
  }
}
