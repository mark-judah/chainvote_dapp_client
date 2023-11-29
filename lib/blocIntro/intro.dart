import 'dart:async';

import 'package:election_app/blocIntro/intro_bloc.dart';
import 'package:election_app/election_type.dart';
import 'package:election_app/loginBloc/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../presidentialBloc/presidential.dart';

void main() {
  runApp(const MaterialApp(
    home: SplashPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    introBloc.add(LoadingEvent());
    //wait 3 seconds and call loaded success event
    Timer(const Duration(seconds: 5), () {
     // introBloc.add(NavigateToHomePageEvent());
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
    });
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
          if (state is NavigateToHomePageActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Presidential()),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case IntroLoadingState:
              return Scaffold(
        body:Container(
                  color: Colors.white,
                  child: const Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text(
                          "ChainVote",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              decoration: TextDecoration.none),
                        ),
                        // DrawerHeader(
                        //     child: Image.asset("assets/images/logo.png")),


                        SpinKitWave(
                          color: Colors.black,
                          size: 50.0,
                        ),
                      ]))));
            case IntroLoadedSuccessState:
              return Scaffold(body: Container());

            default:
              return SizedBox();
          }
        });
  }
}
