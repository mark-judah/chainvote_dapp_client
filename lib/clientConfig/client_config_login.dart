import 'package:election_app/clientConfig/client_config_bloc.dart';
import 'package:election_app/clientConfig/client_configuration.dart';
import 'package:election_app/loginBloc/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ClientConfigLogin extends StatefulWidget {
  ClientConfigLogin({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ClientConfigLogin> {
  @override
  void initState() {
    emailInputController = TextEditingController(text: '');
    pwdInputController = TextEditingController(text: '');
    super.initState();
  }

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  late final TextEditingController emailInputController;
  late final TextEditingController pwdInputController;
  final ClientConfigBloc configBloc = ClientConfigBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientConfigBloc, ClientConfigState>(
        bloc: configBloc,
        //listen for emitted action states and perform an action
        listenWhen: (previous, current) => current is ClientConfigActionState,
        //build when there is no action state
        buildWhen: (previous, current) => current is! ClientConfigActionState,
        listener: (context, state) {
          if (state is NavigateToConfigActionState) {
            final navigateToConfigActionState =
                state;
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ClientConfig(
                  navigateToConfigActionState.counties,
                  navigateToConfigActionState.constituencies,
                  navigateToConfigActionState.wards,
                  navigateToConfigActionState.polling_station
                )));
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

            default:
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
                        elevation: 0.00,
                        backgroundColor: Colors.black,
                        leading: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Login("")))),
                      ),
                      resizeToAvoidBottomInset: false,
                      body: Center(
                          child: Form(
                        key: _loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(
                                  bottom: 50, left: 30.0, right: 20.0),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                            Container(
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Email',
                                          hintText: "john.doe@gmail.com"),
                                      controller: emailInputController,
                                      keyboardType: TextInputType.emailAddress,
                                    ))),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Password',
                                          hintText: "********"),
                                      controller: pwdInputController,
                                      obscureText: true,
                                    ))),
                            const SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              child: const Text("Login"),
                              color: Colors.black,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () {
                                if (kDebugMode) {
                                  print(emailInputController.text);
                                }
                                configBloc.add(NavigateToConfigurationsEvent(
                                    emailInputController.text,
                                    pwdInputController.text));
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ))));
          }
        });
  }
}
