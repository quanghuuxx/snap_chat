import 'package:flutter/cupertino.dart';

extension BuildContextExt on BuildContext {
  T findState<T extends State>() {
    final parent = findAncestorStateOfType<T>();
    if (parent == null) {
      throw Exception('Not found parent state with type $T');
    }
    return parent;
  }

  T findWidget<T extends Widget>() {
    final parent = findAncestorWidgetOfExactType<T>();
    if (parent == null) {
      throw Exception('Not found parent widget with type $T');
    }
    return parent;
  }

  void hideKeyboard() => Focus.of(this).unfocus();

  RouteSettings? get currentRouter => ModalRoute.of(this)?.settings;

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


