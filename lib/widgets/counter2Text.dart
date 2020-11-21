import 'package:flutter/material.dart';
import 'package:album/blocs/mainBlock.dart';

class Counter2Text extends StatefulWidget {
  @override
  _Counter2TextState createState() => _Counter2TextState();
}

class _Counter2TextState extends State<Counter2Text> {
  @override
  void initState() {
    super.initState();
    count2Bloc.counter2State = this;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button, on total, this many times:',
        ),
        Text(
          '${mainBloc.counter2}',
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '${count2Bloc.counter2}',
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    );
  }
}
