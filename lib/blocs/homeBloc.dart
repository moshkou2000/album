import 'dart:async';

import 'package:album/events/homeButtonEvent.dart';
import 'package:album/models/albumModel.dart';
import 'package:album/services/albumProvider.dart';

import 'mainBlock.dart';

class HomeBloc {
  String url;
  AlbumProvider albumProvider;

  final buttonEventController = StreamController<ButtonEvent>();
  StreamSink<ButtonEvent> get inButtonEvent => buttonEventController.sink;

  final buttonCategoryesStateController = StreamController<List<AlbumModel>>();
  StreamSink<List<AlbumModel>> get inButtons =>
      buttonCategoryesStateController.sink;
  Stream<List<AlbumModel>> get outButtons =>
      buttonCategoryesStateController.stream;

  final buttonValueStateController = StreamController<String>();
  StreamSink<String> get inButtonValue => buttonValueStateController.sink;
  Stream<String> get outButtonValue => buttonValueStateController.stream;

  HomeBloc() {
    buttonEventController.stream.listen(mapEventToState);
    onButtonCategorySelected(URL_TOKENLESS_HOME_1);
  }

  void mapEventToState(ButtonEvent event) {
    if (event is HomeButtonEvent) {
      onButtonCategorySelected(event.url);
    }
  }

  void onButtonCategorySelected(String newUrl) async {
    print(newUrl != url ? 'new url $newUrl' : 'same url $newUrl'); // logger

    if (newUrl != url) {
      url = newUrl;
      inButtonValue.add(newUrl);

      final response = await albumProvider.getAlbum(newUrl);

      print(response != null
          ? 'got ${response.length} items'
          : 'null response'); // logger

      if (response != null) {
        inButtons.add(response);
      }
    }
  }

  void dispose() {
    print('dispose HomeBloc'); // logger

    buttonEventController.close();
    buttonCategoryesStateController.close();
    buttonValueStateController.close();
  }
}
