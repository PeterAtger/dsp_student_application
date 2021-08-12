import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'urgentbarcubit_state.dart';

class UrgentBarCubit extends Cubit<UrgentbarState> {
  UrgentBarCubit() : super(UrgentbarState(isUrgent: false));

  void changeUrgent(value) {
    emit(UrgentbarState(isUrgent: value));
  }
}
