import '../material_info.dart';
import 'cellar.dart';

sealed class CellarDemolitionMaterial {
  num? get kgPerSquareMeter;

  num? get kgPerCubicMeter;

  num? get steelKgPerCubicMeter;

  num? get volume;

  num? get tons;

  num? get concreteTons;

  num? get steelTons;
}

class NullMaterial extends CellarDemolitionMaterial {
  @override
  num? get kgPerSquareMeter => null;

  @override
  num? get kgPerCubicMeter => null;

  @override
  num? get steelKgPerCubicMeter => null;

  @override
  num? get volume => null;

  @override
  num? get tons => null;

  @override
  num? get concreteTons => null;

  @override
  num? get steelTons => null;
}

class ReinforcedConcreteSlab extends CellarDemolitionMaterial {
  late final num sizing;
  Cellar cellar;

  ReinforcedConcreteSlab._(this.cellar, this.sizing);

  static CellarDemolitionMaterial newInstance({Cellar? cellar, num? sizing}) {
    if (cellar?.floorArea == null) {
      return NullMaterial();
    }

    return ReinforcedConcreteSlab._(cellar!, sizing ?? 100);
  }

  @override
  num? get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter!;

  @override
  num? get kgPerCubicMeter => FoundationWeights.steelConcreteCastKgPerCbm;

  @override
  num? get steelKgPerCubicMeter =>
      FoundationWeights.steelConcreteCastSteelKgPerCbm;

  @override
  num? get volume => sizing / 1000 * cellar.floorArea!;

  @override
  num? get tons => volume! * kgPerCubicMeter! / 1000;

  @override
  num? get concreteTons => tons! - steelTons!;

  @override
  num? get steelTons => FoundationWeights.steelConcreteSilt250x250SteelKgPerCbm;
}

class HotBitiumBrushing extends CellarDemolitionMaterial {
  Cellar cellar;

  HotBitiumBrushing._(this.cellar);

  static CellarDemolitionMaterial newInstance({Cellar? cellar}) {
    if (cellar?.floorArea == null) {
      return NullMaterial();
    }

    return HotBitiumBrushing._(cellar!);
  }

  @override
  num? get kgPerSquareMeter =>
      CellarStructureWeights.hotBitumenCoatingWeightKgPerSqm;

  @override
  num? get kgPerCubicMeter =>
      CellarStructureWeights.hotBitumenCoatingDensityKgPerCbm;

  @override
  num get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! / cellar.floorArea! * kgPerCubicMeter!;

  @override
  num? get tons => kgPerSquareMeter! * cellar.floorArea! / 1000;

  @override
  num get concreteTons => 0;

  @override
  num get steelTons => 0;
}

class MineralWool extends CellarDemolitionMaterial {
  late final num sizing;
  Cellar cellar;

  MineralWool._(this.cellar, this.sizing);

  static CellarDemolitionMaterial newInstance({Cellar? cellar, num? sizing}) {
    if (cellar?.floorArea == null) {
      return NullMaterial();
    }

    return MineralWool._(cellar!, sizing ?? 100);
  }

  @override
  num? get kgPerSquareMeter =>
      ExteriorWallWeights.mineralWool100mmKgPerSqm / 100 * sizing;

  @override
  num? get kgPerCubicMeter =>
      ExteriorWallWeights.mineralWool100mmKgPerCbm / 100 * sizing;

  @override
  num get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! / cellar.floorArea! * kgPerCubicMeter!;

  @override
  num? get tons => kgPerSquareMeter! * cellar.floorArea! / 1000;

  @override
  num get concreteTons => 0;

  @override
  num get steelTons => 0;
}

/*
class ReinforcedConcreteSlab extends CellarDemolitionMaterial {
  late final num sizing;
  Cellar cellar;

  ReinforcedConcreteSlab._(this.cellar, this.sizing);

  static CellarDemolitionMaterial newInstance({ Cellar? cellar, num? sizing }) {
    if (cellar?.floorArea == null) {
      return NullMaterial();
    }

    return ReinforcedConcreteSlab._(cellar!, sizing ?? 100);
  }

  num? get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter!;
  num? get kgPerCubicMeter => FoundationWeights.steelConcreteCastKgPerCbm;
  num? get steelKgPerCubicMeter => FoundationWeights.steelConcreteCastSteelKgPerCbm;
  num? get volume => sizing / 1000 * cellar.floorArea!;
  num? get tons => volume! * kgPerCubicMeter! / 1000;
  num? get concreteTons => tons! - steelTons!;
  num? get steelTons => FoundationWeights.steelConcreteSilt250x250SteelKgPerCbm;
}
*/
