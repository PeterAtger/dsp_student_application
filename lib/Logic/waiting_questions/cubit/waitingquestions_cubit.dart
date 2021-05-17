import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Data/Models/question.dart';
import 'package:dsp_student_application/Presentation/Pages/questions/local_components/Waiting.dart';
import 'package:meta/meta.dart';

part 'waitingquestions_state.dart';

List<Question> questions = [
  Question(
      isUrgent: true,
      level: Level.Primary,
      question: 'is tata stupid yes of course he is?'),
  Question(
      isUrgent: false,
      level: Level.Primary,
      question: 'tata is a kangaarooo and an iceberg?'),
  Question(
      isUrgent: false,
      level: Level.Preparatory,
      question: 'you are right tata is buffalo'),
  Question(
      isUrgent: true,
      level: Level.Secondary,
      question: 'you are double right tata is a cow')
];

class WaitingQuestionsCubit extends Cubit<WaitingQuestionsState> {
  WaitingQuestionsCubit() : super(WaitingQuestionsState(null));

  //initializing variables and lists

  List<Waiting> primaryList = [];
  List<Waiting> prepList = [];
  List<Waiting> secondaryList = [];
  List<Waiting> allList = [];
  List<Waiting> primaryUrgentList = [];
  List<Waiting> prepUrgentList = [];
  List<Waiting> secondaryUrgentList = [];
  List<Waiting> allUrgentList = [];
  String chosenLevel = 'All';
  bool chosenUrgent = false;

//making the eight lists
  void _listOrder() {
    primaryList = [];
    prepList = [];
    secondaryList = [];
    allList = [];
    primaryUrgentList = [];
    prepUrgentList = [];
    secondaryUrgentList = [];
    allUrgentList = [];
    for (int i = 0; i < questions.length; i++) {
      allList.add(Waiting(
        question: questions[i].question,
        level: questions[i].level,
        isUrgent: questions[i].isUrgent,
      ));

      if (questions[i].level == Level.Primary) {
        primaryList.add(Waiting(
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      } else if (questions[i].level == Level.Preparatory) {
        prepList.add(Waiting(
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      } else if (questions[i].level == Level.Secondary) {
        secondaryList.add(Waiting(
            question: questions[i].question,
            level: questions[i].level,
            isUrgent: questions[i].isUrgent));
      }
    }
    allUrgentList = [...allList];
    allUrgentList.removeWhere((element) => element.isUrgent == false);
    primaryUrgentList = [...primaryList];
    primaryUrgentList.removeWhere((element) => element.isUrgent == false);
    prepUrgentList = [...prepList];
    prepUrgentList.removeWhere((element) => element.isUrgent == false);
    secondaryUrgentList = [...secondaryList];
    secondaryUrgentList.removeWhere((element) => element.isUrgent == false);
  }

  void _listSelector() {
    if (chosenUrgent == true) {
      if (chosenLevel == 'All') {
        emit(WaitingQuestionsState(allUrgentList));
      } else if (chosenLevel == 'Primary') {
        emit(WaitingQuestionsState(primaryUrgentList));
      } else if (chosenLevel == 'Preparatory') {
        emit(WaitingQuestionsState(prepUrgentList));
      } else if (chosenLevel == 'Secondary') {
        emit(WaitingQuestionsState(secondaryUrgentList));
      }
    } else {
      if (chosenLevel == 'All') {
        emit(WaitingQuestionsState(allList));
      } else if (chosenLevel == 'Primary') {
        emit(WaitingQuestionsState(primaryList));
      } else if (chosenLevel == 'Preparatory') {
        emit(WaitingQuestionsState(prepList));
      } else if (chosenLevel == 'Secondary') {
        emit(WaitingQuestionsState(secondaryList));
      }
    }
  }

  //urgent filter
  void urgentFilter(newValue) {
    _listOrder();
    chosenUrgent = newValue;
    _listSelector();
  }

//level filter
  void filter(newValue) {
    _listOrder();
    chosenLevel = newValue;
    _listSelector();
  }
}
