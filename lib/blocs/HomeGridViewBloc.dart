import 'package:flutter/material.dart';

import 'blocSetting.dart';
import 'mainBlock.dart';

class HomeGridViewBloc extends BlocSetting {
  Orientation orientation = Orientation.portrait;
  String url = URL_TOKENLESS_HOME_1;

  setOrientation(state, orientation) {
    mainBloc.orientation = orientation;
  }

  setUrl(state, url) {
    rebuildWidget(
      setStates: () {},
      state: state,
    );
    mainBloc.url = url;
  }
}

HomeGridViewBloc homeGridViewBloc;
