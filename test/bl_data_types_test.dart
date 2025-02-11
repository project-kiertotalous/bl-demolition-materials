import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:test/test.dart';

void main() {
  group('Data types', () {
    group('Length', () {
      test('Can be created from millimeters', () {
        final length = Length.fromMillimeters(10_000);

        expect(length.meters, equals(10));
        expect(length.runningMeters, equals(10));
        expect(length.millimeters, equals(10_000));
      });

      test('Can be created from meters', () {
        final length = Length.fromMeters(10);

        expect(length.meters, equals(10));
        expect(length.runningMeters, equals(10));
        expect(length.millimeters, equals(10_000));
      });

      test('Can be created from running meters', () {
        final length = Length.fromRunningMeters(10);

        expect(length.meters, equals(10));
        expect(length.runningMeters, equals(10));
        expect(length.millimeters, equals(10_000));
      });

      test('Can be compared', () {
        final length1 = Length.fromMeters(1000);
        final length2 = Length.fromMillimeters(1000 * 1000);

        expect(length1, equals(length2));
      });

      test('To string', () {
        expect(Length.fromMillimeters(1234).toString(), equals('1234 mm'));
      });
    });

    group('Percentage', () {
      test('Arithmetics', () {
        expect(Percentage(50) - Percentage(25), equals(Percentage(25)));
        expect(Percentage(20) + Percentage(70), equals(Percentage(90)));
        expect(Percentage(5) * Percentage(5), equals(Percentage(25)));
        expect(Percentage(100) / Percentage(10), equals(Percentage(10)));
      });

      test('From fractions', () {
        expect(Percentage.fromFraction(0.25), equals(Percentage(25)));
      });

      test('To string', () {
        expect(Percentage(25).toString(), equals("25 %"));
        expect(Percentage(25.0).toString(), equals("25.0 %"));
      });
    });

    group('Square meter', () {
      test('Arithmetics', () {
        expect(SquareMeter(300) + SquareMeter(175), equals(SquareMeter(475)));
        expect(SquareMeter(77) - SquareMeter(27), equals(SquareMeter(50)));
        expect(SquareMeter(5) / SquareMeter(5), equals(SquareMeter(1)));
        expect(SquareMeter(5) * SquareMeter(5), equals(SquareMeter(25)));
      });

      test('Factory constructors', () {
        expect(SquareMeter.fromSquare(5), equals(SquareMeter(25)));
        expect(SquareMeter.fromRectangle(9, 5), equals(SquareMeter(45)));
      });

      test('To string', () {
        expect(SquareMeter(5).toString(), equals('5 m²'));
        expect(SquareMeter(5.0).toString(), equals('5.0 m²'));
      });
    });

    group('Cubic meter', () {
      test('Arithmetics', () {
        expect(CubicMeter(300) + CubicMeter(175), equals(CubicMeter(475)));
        expect(CubicMeter(77) - CubicMeter(27), equals(CubicMeter(50)));
        expect(CubicMeter(5) / CubicMeter(5), equals(CubicMeter(1)));
        expect(CubicMeter(5) * CubicMeter(5), equals(CubicMeter(25)));
      });

      test('Factory constructors', () {
        expect(CubicMeter.fromCube(5, 5, 5), equals(CubicMeter(125)));
      });

      test('To string', () {
        expect(CubicMeter(5).toString(), equals('5 m³'));
        expect(CubicMeter(5.0).toString(), equals('5.0 m³'));
      });
    });
  });
}
