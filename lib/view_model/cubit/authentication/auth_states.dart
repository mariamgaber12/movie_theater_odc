abstract class AuthenticationState {}

class LoginInitial extends AuthenticationState {}
class ChangeBottomNavBar extends AuthenticationState {}

class ChangePasswordVisibility extends AuthenticationState {}


class SignupLoadingState extends AuthenticationState {}
class SignupSuccessfulState extends AuthenticationState {}
class SignupErrorState extends AuthenticationState {
  String? message;
  SignupErrorState({this.message});
}

class LoginLoadingState extends AuthenticationState {}
class LoginSuccessfulState extends AuthenticationState {}
class LoginErrorState extends AuthenticationState {
  String? message;
  LoginErrorState({this.message});
}