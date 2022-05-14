extension ListExt<T> on List<T> {
  void replace(T old, T replace) {
    final _idx = indexOf(old);
    if (_idx != -1) {
      removeAt(_idx);
      insert(_idx, replace);
    }
  }

  void replaceWhere(bool Function(T) test, T Function(T) replace) {
    final _idx = indexWhere((e) => test(e));
    if (_idx != -1) {
      final old = this[_idx];
      removeAt(_idx);
      insert(_idx, replace(old));
    }
  }

  List<S> genarate<S>(S Function(int index, T value) genarate) {
    final _list = <S>[];
    for (var i = 0; i < length; i++) {
      _list.add(genarate(i, this[i]));
    }
    return _list;
  }
}
