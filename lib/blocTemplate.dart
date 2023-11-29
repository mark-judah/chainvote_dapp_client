import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocIntro/intro_bloc.dart';

class blocTemplate extends StatefulWidget {
  var passed_value = "";

  blocTemplate(this.passed_value, {Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<blocTemplate> {
  @override
  void initState() {
    super.initState();
  }

  final IntroBloc introBloc = IntroBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IntroBloc, IntroState>(
        bloc: introBloc,
        //listen for emitted action states and perform an action
        listenWhen: (previous, current) => current is IntroActionState,
        //build when there is no action state
        buildWhen: (previous, current) => current is! IntroActionState,
        listener: (context, state) {
          if (state is NavigateToHomePageActionState) {}
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case IntroLoadingState:
              return Scaffold(
                body: Container(),
              );
            case IntroLoadedSuccessState:
              return Scaffold(body: Container());

            default:
              return SizedBox();
          }
        });
  }
}
