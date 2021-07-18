import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_student_application/Constants/constants.dart';
import 'package:dsp_student_application/Data/Repositries/sign_in_token.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState(data: null, code: null));

  Future<void> signInPostRequest(String email, String password) async {
    final url = Uri.parse('$BASEURL/accounts/login/');
    final headers = {"Content-type": "application/json"};
    final json = jsonEncode({"username": email, "password": password});

    final response = await post(url, headers: headers, body: json);
    Map signInData = jsonDecode(response.body);
    print(signInData);

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    int code1 = response.statusCode;
    emit(AuthenticationState(data: signInData, code: code1));

    if (signInData.containsKey('token')) SIGNINTOKEN = signInData['token'];
  }

  Future<void> signUpPostRequest(
      String fullName, String email2, String password2) async {
    final url = Uri.parse('$BASEURL/accounts/register/student/');
    final headers = {"Content-type": "application/json"};
    final body = {
      "full_name": fullName,
      "email": email2,
      "password": password2,
      // "grade": null
    };

    final response = await post(url, headers: headers, body: jsonEncode(body));
    Map signUpData = jsonDecode(response.body);
    print(signUpData);

    print('Status code2: ${response.statusCode}');
    print('Body2: ${response.body}');
    int code2 = response.statusCode;

    emit(AuthenticationState(data: signUpData, code: code2));
  }
}
