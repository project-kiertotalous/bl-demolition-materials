import 'dart:convert';
import 'dart:io';

import 'package:uuid/uuid.dart';

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
    if (allNull(values) || values.isEmpty) {
      return null;
    }

    if (values.length == 1) {
      return values.first;
    }

    final listCopy = [...values];
    num firstValue = listCopy.removeAt(0) ?? 0;

    return listCopy.fold<num>(firstValue, (acc, val) => acc * (val ?? 0));
  }

  /// Returns true if any of the values in the provided list is not null.
  static bool anyNonNull<T>(List<T?> values) {
    return values.any((val) => val != null);
  }

  /// Returns true if all of the values in the provided list are null.
  static bool allNull<T>(List<T?> values) {
    return !anyNonNull(values);
  }

  /// Given a list of nullable numbers, returns 0 if every number is null.
  /// Otherwise, treats every null value as 0 and multiplies the result.
  static num? multiplyOrZero(List<num?> values) {
    return values.fold<num>(1, (acc, val) => acc * (val ?? 0));
  }

  /// Given a mapping function, aggregates the list of elements. Returns null if
  /// every element in the list is null.
  ///
  /// Example usage:
  /// ```dart
  /// final sumAggregate = Utils.aggregateOrNull(
  ///   parts,
  ///   (part) => part.value,
  ///   (total, part) => total + part,
  ///   0
  /// );
  /// ```
  static A? aggregateOrNull<T, A>(List<T?> elements,
      A? Function(T) mappingFunction, A Function(A, A) aggregator, A init) {
    final aggregateElements = elements
        .where((el) => el != null)
        .map((el) => mappingFunction(el as T))
        .where((mappedEl) => mappedEl != null)
        .cast<A>();

    if (aggregateElements.isEmpty) {
      return null;
    }

    return aggregateElements.fold<A>(init, aggregator);
  }

  /// Calls the provided function with a temporary file. The temporary will be
  /// deleted afterwards.
  static void withTempFile(Function(File) fileHandler) {
    final dir = Directory.systemTemp.createTempSync();
    final File tempFile = File("${dir.path}/$Uuid()");
    tempFile.createSync();
    fileHandler(tempFile);
    dir.deleteSync(recursive: true);
  }

  /// Given a Map&lt;String, dynamic&gt;, encodes it to JSON. After encoding,
  /// decodes it back using the provided function. If writeToDisk is set to true,
  /// the encoded JSON is additionally written to a temporary file, and read again
  /// from there after which the encoding process will happen.
  static T jsonRoundTrip<T>(Map<String, dynamic> objectJSON,
      T Function(Map<String, dynamic>) fromJSON,
      [bool writeToDisk = false]) {
    late Map<String, dynamic> readJSON;

    if (writeToDisk) {
      Utils.withTempFile((file) {
        final writeJSON = jsonEncode(objectJSON);
        file.writeAsStringSync(writeJSON);
        readJSON = jsonDecode(file.readAsStringSync());
      });
    } else {
      final writeJSON = jsonEncode(objectJSON);
      readJSON = jsonDecode(writeJSON);
    }

    return fromJSON(readJSON);
  }
}
