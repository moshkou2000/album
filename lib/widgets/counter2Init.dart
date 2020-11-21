import 'package:album/blocs/count2Bloc.dart';
import 'package:flutter/material.dart';

import 'counter2.dart';

class Counter2Init extends StatefulWidget {
  @override
  _Counter2InitState createState() => _Counter2InitState();
}

class _Counter2InitState extends State<Counter2Init> {
  @override
  void initState() {
    super.initState();
    count2Bloc = Count2Bloc();
  }

  @override
  void dispose() {
    count2Bloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Counter2();
  }
}
