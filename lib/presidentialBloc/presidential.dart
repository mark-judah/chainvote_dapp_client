import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:election_app/election_type.dart';
import 'package:election_app/loginBloc/login.dart';
import 'package:election_app/presidentialBloc/presidential_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class Presidential extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Presidential> {
  @override
  void initState() {
    presBloc.add(FetchCandidates());

    super.initState();
  }

  final PresidentialBloc presBloc = PresidentialBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PresidentialBloc, PresidentialState>(
        bloc: presBloc,
        //listen for emitted action states and perform an action
        listenWhen: (previous, current) => current is PresidentialActionState,
        //build when there is no action state
        buildWhen: (previous, current) => current is! PresidentialActionState,
        listener: (context, state) {
          if (state is VoteCastState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login("VoteCast")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return Container(
                color: Colors.white,
                child: const Center(
                  child: SpinKitWave(
                    color: Colors.black,
                    size: 50.0,
                  ),
                ),
              );
            case NoCandidatesState:
              return Scaffold(
                body: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/not_found.svg',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    const Positioned(
                      bottom: 230,
                      left: 30,
                      child: Text(
                        'No data!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 170,
                      left: 30,
                      child: Text(
                        'Oops! No candidates have been added yet, please try again later.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 30,
                      right: 250,
                      child: SizedBox(
                        height: 40,
                        width: 100,
                        child: MaterialButton(
                          child: const Text("Back"),
                          color: Colors.black,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ElectionType()));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              );
            case CandidatesFetchedState:
              final candidatesFetchedState = state as CandidatesFetchedState;
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                      appBar: AppBar(
                        title: const Text("Presidential Elections"),
                        titleSpacing: 00.0,
                        centerTitle: true,
                        toolbarHeight: 60.2,
                        toolbarOpacity: 0.8,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25)),
                        ),
                        elevation: 0.00,
                        backgroundColor: Colors.black,
                        leading: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      body: Container(
                          color: const Color(0xF5F5F5F1),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 40),
                                  child: Text(
                                    "Select your preffered candidate",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (int i = 0;
                                          i <
                                              candidatesFetchedState
                                                  .candidates.length;
                                          i++) ...[
                                        Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              width: 350,
                                              height: 550,
                                              color: Colors.white,
                                              child: Column(children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15),
                                                    child: Text(
                                                      candidatesFetchedState
                                                              .candidates[i]
                                                          ["Candidate"],
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 30,
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    )),
                                                Text(
                                                  candidatesFetchedState
                                                      .candidates[i]["Party"],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 30),
                                                    child: CircleAvatar(
                                                        backgroundImage:NetworkImage( candidatesFetchedState
                                                      .candidates[i]["Photo"]),
                                                        radius: 100)),
                                                Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 0, 10),
                                                    child: Text(
                                                      candidatesFetchedState
                                                              .candidates[i]
                                                          ["Slogan"],
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      candidatesFetchedState
                                                              .candidates[i]
                                                          ["Statement"],
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: SizedBox(
                                                      width: 150,
                                                      height: 40,
                                                      child: MaterialButton(
                                                          color: Colors.black,
                                                          onPressed: () {
                                                            AwesomeDialog(
                                                              width: 600,
                                                              btnCancelColor:
                                                                  Colors.black,
                                                              btnOkColor:
                                                                  Colors.black,
                                                              context: context,
                                                              dialogType:
                                                                  DialogType
                                                                      .warning,
                                                              animType: AnimType
                                                                  .bottomSlide,
                                                              title:
                                                                  'Confirm Choice',
                                                              desc:
                                                                  'Are you sure about your selection, this action cannot be undone.',
                                                              btnCancelOnPress:
                                                                  () {},
                                                              btnOkOnPress: () {
                                                                presBloc.add(
                                                                    NewVoteEvent(
                                                                       candidatesFetchedState
                                                              .candidates[i]
                                                          ["CandidateId"].toString() ));
                                                              },
                                                            ).show();
                                                          },
                                                          child: const Text(
                                                              "VOTE",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none))),
                                                    ))
                                              ]),
                                            )),
                                      ],
                                    ])
                              ]))));
            default:
              return const SizedBox();
          }
        });
  }
}
