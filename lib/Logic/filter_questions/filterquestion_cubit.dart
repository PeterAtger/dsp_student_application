import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filterquestion_state.dart';

class FilterQuestionCubit extends Cubit<FilterquestionState> {
  FilterQuestionCubit() : super(FilterquestionState(null));

  void chooseFilter(String newValue) {
    emit(FilterquestionState(newValue));
  }
}
