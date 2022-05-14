import 'package:flutter/cupertino.dart';

extension BuildContextExt on BuildContext {
  T findState<T extends State>() {
    final _parent = findAncestorStateOfType<T>();
    if (_parent == null) {
      throw Exception('Not found parent state with type $T');
    }
    return _parent;
  }

  T findWidget<T extends Widget>() {
    final _parent = findAncestorWidgetOfExactType<T>();
    if (_parent == null) {
      throw Exception('Not found parent widget with type $T');
    }
    return _parent;
  }

  void hideKeyboard() => Focus.of(this).unfocus();

  RouteSettings? currentRouter() => ModalRoute.of(this)?.settings;

  Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      Navigator.of(this)
          .pushReplacementNamed<T, TO>(routeName, arguments: arguments);

  Future<T?> pushNamed<T>(
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  void pop<T>([T? result]) => Navigator.of(this).pop<T>(result);
}


