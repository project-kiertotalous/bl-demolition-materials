import 'package:bl_demolition_materials/src/large_properties/demolition_materials/demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/foundation.dart';
import 'package:bl_demolition_materials/src/large_properties/material_info.dart';

class ReinforcedConcreteColumnFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnFalsePlinth([this.foundation, this.sizing = 0]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => kgPerMeter * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250KgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class FootingFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FootingFalsePlinth([this.foundation, this.sizing = 0.6]);

  @override
  num? get kgPerMeter {
    if (volume == null || foundation?.circumference == null) {
      return null;
    }

    return kgPerCubicMeter * volume! / foundation!.circumference!;
  }

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingCastKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingCastSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing * foundation!.circumference!;
  }

  @override
  num? get concreteTons {
    if (volume == null) {
      return null;
    }

    return volume! * (kgPerCubicMeter - steelKgPerCubicMeter) / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class ConcreteBlockFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteBlockFalsePlinth([this.foundation, this.sizing = 0.6]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing * 0.3 * foundation!.circumference!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class FrostProofStyroxFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FrostProofStyroxFalsePlinth([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrox120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrox120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class FinnFoamFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FinnFoamFalsePlinth([this.foundation, this.sizing = 100]);

  // NOTE: This is according to specs, but still seems a fishy to use frost proof
  // styrox measurements for finn foam false plinth?
  @override
  num get kgPerSquareMeter => FoundationWeights.frostProofStyrox100mmKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationWeights.frostProofStyrox100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class VaporBarrierPlasticFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  VaporBarrierPlasticFalsePlinth([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class ReinforcedConcreteSlabFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteSlabFalsePlinthGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingCastKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingCastSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return steelKgPerCubicMeter * volume! / 1000;
  }
}

class HotBitiumBrushingFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  HotBitiumBrushingFalsePlinthGroundFloor([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => FoundationSlabWeights.hotBitiumBrushingKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.hotBitiumBrushingKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return foundation!.area! * kgPerSquareMeter / 1000;
  }
}

class MineralWoolFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  MineralWoolFalsePlinthGroundFloor([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerSqm / 200 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerCbm / 200 * sizing;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class StyroxFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  StyroxFalsePlinthGroundFloor([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrox120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrox120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class ConcreteCastingFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteCastingFalsePlinthGroundFloor([this.foundation, this.sizing = 100]);

  @override
  num? get kgPerSquareMeter {
    if (volume == null || foundation?.area == null) {
      return null;
    }

    return kgPerCubicMeter * volume! / foundation!.area!;
  }

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingCastKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingCastSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get concreteTons {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class ReinforcedConcreteColumnCrawlSpace extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnCrawlSpace([this.foundation, this.sizing = 100]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => sizing * kgPerMeter;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250KgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class ReinforcedConcreteCastFoundationCrawlSpace extends DemolitionMaterials {
  final num width;
  final num height;
  final Foundation? foundation;

  ReinforcedConcreteCastFoundationCrawlSpace(
      [this.foundation, this.width = 0.3, this.height = 0.6]);

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingCastKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingCastSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return width * height * foundation!.circumference!;
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
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class ConcreteBlockCrawlSpace extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteBlockCrawlSpace([this.foundation, this.sizing = 0.6]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return foundation!.circumference! * 0.3 * sizing;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class WoodShavingsCrawlSpaceGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  WoodShavingsCrawlSpaceGroundFloor([this.foundation, this.sizing = 200]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodShavings100mmKgPerSqm /
      100 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodShavings100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class WoodFrameCrawlSpaceGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  WoodFrameCrawlSpaceGroundFloor([this.foundation, this.sizing = 3.1]);

  @override
  num get kgPerSquareMeter =>
      sizing / 3.1 * ExteriorWallWeights.woodFrame45x100mmKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.woodFrame45x100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! / 1000;
  }
}

class SolidBoardingCrawlSpaceGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  SolidBoardingCrawlSpaceGroundFloor([this.foundation, this.sizing = 25]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.claddingAndFloorboard25mmKgPerSqm / 25 * sizing;

  @override
  num get kgPerCubicMeter =>
      ExteriorWallWeights.claddingAndFloorboard25mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class ConstructionPaperCrawlSpaceGroundFloor extends DemolitionMaterials {
  final Foundation? foundation;

  ConstructionPaperCrawlSpaceGroundFloor([this.foundation]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class TarPaperCrawlSpaceGroundFloor
    extends ConstructionPaperCrawlSpaceGroundFloor {
  // Can this be removed? tar paper is identical to construction paper
}

class ReinforcedConcreteColumnShallowFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnShallowFoundation([this.foundation, this.sizing = 0]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => sizing * kgPerMeter;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250KgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class FrostProofStyroxShallowFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FrostProofStyroxShallowFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrox120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrox120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class FinnFoamShallowFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FinnFoamShallowFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.woodFrame45x100mmKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.woodFrame45x100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class VaporBarrierPlasticShallowFoundation extends DemolitionMaterials {
  final Foundation? foundation;

  VaporBarrierPlasticShallowFoundation([this.foundation]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class ReinforcedConcreteSlabShallowFoundationGroundFloor
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteSlabShallowFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num? get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingCastKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingCastSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
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
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class HotBitiumBrushingShallowFoundationGroundFloor
    extends DemolitionMaterials {
  final Foundation? foundation;

  HotBitiumBrushingShallowFoundationGroundFloor([this.foundation]);

  @override
  num get kgPerSquareMeter => FoundationSlabWeights.hotBitiumBrushingKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.hotBitiumBrushingKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class MineralWoolShallowFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  MineralWoolShallowFoundationGroundFloor([this.foundation, this.sizing = 200]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerSqm / 200 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerCbm / 200 * sizing;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class StyroxShallowFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  StyroxShallowFoundationGroundFloor([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrox120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrox120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class ConcreteCastingShallowFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteCastingShallowFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num? get kgPerSquareMeter {
    if (volume == null || foundation?.area == null) {
      return null;
    }

    return kgPerCubicMeter * volume! / foundation!.area!;
  }

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingCastKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingCastSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get concreteTons {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class ReinforcedConcreteColumnColumnFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnColumnFoundation([this.foundation, this.sizing = 0]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => kgPerMeter * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250KgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class ConcreteBlockColumnFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteBlockColumnFoundation([this.foundation, this.sizing = 0.6]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * 0.3 * foundation!.circumference!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class FrostProofStyroxColumnFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FrostProofStyroxColumnFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrox120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrox120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class FinnFoamColumnFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FinnFoamColumnFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.hardDiskKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.hardDiskKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class VaporBarrierPlasticColumnFoundation extends DemolitionMaterials {
  final Foundation? foundation;

  VaporBarrierPlasticColumnFoundation([this.foundation]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class WoodFrameColumnFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  WoodFrameColumnFoundationGroundFloor([this.foundation, this.sizing = 3.1]);

  @override
  num get kgPerSquareMeter =>
      sizing / 3.1 * CellarStructureWeights.ceramicTileKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.woodFrame45x100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! / 1000;
  }
}

class SolidBoardingColumnFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  SolidBoardingColumnFoundationGroundFloor([this.foundation, this.sizing = 25]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.claddingAndFloorboard25mmKgPerSqm / 25 * sizing;

  @override
  num get kgPerCubicMeter =>
      ExteriorWallWeights.claddingAndFloorboard25mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class ReinforcedConcreteColumnHollowCoreSlabFoundation
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnHollowCoreSlabFoundation(
      [this.foundation, this.sizing = 0]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => sizing * kgPerMeter;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class ConcreteBlockHollowCoreSlabFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteBlockHollowCoreSlabFoundation([this.foundation, this.sizing = 0.6]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing * 0.3 * foundation!.circumference!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class FrostProofStyroxHollowCoreSlabFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FrostProofStyroxHollowCoreSlabFoundation(
      [this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrox120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrox120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class FinnFoamHollowCoreSlabFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FinnFoamHollowCoreSlabFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => DividingWallWeights.limeSandBrick130mmKgPerSqm;

  @override
  num get kgPerCubicMeter => DividingWallWeights.limeSandBrick130mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class VaporBarrierPlasticHollowCoreSlabFoundation extends DemolitionMaterials {
  final Foundation? foundation;

  VaporBarrierPlasticHollowCoreSlabFoundation([this.foundation]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class HollowCoreSlabHollowCoreSlabFoundationGroundFloor
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  HollowCoreSlabHollowCoreSlabFoundationGroundFloor(
      [this.foundation, this.sizing = 260]);

  // The multiplication/division here makes no sense, but keeping this just for the record.
  @override
  num get kgPerSquareMeter =>
      sizing /
      FoundationWeights.hollowSlab200mmKgPerSqm *
      FoundationWeights.hollowSlab200mmKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationWeights.hollowSlab200mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

class HotBitiumBrushingHollowCoreSlabFoundationGroundFloor
    extends DemolitionMaterials {
  final Foundation? foundation;

  HotBitiumBrushingHollowCoreSlabFoundationGroundFloor([this.foundation]);

  @override
  num get kgPerSquareMeter => FoundationSlabWeights.hotBitiumBrushingKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.hotBitiumBrushingKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.circumference! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.circumference == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.circumference! / 1000;
  }
}

class MineralWoolHollowCoreSlabFoundationGroundFloor
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  MineralWoolHollowCoreSlabFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerSqm / 200 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerCbm / 200 * sizing;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.circumference! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.circumference == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.circumference! / 1000;
  }
}

class StyroxHollowCoreSlabFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  StyroxHollowCoreSlabFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrox120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrox120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing / 1000 * foundation!.circumference!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

class ConcreteCastingHollowCoreSlabFoundationGroundFloor
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteCastingHollowCoreSlabFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num? get kgPerSquareMeter {
    if (foundation?.circumference == null || volume == null) {
      return null;
    }

    return kgPerCubicMeter * volume! / foundation!.circumference!;
  }

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingCastKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingCastSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing / 1000 * foundation!.circumference!;
  }

  @override
  num? get concreteTons {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing / 1000 * foundation!.circumference! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

class ConcreteCastingIntermediateFloorFrames extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteCastingIntermediateFloorFrames([this.foundation, this.sizing = 200]);

  @override
  num get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingCastKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingCastSteelKgPerCbm;
}

class GlulamBeamsIntermediateFloorFrames extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  GlulamBeamsIntermediateFloorFrames([this.foundation, this.sizing = 0.4]);

  @override
  num get kgPerMeter => UpperBaseStructureAndWaterRoofWeights
      .glulamBeamsVolume004SqmPerLinearMeterKgPerM;

  @override
  num get kgPerSquareMeter => kgPerMeter * sizing;

  @override
  num get kgPerCubicMeter => UpperBaseStructureAndWaterRoofWeights
      .glulamBeamsVolume004SqmPerLinearMeterKgPerCbm;
}
