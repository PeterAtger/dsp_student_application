import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Constants/constants.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState(searchResults: []));
  Future<void> getSearchResults(query) async {
    final url = Uri.parse('$BASEURL/sentences/?search=$query');
    final headers = {"Content-type": "application/json"};

    final response = await get(url, headers: headers);
    // print('Status code: ${response.statusCode}');
    // print('Body: ${response.body}');
    final List results = jsonDecode(response.body);
    print(results[0]['diacritized']);
  }
}
