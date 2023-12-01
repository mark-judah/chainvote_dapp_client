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
  String mobileNumber = "";
  String OTP = "";

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
                                mobileNumber,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int number = 1; number <= 3; number++)
                                  
                                    Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: MaterialButton(
                                            child: Text(number.toString(),style: TextStyle(
                                              fontSize: 30.0
                                            ),),
                                            textColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                                style: BorderStyle.solid
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            onPressed: () {
                                            
                                            })),
                                ],
                              ),
                              // NumPad(
                              //   arabicDigits: false,
                              //   onType: (value) {
                              //     mobileNumber += value;
                              //     setState(() {});
                              //   },
                              //   rightWidget: IconButton(
                              //     icon: const Icon(Icons.backspace),
                              //     onPressed: () {
                              //       if (mobileNumber.isNotEmpty) {
                              //         mobileNumber = mobileNumber.substring(
                              //             0, mobileNumber.length - 1);
                              //         setState(() {});
                              //       }
                              //     },
                              //   ),
                              // ),
                              const SizedBox(
                                height: 40,
                              ),
                              MaterialButton(
                                  child: const Text("Next"),
                                  color: Colors.black,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  onPressed: () {
                                    loginBloc.add(EnterOTPEvent());
                                  }),
                              // DrawerHeader(
                              //     child: Image.asset("assets/images/logo.png")),
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
                                    fontSize: 30,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                OTP,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              NumPad(
                                arabicDigits: false,
                                onType: (value) {
                                  OTP += value;
                                  setState(() {});
                                },
                                rightWidget: IconButton(
                                  icon: const Icon(Icons.backspace),
                                  onPressed: () {
                                    if (OTP.isNotEmpty) {
                                      OTP = OTP.substring(0, OTP.length - 1);
                                      setState(() {});
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              MaterialButton(
                                  child: const Text("Login"),
                                  color: Colors.black,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  onPressed: () {
                                    loginBloc.add(ProcessOTPEvent(OTP));
                                  }),
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
