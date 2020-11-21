import 'package:flutter/material.dart';
import 'package:album/blocs/count1Bloc.dart';
import 'package:album/blocs/mainBlock.dart';

class Counter1 extends StatefulWidget {
  @override
  _Counter1State createState() => _Counter1State();
}

class _Counter1State extends State<Counter1> {
  @override
  void initState() {
    super.initState();
    count1Bloc = Count1Bloc();
  }

  @override
  void dispose() {
    count1Bloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainBloc.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button, on total, this many times:',
            ),
            Text(
              '${mainBloc.counter1}',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${count1Bloc.counter1}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => count1Bloc.incrementCounter(this),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
