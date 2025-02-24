/// Offers some utility arithmetic methods
class Utils {
  /// Given a list of nullable numbers, returns null if every number is null.
  /// Otherwise, treats every null value as 0 and sums the result.
  static num? sumOrNull(List<num?> values) {
    num sum = values.fold<num>(0, (acc, val) => acc + (val ?? 0));
    return values.every((val) => val == null) ? null : sum;
  }

  static bool anyNonNull(List<num?> values) {
    return values.any((val) => val != null);
  }
}
