part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class EnterMobileNumberEvent extends LoginEvent{

}

class EnterOTPEvent extends LoginEvent{
  String phone_number;
  EnterOTPEvent(this.phone_number);

}


class ProcessOTPEvent extends LoginEvent{
  String otp;
  ProcessOTPEvent(this.otp);
}

class NavigateToConfigurationsLoginEvent extends LoginEvent{

}