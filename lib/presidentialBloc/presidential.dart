import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:election_app/presidentialBloc/presidential_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Presidential extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Presidential> {
  @override
  void initState() {
    super.initState();
  }

  List<String> candidates = [
    'Kalonzo Musyoka',
    'William Ruto',
    'Rigathi Gachagua',
  ];

  List<String> images = [
    'assets/images/kalonzo.jpg',
    'assets/images/ruto.png',
    'assets/images/rigathi.jpg'
  ];

  List<String> party = [
    'Azimio Party',
    'UDA Party',
    'Jubilee Party',
  ];

  List<String> slogan = [
    'Empowering the people, building the nation',
    'Every hustle matters',
    'Empowering tomorrow,today',
  ];

  List<String> statement = [
    'Let us unite in the spirit of hope and progress. Together, we can build a stronger, more inclusive future for all. Your vote is the voice that shapes our destiny. Let it resonate with the promise of a better tomorrow.',
    'The Democratic Alliance stands for a united kenya, where every individual has the opportunity to prosper. We champion a thriving economy, inclusivity, and a commitment to quality education.',
    "Stand strong, unite for change! Together, we'll break chains of injustice and build a brighter future for all. Vote for progress, vote for a better tomorrow!",
  ];
  final PresidentialBloc presBloc = PresidentialBloc();

  @override
  Widget build(BuildContext context) {
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
                icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                            for (int i = 0; i < candidates.length; i++) ...[
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: 350,
                                    height: 550,
                                    color: Colors.white,
                                    child: Column(children: [
                                      Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child:Text(
                                        candidates[i],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            decoration: TextDecoration.none),
                                      )),
                                      Text(
                                        party[i],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            decoration: TextDecoration.none),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: CircleAvatar(
                                              backgroundImage:
                                                  AssetImage(images[i]),
                                              radius: 100)),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Text(
                                            slogan[i],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.none),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            statement[i],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.none),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: SizedBox(
                                            width: 150,
                                            height: 40,
                                            child: MaterialButton(
                                                color: Colors.black,
                                                onPressed: () {
                                                  AwesomeDialog(
                                                    width: 600,
                                                  
                                                    btnCancelColor: Colors.black,
                                                    btnOkColor: Colors.black,
                                                    context: context,
                                                    dialogType:
                                                        DialogType.warning,
                                                    animType:
                                                        AnimType.bottomSlide,
                                                    title: 'Confirm Choice',
                                                    desc:
                                                        'Are you sure about your selection, this action cannot be undone.',
                                                    btnCancelOnPress: () {},
                                                    btnOkOnPress: () {
                                                      presBloc.add(NewVoteEvent("candidate_id"));
                                                    },
                                                  ).show();
                                                },
                                                child: const Text("VOTE",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                        decoration:
                                                            TextDecoration
                                                                .none))),
                                          ))
                                    ]),
                                  )),
                            ],
                          ])
                    ]))));
  }
}
