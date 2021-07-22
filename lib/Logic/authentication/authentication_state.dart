part of 'authentication_cubit.dart';

@immutable
class AuthenticationState {
  bool isSignIn;
  Map<String, dynamic> data;
  int code;
  AuthenticationState({this.data, this.code, this.isSignIn});
}
