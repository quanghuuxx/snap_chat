import 'package:flutter/material.dart';

abstract class StateBase<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
      ..addObserver(this)
      ..addPostFrameCallback((duration) {
        onViewCreated();
      });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      default:
    }
  }

  @mustCallSuper
  void onResumed() {}
  @mustCallSuper
  void onPaused() {}

  void onViewCreated() {}

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

extension StateBaseGetterExt on StateBase {
  ThemeData get theme => Theme.of(context);
}
