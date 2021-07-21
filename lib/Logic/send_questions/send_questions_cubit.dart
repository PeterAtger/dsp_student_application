import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Constants/constants.dart';
import 'package:dsp_student_application/Data/Repositories/answered_questions/answered_questions.dart';
import 'package:dsp_student_application/Data/Repositories/authentication.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'send_questions_state.dart';

class SendQuestionsCubit extends Cubit<SendQuestionsState> {
  SendQuestionsCubit() : super(SendQuestionsState());

  Future<void> sendQuestionsPostRequest(sentence, urgent) async {
    final url = Uri.parse('$BASEURL/sentences/new/');
    final headers = {
      "Content-type": "application/json",
      "authorization": "Token ${Tokens.signInToken}"
    };
    final body = jsonEncode({"raw": sentence, "urgent": urgent});
    final response = await post(url, headers: headers, body: body);
    final diacritizedSentence = json.decode(utf8.decode(response.bodyBytes));
    print(diacritizedSentence);

    print('Status code: ${response.statusCode}');
    AnsweredQuestionsData.addAnswer(diacritizedSentence);
    emit(SendQuestionsState(
        code: response.statusCode, diacritizedSentence: diacritizedSentence));
  }
}

// dddddd
