// import 'package:flutter/material.dart';
// import 'package:album/controls/albumControl.dart';
// import 'package:album/models/AlbumModel.dart';
// import 'package:album/services/AlbumService.dart';
// import 'package:http/http.dart' as http;

// import 'config.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Album',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(title: 'Album'),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   final String title;

//   HomePage({Key key, this.title}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget buttonSection = Container(
//         child: new ButtonBar(mainAxisSize: MainAxisSize.min, children: [
//       new MaterialButton(
//           child: new Text('1'),
//           color: Colors.tealAccent,
//           textColor: Colors.white,
//           onPressed: () => {Config.noColumnsAlbum = URL_TOKENLESS_PORTRAT}),
//       new MaterialButton(
//           child: new Text('2'),
//           color: Colors.tealAccent,
//           textColor: Colors.white,
//           onPressed: () => {URL_TOKENLESS_SELECTED = URL_TOKENLESS_LANDSCAPE}),
//     ]));

//     Widget gridSection = Expanded(
//         child: new FutureBuilder<List<AlbumModel>>(
//       future: getAlbum(new http.Client()),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) print(snapshot.error);

//         return snapshot.hasData
//             ? new albumControl(album: snapshot.data)
//             : new Center(child: new CircularProgressIndicator());
//       },
//     ));

//     return new Scaffold(
//         appBar: AppBar(
//           title:
//               new Center(child: new Text(title, textAlign: TextAlign.center)),
//         ),
//         body: OrientationBuilder(builder: (context, orientation) {
//           return new Container(
//               child:
//                   new Column(children: <Widget>[buttonSection, gridSection]));
//         }));
//   }
// }
