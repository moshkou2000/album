import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:album/widgets/homeGridView.dart';
import 'package:album/widgets/homeButtons.dart';
import 'package:album/blocs/mainBlock.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text(mainBloc.title, textAlign: TextAlign.center)),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return new Column(
            children: [HomeButtons(), Expanded(child: HomeGridView())],
          );
        }));
  }
}
