import 'package:another_flushbar/flushbar.dart';
import 'package:election_app/clientConfig/client_config_login.dart';
import 'package:election_app/election_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:numpad_layout/widgets/numpad.dart';

import 'login_bloc.dart';

class Login extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Login> {
  List phone_number = [];
  List otp = [];

  @override
  void initState() {
    loginBloc.add(EnterMobileNumberEvent());
    super.initState();
  }

  final LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        //listen for emitted action states and perform an action
        listenWhen: (previous, current) => current is LoginActionState,
        //build when there is no action state
        buildWhen: (previous, current) => current is! LoginActionState,
        listener: (context, state) {
          if (state is NavigateToElectionTypeState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ElectionType()));
          }
          if (state is NavigateToConfigLoginActionState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ClientConfigLogin()));
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
            case EnterMobileNumberState:
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                      appBar: AppBar(
                        title: const Text("ChainVote"),
                        titleSpacing: 00.0,
                        centerTitle: true,
                        toolbarHeight: 60.2,
                        toolbarOpacity: 0.8,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25)),
                        ),
                        actions: [
                          IconButton(
                            icon: const Icon(Icons.settings),
                            tooltip: 'Configuration',
                            onPressed: () {
                              loginBloc
                                  .add(NavigateToConfigurationsLoginEvent());
                            },
                          ),
                        ],
                        elevation: 0.00,
                        backgroundColor: Colors.black,
                      ),
                      body: Container(
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              const Text(
                                "Enter your mobile number to begin",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                phone_number.join(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Wrap(
                                spacing: 50,
                                children: [
                                  for (int number = 1; number <= 3; number++)
                                    Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: MaterialButton(
                                                textColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                      style: BorderStyle.solid),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    phone_number.add(number);
                                                  });
                                                },
                                                child: Text(
                                                  number.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 30.0),
                                                )))),
                                ],

                                /////////
                              ),
                              SizedBox(height: 50),
                              Wrap(
                                spacing: 50,

                                children: [
                                  for (int number = 4; number <= 6; number++)
                                    Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: MaterialButton(
                                                textColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                      style: BorderStyle.solid),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    phone_number.add(number);
                                                  });
                                                },
                                                child: Text(
                                                  number.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 30.0),
                                                )))),
                                ],

                                /////////
                              ),
                              SizedBox(height: 50),
                              Wrap(
                                spacing: 50,
                                children: [
                                  for (int number = 7; number <= 9; number++)
                                    Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: MaterialButton(
                                                textColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                      style: BorderStyle.solid),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    phone_number.add(number);
                                                  });
                                                },
                                                child: Text(
                                                  number.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 30.0),
                                                )))),
                                ],
                              ),
                              SizedBox(height: 50),
                              Wrap(
                                spacing: 50,
                                children: [
                                  for (int number = 1;
                                      number <= 3;
                                      number++) ...[
                                    if (number == 1) ...[
                                      Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      )
                                    ],
                                    if (number == 2) ...[
                                      Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: AspectRatio(
                                              aspectRatio: 1,
                                              child: MaterialButton(
                                                  textColor: Colors.black,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      phone_number.add(0);
                                                    });
                                                  },
                                                  child: Text(
                                                    "0",
                                                    style: const TextStyle(
                                                        fontSize: 30.0),
                                                  ))))
                                    ],
                                    if (number == 3) ...[
                                      Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: AspectRatio(
                                              aspectRatio: 1,
                                              child: MaterialButton(
                                                  textColor: Colors.black,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid),
                                                  ),
                                                  onPressed: () {
                                                    if (phone_number.length > 0)
                                                      setState(() {
                                                        phone_number
                                                            .removeLast();
                                                      });
                                                  },
                                                  child: IconButton(
                                                    icon: const Icon(
                                                        Icons.backspace),
                                                    onPressed: () {},
                                                  ))))
                                    ],
                                  ]
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(right: 60),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                          width: 150, // <-- Your width
                                          height: 75, // <-- Your height
                                          child: MaterialButton(
                                              color: Colors.black,
                                              textColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              onPressed: () {
                                                 if (phone_number.isEmpty) {
                                                  Flushbar(
                                                    title: "Missing field!",
                                                    message:
                                                        "Enter a phone number to proceed",
                                                    duration:
                                                        Duration(seconds: 3),
                                                    flushbarPosition:
                                                        FlushbarPosition.TOP,
                                                  )..show(context);
                                                }else{
                                                loginBloc.add(EnterOTPEvent(
                                                    phone_number.join()));
                                                }
                                                
                                              },
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_forward,
                                                    size: 30),
                                                onPressed: () {},
                                              )))
                                    ],
                                  ))
                            ])),
                      )));
            case EnterOTPState:
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                      appBar: AppBar(
                        title: const Text("Login"),
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
                      ),
                      body: Container(
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              const Text(
                                "Enter the OTP sent to your SMS",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                otp.join(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Wrap(
                                spacing: 50,
                                children: [
                                  for (int number = 1; number <= 3; number++)
                                    Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: MaterialButton(
                                                textColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                      style: BorderStyle.solid),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    otp.add(number);
                                                  });
                                                },
                                                child: Text(
                                                  number.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 30.0),
                                                )))),
                                ],

                                /////////
                              ),
                              SizedBox(height: 50),
                              Wrap(
                                spacing: 50,

                                children: [
                                  for (int number = 4; number <= 6; number++)
                                    Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: MaterialButton(
                                                textColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                      style: BorderStyle.solid),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    otp.add(number);
                                                  });
                                                },
                                                child: Text(
                                                  number.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 30.0),
                                                )))),
                                ],

                                /////////
                              ),
                              SizedBox(height: 50),
                              Wrap(
                                spacing: 50,
                                children: [
                                  for (int number = 7; number <= 9; number++)
                                    Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: MaterialButton(
                                                textColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                      style: BorderStyle.solid),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    otp.add(number);
                                                  });
                                                },
                                                child: Text(
                                                  number.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 30.0),
                                                )))),
                                ],
                              ),
                              SizedBox(height: 50),
                              Wrap(
                                spacing: 50,
                                children: [
                                  for (int number = 1;
                                      number <= 3;
                                      number++) ...[
                                    if (number == 1) ...[
                                      Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      )
                                    ],
                                    if (number == 2) ...[
                                      Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: AspectRatio(
                                              aspectRatio: 1,
                                              child: MaterialButton(
                                                  textColor: Colors.black,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      otp.add(0);
                                                    });
                                                  },
                                                  child: Text(
                                                    "0",
                                                    style: const TextStyle(
                                                        fontSize: 30.0),
                                                  ))))
                                    ],
                                    if (number == 3) ...[
                                      Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: AspectRatio(
                                              aspectRatio: 1,
                                              child: MaterialButton(
                                                  textColor: Colors.black,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid),
                                                  ),
                                                  onPressed: () {
                                                    if (phone_number.length > 1)
                                                      setState(() {
                                                        otp.removeLast();
                                                      });
                                                  },
                                                  child: IconButton(
                                                    icon: const Icon(
                                                        Icons.backspace),
                                                    onPressed: () {},
                                                  ))))
                                    ],
                                  ]
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(right: 60, left: 60),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 150, // <-- Your width
                                          height: 75, // <-- Your height
                                          child: MaterialButton(
                                              color: Colors.black,
                                              textColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              onPressed: () {
                                                loginBloc.add(
                                                    EnterMobileNumberEvent());
                                              },
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_back,
                                                    size: 30),
                                                onPressed: () {},
                                              ))),
                                      SizedBox(
                                          width: 150, // <-- Your width
                                          height: 75, // <-- Your height
                                          child: MaterialButton(
                                              color: Colors.black,
                                              textColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              onPressed: () {
                                                if (otp.isEmpty) {
                                                  Flushbar(
                                                    title: "Missing Field!",
                                                    message:
                                                        "Enter an OTP to proceed",
                                                    duration:
                                                        Duration(seconds: 3),
                                                    flushbarPosition:
                                                        FlushbarPosition.TOP,
                                                  )..show(context);
                                                }else{
                                                  loginBloc.add(ProcessOTPEvent(
                                                    otp.join()));
                                                }

                                                
                                                
                                              },
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_forward,
                                                    size: 30),
                                                onPressed: () {},
                                              )))
                                    ],
                                  )),
                              // DrawerHeader(
                              //     child: Image.asset("assets/images/logo.png")),
                            ])),
                      )));

            default:
              return const SizedBox();
          }
        });
  }
}
