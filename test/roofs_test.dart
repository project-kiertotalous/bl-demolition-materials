import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:test/test.dart';

/// Rounds the given number to 3 decimals
num _r(num? val) {
  return ((val! * 1000).round()) / 1000;
}

void main() {
  group('Roofs', () {
    test('Property calculation', () {
      var totalRoofs = TotalRoofs(
          foundations: Foundations(
            falsePlinth: FalsePlinthFoundation(area: 5, circumference: 5),
            crawlSpace: CrawlSpaceFoundation(area: 5, circumference: 5),
            shallow: ShallowFoundation(area: 5, circumference: 5),
            pillar: PillarFoundation(area: 5, circumference: 5),
            hollowCoreSlab: HollowCoreSlabFoundation(area: 5, circumference: 5),
          ),
          roofs: Roofs(
              ceilingArea: 5,
              ridgeOrGableRoofPortionPercentage: 5,
              useDefaultDimensions: false,
              ridgeOrGableRoofType: RoofType.steelTruss,
              ridgeOrGableWaterRoofType: WaterRoofType.roofingFelt,
              flatOrMonoPitchedRoofType: RoofType.concreteBeam,
              flatOrMonoPitchedWaterRoofType: WaterRoofType.roofingFelt));

      expect(_r(totalRoofs.calculatedCeilingArea), equals(5));
      expect(_r(totalRoofs.defaultRidgeOrGableRoofCeilingArea), equals(0.25));
      expect(_r(totalRoofs.flatOrMonoPitchedRoofPortionPercentage), equals(95));
      expect(
          _r(totalRoofs.defaultFlatOrMonoPitchedRoofCeilingArea), equals(4.75));
      expect(_r(totalRoofs.woodVolume), equals(0.16));
      expect(_r(totalRoofs.woodTons), equals(0.080));
      expect(_r(totalRoofs.steelTons), equals(0.013));
      expect(_r(totalRoofs.concreteVolume), equals(0.17));
      expect(_r(totalRoofs.concreteTons), equals(1.188));
      expect(_r(totalRoofs.insulationVolume), equals(0.15));
      expect(_r(totalRoofs.insulationTons), equals(0.008));
      expect(_r(totalRoofs.underlayVolume), equals(0.001));
      expect(_r(totalRoofs.underlayTons), equals(0.001));
      expect(_r(totalRoofs.bitumenVolume), equals(0.03));
      expect(_r(totalRoofs.bitumenTons), equals(0.040));
      expect(_r(totalRoofs.mineriteVolume), equals(0));
      expect(_r(totalRoofs.mineriteTons), equals(0));
      expect(_r(totalRoofs.roofTileVolume), equals(0));
      expect(_r(totalRoofs.roofTileTons), equals(0));

      totalRoofs = totalRoofs.copyWith.roofs!(
          ridgeOrGableWaterRoofType: WaterRoofType.mineriteRoof,
          flatOrMonoPitchedWaterRoofType: WaterRoofType.tiledRoof);

      expect(_r(totalRoofs.woodVolume), equals(0.16));
      expect(_r(totalRoofs.woodTons), equals(0.080));
      expect(_r(totalRoofs.steelTons), equals(0.013));
      expect(_r(totalRoofs.concreteVolume), equals(0.17));
      expect(_r(totalRoofs.concreteTons), equals(1.188));
      expect(_r(totalRoofs.insulationVolume), equals(0.15));
      expect(_r(totalRoofs.insulationTons), equals(0.008));
      expect(_r(totalRoofs.underlayVolume), equals(0.001));
      expect(_r(totalRoofs.underlayTons), equals(0.001));
      expect(_r(totalRoofs.bitumenVolume), equals(0));
      expect(_r(totalRoofs.bitumenTons), equals(0));
      expect(_r(totalRoofs.mineriteVolume), equals(0.002));
      expect(_r(totalRoofs.mineriteTons), equals(0.004));
      expect(_r(totalRoofs.roofTileVolume), equals(0.104));
      expect(_r(totalRoofs.roofTileTons), equals(0.185));
    });
  });
}
