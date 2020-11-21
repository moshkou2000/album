import 'package:album/widgets/counter2Text.dart';
import 'package:flutter/material.dart';
import 'package:album/blocs/mainBlock.dart';

class Counter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainBloc.title),
      ),
      body: Center(
        child: Counter2Text(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: count2Bloc.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

//https://medium.com/flutter-community/flutter-state-management-setstate-fn-is-the-easiest-and-the-most-powerful-44703c97f035
