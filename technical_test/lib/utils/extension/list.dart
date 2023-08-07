/// {@category Extension}
/// Extension of [Iterable] :
///
/// - [firstWhereOrNull] : Return the first element that satisfies a predicate, else return a null value.
///
extension IterableUtils<T> on Iterable<T> {
  /// Return the first element that satisfies a predicate, else return a null value.
  ///
  /// [Function] predicate: Function to test each element for a condition.
  ///
  T? firstWhereOrNull(bool Function(T) predicate) {
    final val = where((element) => predicate(element));
    return val.isNotEmpty ? val.first : null;
  }

  /// Return the last element that satisfies a predicate, else return a null value.
  ///
  /// [Function] predicate: Function to test each element for a condition.
  ///
  T? lastWhereOrNull(bool Function(T) predicate) {
    final val = where((element) => predicate(element));
    return val.isNotEmpty ? val.last : null;
  }
}

extension ListUtils<U> on List<U> {
  bool doesNotContain(U element) => !contains(element);
}
