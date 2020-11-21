import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'blocs/mainBlock.dart';
import 'views/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    mainBloc = MainBloc();
  }

  @override
  void dispose() {
    mainBloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SetState management",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
