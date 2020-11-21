import 'blocSetting.dart';
import 'mainBlock.dart';

class Count2Bloc extends BlocSetting {
  var counter2State;
  int counter2 = 0;
  incrementCounter() {
    rebuildWidgets(
      setStates: () {
        counter2++;
      },
      states: [counter2State],
    );
    mainBloc?.counter2++;
  }
}

Count2Bloc count2bloc;
