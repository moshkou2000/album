import 'blocSetting.dart';
import 'mainBlock.dart';

class HomeButtonsBloc extends BlocSetting {
  String url = URL_TOKENLESS_HOME_1;

  setUrl(state, url) {
    mainBloc.url = url;
  }
}

HomeButtonsBloc homeButtonsBloc;
