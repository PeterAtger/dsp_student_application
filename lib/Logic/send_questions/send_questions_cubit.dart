import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Constants/constants.dart';
import 'package:dsp_student_application/Data/Repositries/sign_in_token.dart';
import 'package:dsp_student_application/Logic/urgent_bar_cubit/urgentbarcubit_cubit.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'send_questions_state.dart';

class SendQuestionsCubit extends Cubit<SendQuestionsState> {
  SendQuestionsCubit() : super(SendQuestionsState());

  Future<void> sendQuestionsPostRequest(sentence, urgent) async {
    final url = Uri.parse('$BASEURL/sentences/new/');
    final headers = {
      "Content-type": "application/json",
      "authorization": "Token $SIGNINTOKEN"
    };
    final json = jsonEncode({"raw": sentence, "urgent": urgent});
    final response = await post(url, headers: headers, body: json);
    final diacritizedSentence = jsonDecode(response.body);
    print(diacritizedSentence);

    print('Status code: ${response.statusCode}');
    emit(SendQuestionsState(
        code: response.statusCode, diacritizedSentence: diacritizedSentence));
  }
}
