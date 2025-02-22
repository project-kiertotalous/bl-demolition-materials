import '../large_properties/material_info.dart';
import '../large_properties/external_shell_and_frame_structures/cellar.dart';

enum CellarExteriorMaterial { concreteCasting, concreteBlock, brick }

sealed class CellarExteriorMaterials {
  num? get kgPerSquareMeter;

  num? get kgPerCubicMeter;

  num? get steelKgPerCubicMeter;

  num? get volume;

  num? get tons;

  num? get concreteTons;

  num? get steelTons;
}

CellarExteriorMaterials createInstance(CellarExteriorMaterial materialType, Cellar cellar) {
    switch (materialType) {
      case CellarExteriorMaterial.concreteCasting:
        return ConcreteCasting.newInstance(cellar: cellar);
      case CellarExteriorMaterial.concreteBlock:
        return ConcreteBlock.newInstance(cellar: cellar);
      case CellarExteriorMaterial.brick:
        return Brick.newInstance(cellar: cellar);
      default:
        return NullMaterials();
    }
  }

class NullMaterials extends CellarExteriorMaterials {
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

class FrostThyrox extends CellarExteriorMaterials {
  late final num sizing;
  Cellar cellar;

  FrostThyrox._(this.cellar, this.sizing);

  static CellarExteriorMaterials newInstance({Cellar? cellar, num? sizing}) {
    if (cellar?.floorArea == null) {
      return NullMaterials();
    }

    return FrostThyrox._(cellar!, sizing ?? 100);
  }

  @override
  num? get kgPerSquareMeter => FoundationWeights.frostProofStyrox100mmKgPerSqm / 100 * sizing;

  @override
  num? get kgPerCubicMeter => FoundationWeights.frostProofStyrox100mmKgPerCbm / 100 * sizing;

  @override
  num? get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / kgPerCubicMeter;

  @override
  num? get tons => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / 1000;

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
}

class Thyroxr extends CellarExteriorMaterials {
  late final num sizing;
  Cellar cellar;

  Thyroxr._(this.cellar, this.sizing);

  static CellarExteriorMaterials newInstance({Cellar? cellar, num? sizing}) {
    if (cellar?.floorArea == null) {
      return NullMaterials();
    }

    return Thyroxr._(cellar!, sizing ?? 150);
  }

  @override
  num? get kgPerSquareMeter => FoundationWeights.styrox120mmKgPerSqm / 150 * sizing;

  @override
  num? get kgPerCubicMeter => FoundationWeights.styrox120mmKgPerCbm / 150 * sizing;

  @override
  num? get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / kgPerCubicMeter;

  @override
  num? get tons => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / 1000;

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
}

class Finnfoam extends CellarExteriorMaterials {
  late final num sizing;
  Cellar cellar;

  Finnfoam._(this.cellar, this.sizing);

  static CellarExteriorMaterials newInstance({Cellar? cellar, num? sizing}) {
    if (cellar?.floorArea == null) {
      return NullMaterials();
    }

    return Finnfoam._(cellar!, sizing ?? 50);
  }

  @override
  num? get kgPerSquareMeter => FoundationWeights.finnFoam50mmKgPerSqm / 50 * sizing;

  @override
  num? get kgPerCubicMeter => FoundationWeights.finnFoam50mmKgPerCbm / 50 * sizing;

  @override
  num? get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / kgPerCubicMeter;

  @override
  num? get tons => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / 1000;

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
}

class VaporBarrierPlastic extends CellarExteriorMaterials {
  Cellar cellar;

  VaporBarrierPlastic._(this.cellar);

  static CellarExteriorMaterials newInstance({Cellar? cellar}) {
    if (cellar?.floorArea == null) {
      return NullMaterials();
    }

    return VaporBarrierPlastic._(cellar!);
  }

  @override
  num? get kgPerSquareMeter => FoundationStructureWeights.vaporBarrierPlasticKgPerSqm;

  @override
  num? get kgPerCubicMeter => FoundationStructureWeights.vaporBarrierPlasticKgPerCbm;

  @override
  num? get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / kgPerCubicMeter;

  @override
  num? get tons => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / 1000;

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
}

class HotBitumenCoating extends CellarExteriorMaterials {
  Cellar cellar;

  HotBitumenCoating._(this.cellar);

  static CellarExteriorMaterials newInstance({Cellar? cellar}) {
    if (cellar?.floorArea == null) {
      return NullMaterials();
    }

    return HotBitumenCoating._(cellar!);
  }

  @override
  num? get kgPerSquareMeter => CellarStructureWeights.hotBitumenCoatingWeightKgPerSqm;

  @override
  num? get kgPerCubicMeter => CellarStructureWeights.hotBitumenCoatingDensityKgPerCbm;

  @override
  num? get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / kgPerCubicMeter;

  @override
  num? get tons => kgPerSquareMeter! * cellar.exteriorWallsPerimeter! / 1000;

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
}

class ConcreteCastingWalls extends CellarExteriorMaterials {
  late final num sizing;
  Cellar cellar;

  ConcreteCastingWalls._(this.cellar, this.sizing);

  static CellarExteriorMaterials newInstance({Cellar? cellar, num? sizing}) {

    if (cellar?.floorArea == null) {
      return NullMaterials();
    }

    return ConcreteCastingWalls._(cellar!, sizing ?? 200);
  }

  @override
  num? get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num? get kgPerCubicMeter => FoundationWeights.steelConcreteCastKgPerCbm;

  @override
  num? get steelKgPerCubicMeter => FoundationWeights.steelConcreteCastSteelKgPerCbm;

  @override
  num? get volume => sizing / 1000 * cellar.floorArea!; // jatkuu: * O55??

  @override
  num? get tons => volume! * kgPerCubicMeter! / 1000; // jatkuu: * O55??

  @override
  num? get concreteTons => tons! - steelTons!;

  @override
  num? get steelTons => volume! * FoundationWeights.steelConcreteSilt250x250SteelKgPerCbm / 1000;
}

class BrickWalls extends CellarExteriorMaterials {
  late final num sizing;
  Cellar cellar;

  BrickWalls._(this.cellar, this.sizing);

  static CellarExteriorMaterials newInstance({Cellar? cellar, num? sizing}) {

  if (cellar?.floorArea == null) {
    return NullMaterials();
  }

  return BrickWalls._(cellar!, sizing ?? 2);
  }

   @override
  num? get kgPerSquareMeter => FoundationStructureWeights.limeSandBrick130mmKgPerSqm * sizing;

  @override
  num? get kgPerCubicMeter => FoundationStructureWeights.limeSandBrick130mmKgPerCbm * sizing;

  @override
  num? get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! * (cellar.wallHeight * cellar.exteriorWallsPerimeter) / kgPerCubicMeter;  // jatkuu: * O56??

  @override
  num? get tons => (cellar.wallHeight * cellar.exteriorWallsPerimeter) * kgPerSquareMeter! / 1000 // jatkuu: * O56??

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
}

class BrickWallInnerFiller extends CellarExteriorMaterials {
  Cellar cellar;

  BrickWallInnerFiller._(this.cellar);

  static CellarExteriorMaterials newInstance({Cellar? cellar}) {

  if (cellar?.floorArea == null) {
    return NullMaterials();
  }

  return BrickWallInnerFiller._(cellar!);
  }

   @override
  num? get kgPerSquareMeter => FoundationStructureWeights.interiorPlaster1to3mmKgPerSqm;

  @override
  num? get kgPerCubicMeter => FoundationStructureWeights.interiorPlaster1to3mmKgPerCbm;

  @override
  num? get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! * (cellar.wallHeight * cellar.exteriorWallsPerimeter) / kgPerCubicMeter;  // jatkuu: * O56??

  @override
  num? get tons => kgPerSquareMeter! * (cellar.wallHeight * cellar.exteriorWallsPerimeter) / 1000;  // jatkuu: * O56??

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
}

class LightweightConcreteBlock extends CellarExteriorMaterials {
  Cellar cellar;

  LightweightConcreteBlock._(this.cellar);

  static CellarExteriorMaterials newInstance({Cellar? cellar}) {

  if (cellar?.floorArea == null) {
    return NullMaterials();
  }

  return LightweightConcreteBlock._(cellar!);
  }

   @override
  num? get kgPerSquareMeter => FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num? get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! * (cellar.wallHeight * cellar.exteriorWallsPerimeter) / kgPerCubicMeter;  // jatkuu: * O57??

  @override
  num? get tons => kgPerSquareMeter! * (cellar.wallHeight * cellar.exteriorWallsPerimeter) / 1000;  // jatkuu: * O57??

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
}

class PlasteringInteriorAndAexteriorWalls extends CellarExteriorMaterials {
    Cellar cellar;

  PlasteringInteriorAndAexteriorWalls._(this.cellar);

  static CellarExteriorMaterials newInstance({Cellar? cellar}) {

  if (cellar?.floorArea == null) {
    return NullMaterials();
  }

  return PlasteringInteriorAndAexteriorWalls._(cellar!);
  }

   @override
  num? get kgPerSquareMeter => ExteriorWallWeights.plasteringInteriorAndExteriorWallsKgPerSqm;

  @override
  num? get kgPerCubicMeter => ExteriorWallWeights.plasteringInteriorAndExteriorWallsKgPerCbm;

  @override
  num? get steelKgPerCubicMeter => 0;

  @override
  num? get volume => kgPerSquareMeter! * (cellar.wallHeight * cellar.exteriorWallsPerimeter) / kgPerCubicMeter;  // jatkuu: * O57??

  @override
  num? get tons => kgPerSquareMeter! * (cellar.wallHeight * cellar.exteriorWallsPerimeter) / 1000;  // jatkuu: * O57??

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
} 