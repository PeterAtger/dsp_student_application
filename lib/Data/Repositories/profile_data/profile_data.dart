import 'dart:convert';

import 'package:dsp_student_application/Data/Models/profile_data.dart';
import 'package:dsp_student_application/Data/Repositories/authentication.dart';
import 'package:http/http.dart';

class ProfileData {
  const ProfileData();

  static int id;
  static String email;
  static String fullName;
  static Grade grade;
  static String rating;

  static Future<int> getProfileInfo() async {
    final url = Uri.parse('http://34.132.143.59:8000/accounts/me/');
    final headers = {
      "Content-type": "application/json",
      "authorization": "Token ${Tokens.signInToken}"
    };

    final response = await get(url, headers: headers);
    Map profileData = json.decode(utf8.decode(response.bodyBytes));
    int code = response.statusCode;

    if (Tokens.signInToken != null) {
      id = profileData['data']['id'];
      fullName = profileData['data']['full_name'];
      email = profileData['data']['email'];
      grade = Grade.values[profileData['data']['student']['grade'] - 1];
    }

    return (code);
  }
}
