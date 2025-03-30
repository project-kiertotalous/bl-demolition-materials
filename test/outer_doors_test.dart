import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:test/test.dart';

num twoDecimals(num? value) {
  return num.parse(value!.toStringAsFixed(2));
}

void main() {
  // the purpose of these tests are to explore Foundations functionality
  group('Outer door tests', () {
    test('shut wooden doors', () {
      final outerDoors = OuterDoors(woodenDoors: OuterDoor(shutDoors: 3));

      expect(outerDoors.totalWoodVolume, equals(0.306));
      expect(outerDoors.totalWoodTons, equals(0.153));
    });

    test('glass wooden doors', () {
      final outerDoors = OuterDoors(woodenDoors: OuterDoor(glassDoors: 3));

      expect(outerDoors.totalWoodVolume, equals(0.306));
      expect(outerDoors.totalWoodTons, equals(0.063));
      expect(outerDoors.totalGlassVolume, equals(0.00625));
      expect(outerDoors.totalGlassTons, equals(0.015));
    });

    test('shut aluminium doors', () {
      final outerDoors = OuterDoors(aluminiumDoors: OuterDoor(shutDoors: 3));
      expect(outerDoors.totalAluminiumTons, equals(0.12));
    });
    test('glass aluminium doors', () {
      final outerDoors = OuterDoors(aluminiumDoors: OuterDoor(glassDoors: 3));

      expect(outerDoors.totalAluminiumTons, equals(0.12));
      expect(outerDoors.totalGlassVolume, equals(0.00625));
      expect(outerDoors.totalGlassTons, equals(0.015));
    });

    test('shut steel doors', () {
      final outerDoors = OuterDoors(steelDoors: OuterDoor(shutDoors: 3));

      expect(outerDoors.totalSteelTons, equals(0.15));
    });

    test('glass steel doors', () {
      final outerDoors = OuterDoors(steelDoors: OuterDoor(glassDoors: 3));

      expect(outerDoors.totalSteelTons, equals(0.24));
      expect(outerDoors.totalGlassVolume, equals(0.00625));
      expect(outerDoors.totalGlassTons, equals(0.015));
    });
  });
}
