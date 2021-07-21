import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'urgentbarcubit_state.dart';

class UrgentbarCubit extends Cubit<UrgentbarState> {
  UrgentbarCubit() : super(UrgentbarState(isUrgent: false));

  void changeUrgent(value) {
    emit(UrgentbarState(isUrgent: value));
  }
}
