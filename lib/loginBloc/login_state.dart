part of 'login_bloc.dart';

@immutable
abstract class LoginState {}
//this state takes an action
abstract class LoginActionState extends LoginState{

}
class LoginInitial extends LoginState {}

class LoadingState extends LoginState{
}

class EnterMobileNumberState extends LoginState{
}

class EnterOTPState extends LoginState{
}

class NavigateToElectionTypeState extends LoginActionState{
}

class NavigateToConfigLoginActionState extends LoginActionState{

}