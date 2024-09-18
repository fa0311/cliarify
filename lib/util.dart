extension MapEntryIterableExtension<K, V> on Map<K, V> {
  Iterable<(K, V)> get tuple => entries.map((e) => (e.key, e.value));
}

extension IterableExtension2<T, U> on (Iterable<T>, Iterable<U>) {
  Iterable<R> map<R>(R Function(T, U) f) {
    assert(this.$1.length == this.$2.length);
    return List.generate(this.$1.length, (i) => f(this.$1.elementAt(i), this.$2.elementAt(i)));
  }
}

extension IterableExtension3<T, U, V> on (Iterable<T>, Iterable<U>, Iterable<V>) {
  Iterable<R> map<R>(R Function(T, U, V) f) {
    assert(this.$1.length == this.$2.length);
    assert(this.$2.length == this.$3.length);
    return List.generate(this.$1.length, (i) => f(this.$1.elementAt(i), this.$2.elementAt(i), this.$3.elementAt(i)));
  }
}
