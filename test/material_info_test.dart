import 'package:test/test.dart';
import 'package:bl_demolition_materials/src/large_properties/material_info.dart';

void main() {
  group('WoodMaterialType', () {
    test('contains all expected values', () {
      expect(
          WoodMaterialType.values,
          containsAll([
            WoodMaterialType.board20x125,
            WoodMaterialType.trunkWood50x100,
            WoodMaterialType.trunkWood50x150,
            WoodMaterialType.trunkWood50x200,
            WoodMaterialType.trunkWood100x100,
            WoodMaterialType.trunkWood150x150,
          ]));
    });
  });

  group('WoodMaterialInfo', () {
    test('volumePerLinearMeter returns correct values', () {
      expect(
          WoodMaterialInfo.volumePerLinearMeter(WoodMaterialType.board20x125),
          equals(0.004));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood50x100),
          equals(0.005));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood50x150),
          equals(0.0075));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood50x200),
          equals(0.01));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood100x100),
          equals(0.01));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood150x150),
          equals(0.0225));
    });

    test('weightPerLinearMeter returns correct values', () {
      expect(
          WoodMaterialInfo.weightPerLinearMeter(WoodMaterialType.board20x125),
          equals(0.004 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood50x100),
          equals(0.005 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood50x150),
          equals(0.0075 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood50x200),
          equals(0.01 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood100x100),
          equals(0.01 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood150x150),
          equals(0.0225 * 500));
    });

    test('boardConsumptionPerSquareMeter returns correct values', () {
      expect(
          WoodMaterialInfo.boardConsumptionPerSquareMeter(
              WoodMaterialType.board20x125),
          equals(8));
      expect(
          WoodMaterialInfo.boardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood50x100),
          equals(1.25));
      expect(
          WoodMaterialInfo.boardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood50x150),
          equals(1.25));
      expect(
          WoodMaterialInfo.boardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood50x200),
          equals(1.25));
      expect(
          WoodMaterialInfo.boardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood100x100),
          equals(1.25));
      expect(
          WoodMaterialInfo.boardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood150x150),
          equals(1.25));
    });
  });
}
