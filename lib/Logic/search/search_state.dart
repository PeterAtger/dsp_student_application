part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchFlipperState extends SearchState {
  final int isFlipped;

  SearchFlipperState(this.isFlipped);
}

class SearchResultsState extends SearchState {
  final List<Widget> answers;

  SearchResultsState(this.answers);
}
