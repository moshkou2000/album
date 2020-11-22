import 'package:album/blocs/HomeGridViewBloc.dart';
import 'package:flutter/material.dart';

import 'package:album/blocs/mainBlock.dart';

class HomeButtons extends StatefulWidget {
  @override
  HomeButtonsState createState() => HomeButtonsState();
}

class HomeButtonsState extends State<HomeButtons> {
  @override
  void initState() {
    super.initState();
    homeGridViewBloc = HomeGridViewBloc();
  }

  @override
  void dispose() {
    homeGridViewBloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new ButtonBar(
            mainAxisSize: MainAxisSize.min,
            buttonHeight: 24,
            buttonMinWidth: 26,
            buttonPadding: new EdgeInsets.all(0.0),
            children: [
          new MaterialButton(
              child: new Text('1',
                  style: TextStyle(
                    fontSize: 10,
                  )),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () =>
                  homeGridViewBloc.setUrl(this, URL_TOKENLESS_HOME_1)),
          new MaterialButton(
              child: new Text('2',
                  style: TextStyle(
                    fontSize: 10,
                  )),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () =>
                  homeGridViewBloc.setUrl(this, URL_TOKENLESS_HOME_2)),
        ]));
  }
}
