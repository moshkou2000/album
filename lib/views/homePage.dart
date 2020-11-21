import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:album/blocs/mainBlock.dart';
import 'package:album/widgets/counter1.dart';
import 'package:album/widgets/counter2.dart';

class MyHomePage extends StatelessWidget {
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
            RaisedButton(
              child: Text('Go To Counter 1'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Counter1(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text('Go To Counter 2'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Counter2(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
