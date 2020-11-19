import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gridview/models/AlbumModel.dart';

void main() {
  runApp(MyApp());
}

const int COLUMNS_PORTRAT = 2;
const int COLUMNS_LANDSCAPE = 5;
const String URL_TOKENLESS_PORTRAT = "https://jsonplaceholder.typicode.com/photos?albumId=1";
const String URL_TOKENLESS_LANDSCAPE = "https://jsonplaceholder.typicode.com/photos?albumId=2";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child: new Text(widget.title, textAlign: TextAlign.center)),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return new Container(
            child: new Column(children: <Widget>[
              new ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new MaterialButton(
                    child: new Text('1'),
                    color: Colors.tealAccent,
                    textColor: Colors.white,
                    onPressed: () => {}
                  ),
                  new MaterialButton(
                    child: new Text('2'),
                    color: Colors.tealAccent,
                    textColor: Colors.white,
                    onPressed: () => {}
                  ),
              ]),
              new Expanded(
                child: FutureBuilder<List<AlbumModel>>(
                  future: getAlbum(),
                  builder: (context, response) {
                    if (response.hasData) {
                      return GridView.count(
                        // 2 columns in portrait
                        // 5 columns in landscape mode
                        crossAxisCount: orientation == Orientation.portrait ? COLUMNS_PORTRAT : COLUMNS_LANDSCAPE,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(response.data.length, (index) {
                          return new Row(children: <Widget>[
                            new Expanded(child: new Image.network(response.data[index].thumbnailUrl)),
                            Text(response.data[index].title)
                          ]);
                        }),
                      );
                    } else if (response.hasError) {
                      return Text('error: ${response.error.toString()}');
                    }
                    return CircularProgressIndicator();
                  })
                  
              )
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<AlbumModel>> getAlbum() async {
    final response = await http.get(Uri.encodeFull(URL_TOKENLESS_PORTRAT));
    if (response.statusCode == 200) {
      return AlbumModel.toList(response.body);
    } else {
      throw Exception();
    }
  }



}
