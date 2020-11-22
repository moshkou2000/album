import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:album/models/AlbumModel.dart';
import 'package:album/blocs/HomeGridViewBloc.dart';
import 'package:album/services/AlbumService.dart';

class HomeGridView extends StatefulWidget {
  @override
  HomeGridViewState createState() => HomeGridViewState();
}

class HomeGridViewState extends State<HomeGridView> {
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
    return new FutureBuilder<List<AlbumModel>>(
      future: getAlbum(homeGridViewBloc.url),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? OrientationBuilder(builder: (context, orientation) {
                return new Padding(
                  padding: EdgeInsets.all(20),
                  child: new GridView.count(
                    primary: true,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 5,
                    childAspectRatio: 0.8,
                    children: List.generate(snapshot.data.length, (index) {
                      return getGridCell(snapshot.data[index]);
                    }),
                  ),
                );
              })
            : new Center(child: new CircularProgressIndicator());
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
