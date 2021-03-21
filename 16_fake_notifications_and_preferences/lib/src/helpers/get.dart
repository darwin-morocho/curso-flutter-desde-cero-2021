class Get {
  Get._();
  static Get i = Get._();

  Map<String, dynamic> _data = Map();

  String _getKey(Type t, String? tag) {
    if (tag != null) {
      return "${t.toString()}$tag";
    }

    return t.toString();
  }

  void put<T>(dynamic dependency, {String? tag}) {
    final String key = _getKey(T, tag);
    _data[key] = dependency;
  }

  T find<T>({String? tag}) {
    final String key = _getKey(T, tag);

    if (!_data.containsKey(key)) {
      throw AssertionError("$key not found, make sure call put first");
    }
    return _data[key];
  }

  void remove<T>({String? tag}) {
    final String key = _getKey(T, tag);
    _data.remove(key);
  }
}
