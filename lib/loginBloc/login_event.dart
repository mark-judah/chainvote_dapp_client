part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class EnterMobileNumberEvent extends LoginEvent{

}

class EnterOTPEvent extends LoginEvent{

}


class ProcessOTPEvent extends LoginEvent{
  String otp;
  ProcessOTPEvent(this.otp);
}

class NavigateToConfigurationsLoginEvent extends LoginEvent{

}