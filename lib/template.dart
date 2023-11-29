import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  var passed_value = "";

  Template(this.passed_value, {Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Template> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container()
    );
  }
}