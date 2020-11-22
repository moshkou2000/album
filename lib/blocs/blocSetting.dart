import 'package:flutter/material.dart';

class BlocSetting extends State {
  rebuildWidget({VoidCallback setStates, State state}) {
    if (state != null) {
      setState(setStates ?? () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        "This build function will never be called. it has to be overriden here because State interface requires this");
    return null;
  }
}
