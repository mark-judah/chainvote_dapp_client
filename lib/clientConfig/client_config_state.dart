part of 'client_config_bloc.dart';

@immutable
abstract class ClientConfigState {}

//this state takes an action
abstract class ClientConfigActionState extends ClientConfigState {}

class ClientConfigInitial extends ClientConfigState {}

class LoadingState extends ClientConfigState {}

class NavigateToConfigActionState extends ClientConfigActionState {
  List counties;
  List constituencies;
  List wards;
  List polling_station;
  NavigateToConfigActionState(
      this.counties, this.constituencies, this.wards, this.polling_station);

}

class Unauthorized extends ClientConfigState {}

class Error extends ClientConfigState {}
