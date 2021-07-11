part of 'authentication_cubit.dart';

@immutable
class AuthenticationState {
  Map<String, dynamic> data;
  int code;
  AuthenticationState({this.data, this.code});
}
