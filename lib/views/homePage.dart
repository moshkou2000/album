import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:album/models/albumModel.dart';
import 'package:album/blocs/homeBloc.dart';
import 'package:album/blocs/mainBlock.dart';
import 'package:album/events/homeButtonEvent.dart';

const TAG = '::HomePage -> ';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc();
  }

  @override
  void dispose() {
    homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text(mainBloc.title, textAlign: TextAlign.center)),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return new Column(
            children: [buttons(), Expanded(child: gridView())],
          );
        }));
  }

  Container buttons() {
    return new Container(
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
              onPressed: () => {
                    print(TAG + 'button 1 pressed'), // logger
                    homeBloc.inButtonEvent
                        .add(HomeButtonEvent(URL_TOKENLESS_HOME_1))
                  }),
          new MaterialButton(
              child: new Text('2',
                  style: TextStyle(
                    fontSize: 10,
                  )),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () => {
                    print(TAG + 'button 2 pressed'), // logger
                    homeBloc.inButtonEvent
                        .add(HomeButtonEvent(URL_TOKENLESS_HOME_2))
                  }),
        ]));
  }

  StreamBuilder gridView() {
    return new StreamBuilder<List<AlbumModel>>(
      stream: homeBloc.outButtons,
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return new Text('Service is not available at the moment');
        else if (snapshot.data != null && snapshot.data.length > 0)
          return OrientationBuilder(builder: (context, orientation) {
            return new Padding(
              padding: EdgeInsets.all(20),
              child: new GridView.count(
                primary: true,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 5,
                childAspectRatio: 0.8,
                children: List.generate(snapshot.data.length, (index) {
                  return getGridCell(snapshot.data[index]);
                }),
              ),
            );
          });
        else
          return new Center(child: new CircularProgressIndicator());
      },
    );
  }

  Container getGridCell(AlbumModel album) {
    return new Container(
        child: new Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new FadeInImage.memoryNetwork(
              image: album.thumbnailUrl, placeholder: kTransparentImage),
          new Text(
            album.title,
            maxLines: 1,
            softWrap: true,
            style: TextStyle(
              fontSize: 10,
            ),
          )
        ],
      ),
    ));
  }
}
