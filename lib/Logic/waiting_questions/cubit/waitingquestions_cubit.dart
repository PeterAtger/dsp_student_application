import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Presentation/global_components/AnswerWidget.dart';
import 'package:meta/meta.dart';

part 'waitingquestions_state.dart';

List<String> answers = [];

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
