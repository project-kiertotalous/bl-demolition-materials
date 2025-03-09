import '../../data_types/cellar_exterior_material.dart';
import '../external_shell_and_frame_structures/cellar.dart';
import '../material_info.dart';
import 'demolition_materials.dart';

class ReinforcedConcreteSlabGroundFloor extends DemolitionMaterials {
  late final num sizing;
  Cellar? cellar;

  ReinforcedConcreteSlabGroundFloor([this.cellar, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (cellar?.floorArea == null) {
      return null;
    }

    return sizing / 1000 * cellar!.floorArea!;
  }

  @override
  num? get tons => volume! * kgPerCubicMeter / 1000;

  @override
  num? get concreteTons => tons! - steelTons!;

  @override
  num? get steelTons =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;
}

class HotBitumenBrushingGroundFloor extends DemolitionMaterials {
  Cellar? cellar;

  HotBitumenBrushingGroundFloor([this.cellar]);

  @override
  num get kgPerSquareMeter =>
      CellarStructureWeights.hotBitumenCoatingWeightKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      CellarStructureWeights.hotBitumenCoatingDensityKgPerCbm;

  @override
  num get steelKgPerCubicMeter => 0;

  @override
  num? get volume {
    if (cellar?.floorArea == null) {
      return null;
    }

    return kgPerSquareMeter / cellar!.floorArea! * kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.floorArea == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.floorArea! / 1000;
  }

  @override
  num? get concreteTons => 0;

  @override
  num? get steelTons => 0;
}

class MineralWoolGroundFloor extends DemolitionMaterials {
  late final num sizing;
  Cellar? cellar;

  MineralWoolGroundFloor([this.cellar, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.mineralWool100mmKgPerSqm / 100 * sizing;

  @override
  num get kgPerCubicMeter =>
      ExteriorWallWeights.mineralWool100mmKgPerCbm / 100 * sizing;

  @override
  num? get volume {
    if (cellar?.floorArea == null) {
      return null;
    }

    return kgPerSquareMeter / cellar!.floorArea! * kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.floorArea == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.floorArea! / 1000;
  }
}

class StyrofoamGroundFloor extends DemolitionMaterials {
  late final num sizing;
  Cellar? cellar;

  StyrofoamGroundFloor([this.cellar, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrofoam120mmKgPerSqm / 100 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationSlabWeights.styrofoam120mmKgPerCbm / 100 * sizing;

  @override
  num? get volume {
    if (cellar?.floorArea == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.floorArea! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.floorArea == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.floorArea! / 1000;
  }
}

class ConcreteCastingGroundFloor extends DemolitionMaterials {
  late final num sizing;
  Cellar? cellar;

  ConcreteCastingGroundFloor([this.cellar, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (cellar?.floorArea == null) {
      return null;
    }

    return sizing / 1000 * cellar!.floorArea!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }

  @override
  num? get concreteTons {
    if (tons == null || steelTons == null) {
      return null;
    }

    return tons! - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! *
        FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm /
        1000;
  }
}

class VaporBarrierPlasticGroundFloor extends DemolitionMaterials {
  Cellar? cellar;

  VaporBarrierPlasticGroundFloor([this.cellar]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vaporBarrierPlasticKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vaporBarrierPlasticKgPerCbm;

  @override
  num? get volume {
    if (cellar?.floorArea == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.floorArea! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.floorArea == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.floorArea! / 1000;
  }
}

class FrostProofStyrofoamInsulation extends DemolitionMaterials {
  late final num sizing;
  Cellar? cellar;

  FrostProofStyrofoamInsulation([this.cellar, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationWeights.frostProofStyrofoam100mmKgPerSqm / 100 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.frostProofStyrofoam100mmKgPerCbm / 100 * sizing;

  @override
  num? get volume {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / 1000;
  }
}

class StyrofoamInsulation extends DemolitionMaterials {
  late final num sizing;
  Cellar? cellar;

  StyrofoamInsulation([this.cellar, this.sizing = 150]);

  @override
  num get kgPerSquareMeter =>
      FoundationWeights.styrofoam150mmKgPerSqm / 150 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.styrofoam150mmKgPerCbm / 150 * sizing;

  @override
  num? get volume {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / 1000;
  }
}

class FinnFoamInsulation extends DemolitionMaterials {
  late final num sizing;
  Cellar? cellar;

  FinnFoamInsulation([this.cellar, this.sizing = 50]);

  @override
  num get kgPerSquareMeter =>
      FoundationWeights.finnFoam50mmKgPerSqm / 50 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.finnFoam50mmKgPerCbm / 50 * sizing;

  @override
  num? get volume {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / 1000;
  }
}

class VaporBarrierPlasticInsulation extends DemolitionMaterials {
  Cellar? cellar;

  VaporBarrierPlasticInsulation([this.cellar]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vaporBarrierPlasticKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vaporBarrierPlasticKgPerCbm;

  @override
  num? get volume {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / 1000;
  }
}

class HotBitumenCoatingInsulation extends DemolitionMaterials {
  Cellar? cellar;

  HotBitumenCoatingInsulation([this.cellar]);

  @override
  num get kgPerSquareMeter =>
      CellarStructureWeights.hotBitumenCoatingWeightKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      CellarStructureWeights.hotBitumenCoatingDensityKgPerCbm;

  @override
  num? get volume {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    return kgPerSquareMeter * cellar!.exteriorWallsPerimeter! / 1000;
  }
}

class ConcreteCastingWalls extends DemolitionMaterials {
  late final num sizing;
  Cellar? cellar;

  ConcreteCastingWalls([this.cellar, this.sizing = 200]);

  @override
  num get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (cellar?.floorArea == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial !=
        CellarExteriorMaterial.concreteCasting) {
      return 0;
    }

    return sizing / 1000 * cellar!.floorArea!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial !=
        CellarExteriorMaterial.concreteCasting) {
      return 0;
    }

    return volume! * kgPerCubicMeter / 1000;
  }

  @override
  num? get concreteTons => tons! - steelTons!;

  @override
  num? get steelTons =>
      volume! *
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm /
      1000;
}

class BrickWalls extends DemolitionMaterials {
  late final num sizing;
  Cellar? cellar;

  BrickWalls([this.cellar, this.sizing = 2]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.limeSandBrick130mmKgPerSqm * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.limeSandBrick130mmKgPerCbm * sizing;

  @override
  num? get volume {
    if (cellar?.wallHeight == null || cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial != CellarExteriorMaterial.brick) {
      return 0;
    }

    return kgPerSquareMeter *
        (cellar!.wallHeight! * cellar!.exteriorWallsPerimeter!) /
        kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.wallHeight == null || cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial != CellarExteriorMaterial.brick) {
      return 0;
    }

    return (cellar!.wallHeight! * cellar!.exteriorWallsPerimeter!) *
        kgPerSquareMeter /
        1000;
  }
}

class BrickWallInnerFiller extends DemolitionMaterials {
  Cellar? cellar;

  BrickWallInnerFiller([this.cellar]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.interiorPlaster1to3mmKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.interiorPlaster1to3mmKgPerCbm;

  @override
  num? get volume {
    if (cellar?.wallHeight == null || cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial != CellarExteriorMaterial.brick) {
      return 0;
    }

    return kgPerSquareMeter *
        (cellar!.wallHeight! * cellar!.exteriorWallsPerimeter!) /
        kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.wallHeight == null || cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial != CellarExteriorMaterial.brick) {
      return 0;
    }

    return kgPerSquareMeter *
        (cellar!.wallHeight! * cellar!.exteriorWallsPerimeter!) /
        1000;
  }
}

class LightweightConcreteBlockWalls extends DemolitionMaterials {
  Cellar? cellar;

  LightweightConcreteBlockWalls([this.cellar]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get volume {
    if (cellar?.wallHeight == null || cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial != CellarExteriorMaterial.concreteBlock) {
      return 0;
    }

    return (cellar!.wallHeight! * cellar!.exteriorWallsPerimeter!) /
        kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.wallHeight == null || cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial != CellarExteriorMaterial.concreteBlock) {
      return 0;
    }

    return (cellar!.wallHeight! * cellar!.exteriorWallsPerimeter!) / 1000;
  }
}

class PlasteringInteriorAndExteriorWalls extends DemolitionMaterials {
  Cellar? cellar;

  PlasteringInteriorAndExteriorWalls([this.cellar]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.plasteringInteriorAndExteriorWallsKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      ExteriorWallWeights.plasteringInteriorAndExteriorWallsKgPerCbm;

  @override
  num? get volume {
    if (cellar?.wallHeight == null || cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial != CellarExteriorMaterial.concreteBlock) {
      return 0;
    }

    return (cellar!.wallHeight! * cellar!.exteriorWallsPerimeter!) /
        kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (cellar?.wallHeight == null || cellar?.exteriorWallsPerimeter == null) {
      return null;
    }

    if (cellar?.exteriorWallsMaterial != CellarExteriorMaterial.concreteBlock) {
      return 0;
    }

    return kgPerSquareMeter *
        (cellar!.wallHeight! * cellar!.exteriorWallsPerimeter!) /
        1000;
  }
}
