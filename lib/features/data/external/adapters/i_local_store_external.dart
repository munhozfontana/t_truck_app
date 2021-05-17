mixin ILocalStoreExternal {
  Future<Object?>? take(String key);
  Future<void> save(String key, dynamic value);
}
