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
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Container(
              color: Color(0xF5F5F5F1),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Select your preffered candidate",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 350,
                            height: 500,
                            color: Colors.white,
                            child: Column(children: [
                              const Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/uhuru.jpg"),
                                      radius: 60)),
                              Text(
                                "Uhuru Kenyatta",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                "Jubilee Party",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    decoration: TextDecoration.none),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Text(
                                    "Empowering the People, Building the Nation",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        decoration: TextDecoration.none),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Let us unite in the spirit of hope and progress. Together, we can build a stronger, more inclusive future for all. Your vote is the voice that shapes our destiny. Let it resonate with the promise of a better tomorrow.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        decoration: TextDecoration.none),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(20),
                                  child: SizedBox(
                                    width: 100,
                                    child: MaterialButton(
                                      color: Colors.black,
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                          Text("Vote",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  decoration:
                                                      TextDecoration.none))
                                        ],
                                      ),
                                    ),
                                  ))
                            ]),
                          )),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 350,
                            height: 500,
                            color: Colors.white,
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/raila.jpeg"),
                                      radius: 60)),
                              Text(
                                "Raila Odinga",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                "Azimio Party",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                "Our land and jobs, now!",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    decoration: TextDecoration.none),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Stand strong, unite for change! Together, we'll break chains of injustice and build a brighter future for all. Vote for progress, vote for a better tomorrow!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        decoration: TextDecoration.none),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(20),
                                  child: SizedBox(
                                    width: 100,
                                    child: MaterialButton(
                                      color: Colors.black,
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                          Text("Vote",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  decoration:
                                                      TextDecoration.none))
                                        ],
                                      ),
                                    ),
                                  ))
                            ]),
                          )),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 350,
                            height: 500,
                            color: Colors.white,
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/ruto.jpeg"),
                                      radius: 60)),
                              Text(
                                "William Ruto",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                "UDA Party",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    decoration: TextDecoration.none),
                              ),
                              Text(
                                "Empowering Tomorrow, Today!",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    decoration: TextDecoration.none),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    " The Democratic Alliance stands for a united South Africa, where every individual has the opportunity to prosper. We champion a thriving economy, inclusivity, and a commitment to quality education.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        decoration: TextDecoration.none),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(20),
                                  child: SizedBox(
                                    width: 100,
                                    child: MaterialButton(
                                      color: Colors.black,
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                          Text("Vote",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  decoration:
                                                      TextDecoration.none))
                                        ],
                                      ),
                                    ),
                                  ))
                            ]),
                          )),
                    ],
                  )
                ],
              ),
            )));
  }
}
