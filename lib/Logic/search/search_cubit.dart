import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Constants/constants.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/resuts_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchFlipperState(0));

  void flipper(int value) {
    emit(SearchFlipperState(value));
    print(value);
  }

  Future<void> getSearchResults(query) async {
    if (query != '') {
      final url = Uri.parse('$BASEURL/sentences/?search=$query');
      final headers = {"Content-type": "application/json"};

      final Response response = await get(url, headers: headers);
      // print('Status code: ${response.statusCode}');
      // print('Body: ${response.body}');
      if (response.statusCode < 299) {
        final List results = json.decode(utf8.decode(response.bodyBytes));
        List<Widget> resultContainers = [];
        for (int i = 0; i < results.length; i++) {
          resultContainers.add(ResultListTile(text: results[i]['diacritized']));
        }
        emit(SearchResultsState(resultContainers));
      }
    }
  }
}
