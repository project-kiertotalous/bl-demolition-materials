import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('#multiplyOrNull', () {
    test('with nulls', () {
      final result = Utils.multiplyOrNull([5, 5, null]);
      expect(result, equals(0));
    });

    test('with regular numbers', () {
      final result = Utils.multiplyOrNull([5, 5]);
      expect(result, equals(25));
    });

    test('does not mutate the original list', () {
      final list = [6, 9];
      final result = Utils.multiplyOrNull(list);
      expect(result, equals(54));
      expect(list, equals([6, 9]));
    });
  });
}
