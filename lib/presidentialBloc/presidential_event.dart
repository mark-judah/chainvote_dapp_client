part of 'presidential_bloc.dart';

@immutable
sealed class PresidentialEvent {}


class NewVoteEvent extends PresidentialEvent{
  String candidate_id;

  NewVoteEvent(this.candidate_id);

}