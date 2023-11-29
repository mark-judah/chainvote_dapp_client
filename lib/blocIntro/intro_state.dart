part of 'intro_bloc.dart';

@immutable
//this state builds the ui
abstract class IntroState {}

//this state takes an action
abstract class IntroActionState extends IntroState{

}
class IntroInitial extends IntroState {}

class IntroLoadingState extends IntroState{
  //show loading circle
}

class IntroLoadedSuccessState extends IntroState{

}


class IntroErrorState extends IntroState{
  //show error message

}

class NavigateToHomePageActionState extends IntroActionState{
}