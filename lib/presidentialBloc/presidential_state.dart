part of 'presidential_bloc.dart';

@immutable
sealed class PresidentialState {}

abstract class PresidentialActionState extends PresidentialState{

}

final class PresidentialInitial extends PresidentialState {}

class LoadingState extends PresidentialState{
}

class CandidatesFetchedState extends PresidentialState{
  List candidates;
  CandidatesFetchedState(this.candidates);
}

class NoCandidatesState extends PresidentialState{
}

class VoteCastState extends PresidentialActionState{
}