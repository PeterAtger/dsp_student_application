import 'package:flutter/cupertino.dart';

enum Grade { Primary, Preparatory, Secondary, Enthusiast }

class Profile {
  String fullName;
  String email;
  Grade grade;
  int userSince;
  Image profilePicture;
}
