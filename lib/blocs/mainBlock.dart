import 'package:flutter/cupertino.dart';

import 'blocSetting.dart';

const String URL_TOKENLESS_HOME_1 =
    "https://jsonplaceholder.typicode.com/photos?albumId=1";
const String URL_TOKENLESS_HOME_2 =
    "https://jsonplaceholder.typicode.com/photos?albumId=2";

class MainBloc extends BlocSetting {
  final String title = "Album";
  Orientation orientation = Orientation.portrait;
  String url = URL_TOKENLESS_HOME_1;
}

MainBloc mainBloc;
