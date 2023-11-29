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
              child: Center(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                        onTap: () {
                          switch(position){
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Presidential()),
                              );
                          }

                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              electionTypes[position],
                              style: TextStyle(fontSize: 22.0),
                            ),
                          ),
                        ));
                  },
                ),
              ),
            )));
  }
}
