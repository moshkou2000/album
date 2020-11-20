import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:gridview/models/AlbumModel.dart';

import '../config.dart';

class GridViewControl extends StatefulWidget {
  final List<AlbumModel> album;

  GridViewControl({Key key, this.album}) : super(key: key);

  @override
  State<StatefulWidget> createState() {}

  Container getStructuredGridCell(AlbumModel album) {
    return new Container(
        child: new Padding(
      padding: EdgeInsets.all(20.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new FadeInImage.memoryNetwork(
              image: album.thumbnailUrl, placeholder: kTransparentImage),
          new Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  album.title,
                  maxLines: 1,
                  softWrap: true,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      scrollDirection: Axis.vertical,
      crossAxisCount: Config.noColumnsAlbum,
      childAspectRatio: 0.80,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),

      // childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,

      children: List.generate(album.length, (index) {
        return getStructuredGridCell(album[index]);
      }),
    );
  }
}
