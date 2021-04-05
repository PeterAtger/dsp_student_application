import 'package:flutter/cupertino.dart';

enum Grade { Primary, Preparatory, Secondary }

class ProfileData {
  String name;
  String email;
  Grade grade;
  int userSince;
  Image profilePicture;
}
