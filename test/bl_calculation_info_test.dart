import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:test/test.dart';

void main() {
  group('Property evaluation info', () {
    group('Large property evaluation info', () {
      late LargePropertyEvaluationInfo evaluationInfo;

      setUp(() {
        evaluationInfo = LargePropertyEvaluationInfo(
            propertyName: 'property',
            buildingType: 'buildingType',
            address: 'address',
            municipality: 'municipality',
            author: 'author',
            date: DateTime.utc(1994),
            version: DateTime.utc(1),
            description: 'description');
      });

      test('Sets members accordingly', () {
        expect(evaluationInfo.propertyName, equals('property'));
        expect(evaluationInfo.buildingType, equals('buildingType'));
        expect(evaluationInfo.address, equals('address'));
        expect(evaluationInfo.municipality, equals('municipality'));
        expect(evaluationInfo.author, equals('author'));
        expect(evaluationInfo.date, equals(DateTime.utc(1994)));
        expect(evaluationInfo.version, equals(DateTime.utc(1)));
        expect(evaluationInfo.description, equals('description'));
      });

      test('Has proper equality check', () {
        final otherEvaluationInfo = evaluationInfo.copyWith();
        expect(otherEvaluationInfo == evaluationInfo, isTrue);
      });
    });
  });
}
