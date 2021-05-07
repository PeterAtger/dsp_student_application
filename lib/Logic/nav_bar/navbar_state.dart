part of 'navbar_cubit.dart';

enum SelectedPage { profile, settings, home, savedQuestions, answeredQuestions }

@immutable
class NavBarState {
  final SelectedPage selectedPage;

  NavBarState(this.selectedPage);
}
