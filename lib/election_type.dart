import 'package:another_flushbar/flushbar.dart';
import 'package:election_app/presidentialBloc/presidential.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElectionType extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ElectionType> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> electionTypes = [
      'Presidential',
      'Gubernatorial',
      'Senatorial',
      'National Assembly',
      'Women Representative',
      'County Assembly'
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("All Elections"),
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
                child: Padding(
              padding: EdgeInsets.only(left: 250),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select an Election Type",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(height: 30),
                    for (int i = 0; i < electionTypes.length; i++) ...[
                      SizedBox(
                        width: 500, // <-- Your width
                        height: 50, // <-- Your height
                        child: MaterialButton(
                          color: Colors.white,
                          onPressed: () {
                            if (i > 0) {
                              Flushbar(
                                title: "Pending feature",
                                message:
                                    "Only the presidential election is available",
                                duration: Duration(seconds: 3),
                                flushbarPosition: FlushbarPosition.TOP,
                              )..show(context);
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Presidential()));
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              Text(electionTypes[i],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      decoration: TextDecoration.none))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ]
                  ]),
            ))));
  }
}
