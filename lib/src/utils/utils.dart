/// Offers some utility arithmetic methods
class Utils {
  /// Given a list of nullable numbers, returns null if every number is null.
  /// Otherwise, treats every null value as 0 and sums the result.
  static num? sumOrNull(List<num?> values) {
    num sum = values.fold<num>(0, (acc, val) => acc + (val ?? 0));
    return values.every((val) => val == null) ? null : sum;
  }

  /// Returns true if any of the values in the provided list is null.
  static bool anyNull(List<Object?> values) {
    return values.any((val) => val == null);
  }

  /// Given a list of nullable numbers, returns null if every number is null.
  /// Otherwise, treats every null value as 0 and multiplies the result.
  static num? multiplyOrNull(List<num?> values) {
    num sum = values.fold<num>(0, (acc, val) => acc * (val ?? 0));
    return values.every((val) => val == null) ? null : sum;
  }

  /// Returns true if any of the values in the provided list is not null.
  static bool anyNonNull(List<num?> values) {
    return values.any((val) => val != null);
  }

  /// Given a list of nullable numbers, returns 0 if every number is null.
  /// Otherwise, treats every null value as 0 and multiplies the result.
  static num? multiplyOrZero(List<num?> values) {
    num sum = values.fold<num>(0, (acc, val) => acc * (val ?? 0));
    return sum;
  }
}
