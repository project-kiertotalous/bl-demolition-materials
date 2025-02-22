/// Offers some utility arithmetic methods
class Arithmetics {
  /// Given a list of nullable numbers, returns null if every number is null.
  /// Otherwise, treats every null value as 0 and sums the result.
  static num? sumOrNull(List<num?> values) {
    num sum = values.fold<num>(0, (acc, val) => acc + (val ?? 0));
    return values.every((val) => val == null) ? null : sum;
  }
}
