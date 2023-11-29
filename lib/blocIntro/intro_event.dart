part of 'intro_bloc.dart';

@immutable
abstract class IntroEvent {}

class LoadingEvent extends IntroEvent{

}

class NavigateToHomePageEvent extends IntroEvent{

}