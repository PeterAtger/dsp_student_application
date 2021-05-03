import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavBarState> {
  NavbarCubit() : super(NavBarState(SelectedPage.home));

  void goToHome() {
    emit(NavBarState(SelectedPage.home));
  }

  void goToProfile() {
    emit(NavBarState(SelectedPage.profile));
  }

  void goToAnsweredQuestions() {
    emit(NavBarState(SelectedPage.answeredQuestions));
  }

  void goToSavedQuestions() {
    emit(NavBarState(SelectedPage.savedQuestions));
  }

  void goToSettings() {
    emit(NavBarState(SelectedPage.settings));
  }
}
