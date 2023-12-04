part of 'client_config_bloc.dart';

@immutable
sealed class ClientConfigEvent {}

class NavigateToConfigurationsEvent extends ClientConfigEvent {
  String email;
  String password;
  NavigateToConfigurationsEvent(this.email, this.password);
}

class SaveConfiguration extends ClientConfigEvent {
  String countyID;
   String constituencyID;
   String wardID;
   String pollingStationID;

  SaveConfiguration(
      this.countyID,this.constituencyID,this.wardID,this.pollingStationID);
}

