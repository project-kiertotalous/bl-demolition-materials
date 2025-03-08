import 'package:bl_demolition_materials/src/large_properties/demolition_materials/demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/material_info.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';

import '../external_shell_and_frame_structures/total_building_framework.dart';

// Ulkoseinat ja runko

// Puurunko, oletus 50x200, oletusmenekki 1,25jm/m2
class WoodFrame extends DemolitionMaterials {
  final num sizing;

  WoodFrame([this.sizing = 1.25]);

  @override
  num get kgPerMeter => 0;

  @override
  num get kgPerSquareMeter =>
      sizing /
      1.25 *
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x200);

  @override
  num get kgPerCubicMeter => WoodMaterialInfo.densityKgPerCubicMeter();
}

// Liimapalkit pysty, oletustilavuus 0,04m3/m, oletustukivali 5m
class VerticalGlulamBeamsFrame extends DemolitionMaterials {
  final num sizing;
  final TotalBuildingFramework? totalBuildingFramework;

  VerticalGlulamBeamsFrame([this.totalBuildingFramework, this.sizing = 5]);

  @override
  num get kgPerMeter =>
      FrameBarWeights.glulamBeamsVerticalVolume004CbmPerLinearMeterKgPerM;

  @override
  num? get linearMeter {
    if (Utils.anyNull([
      totalBuildingFramework?.externalWallsAverageHeight,
      totalBuildingFramework?.externalWallsPerimeter,
      totalBuildingFramework?.glulamVerticalColumnsPortionFractionPercentage
    ])) {
      return null;
    }

    return totalBuildingFramework!.externalWallsPerimeter! /
        sizing *
        totalBuildingFramework!.externalWallsAverageHeight! *
        totalBuildingFramework!.glulamVerticalColumnsPortionFractionPercentage!;
  }

  @override
  num get kgPerCubicMeter =>
      FrameBarWeights.glulamBeamsVerticalVolume004CbmPerLinearMeterKgPerCbm;

  @override
  num? get woodVolume =>
      linearMeter == null ? null : linearMeter! * kgPerMeter / kgPerCubicMeter;

  @override
  num? get woodTons =>
      linearMeter == null ? null : linearMeter! * kgPerMeter / 1000;
}

// Betoni pystypalkit, oletustilavuus 0,04m3/jm, oletustukivali 5m
class VerticalConcreteColumnsFrame extends DemolitionMaterials {
  final num sizing;
  final TotalBuildingFramework? totalBuildingFramework;

  VerticalConcreteColumnsFrame([this.totalBuildingFramework, this.sizing = 5]);

  @override
  num get kgPerMeter => FrameBarWeights.concreteRoofBars500x500KgPerM;

  @override
  @override
  num? get linearMeter {
    if (Utils.anyNull([
      totalBuildingFramework?.externalWallsAverageHeight,
      totalBuildingFramework?.externalWallsPerimeter,
      totalBuildingFramework?.concreteVerticalColumnsPortionFractionPercentage
    ])) {
      return null;
    }

    return totalBuildingFramework!.externalWallsPerimeter! /
        sizing *
        totalBuildingFramework!.externalWallsAverageHeight! *
        totalBuildingFramework!
            .concreteVerticalColumnsPortionFractionPercentage!;
  }

  @override
  num get kgPerCubicMeter => FrameBarWeights.concreteRoofBars500x500KgPerCbm;

  @override
  num? get concreteVolume =>
      linearMeter == null ? null : linearMeter! * kgPerMeter / kgPerCubicMeter;

  @override
  num? get concreteTons =>
      linearMeter == null ? null : linearMeter! * kgPerMeter / 1000;
}

// Teräs pystypalkit, oletus putkiprofiili 250x250
class VerticalSteelColumnsFrame extends DemolitionMaterials {
  final num sizing;
  final TotalBuildingFramework? totalBuildingFramework;

  VerticalSteelColumnsFrame([this.totalBuildingFramework, this.sizing = 5]);

  @override
  num get kgPerMeter =>
      FrameBarWeights.steelVerticalBarsPipeProfile250x250KgPerM;

  @override
  num? get linearMeter {
    if (Utils.anyNull([
      totalBuildingFramework?.externalWallsPerimeter,
      totalBuildingFramework?.externalWallsAverageHeight,
      totalBuildingFramework?.steelVerticalColumnsPortionFractionPercentage,
    ])) {
      return null;
    }

    return totalBuildingFramework!.externalWallsPerimeter! /
        sizing *
        totalBuildingFramework!.externalWallsAverageHeight! *
        totalBuildingFramework!.steelVerticalColumnsPortionFractionPercentage!;
  }

  @override
  num get kgPerCubicMeter =>
      FrameBarWeights.steelVerticalBarsPipeProfile250x250KgPerCbm;

  @override
  num get steelTons => linearMeter * kgPerMeter / 1000;
}

// Kaksinkertainen tiiliseina
class DoubleBrickWallFrame extends DemolitionMaterials {
  final TotalBuildingFramework? totalBuildingFramework;

  DoubleBrickWallFrame([this.totalBuildingFramework]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.redBrick130mmKgPerSqm * 2;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.redBrick130mmKgPerCbm;

  @override
  num? get volume {
    if (totalBuildingFramework?.doubleLoadBearingBrickWallPortionSqm == null) {
      return null;
    }

    return kgPerSquareMeter *
        totalBuildingFramework!.doubleLoadBearingBrickWallPortionSqm! /
        kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (totalBuildingFramework?.doubleLoadBearingBrickWallPortionSqm == null) {
      return null;
    }

    return kgPerSquareMeter *
        totalBuildingFramework!.doubleLoadBearingBrickWallPortionSqm! /
        1000;
  }
}

// Betoniseina elementti, 200mm paksu betoni, oletus 260kg/m2
class ConcreteWallElementFrame extends DemolitionMaterials {
  final num sizing;
  final TotalBuildingFramework? totalBuildingFramework;

  ConcreteWallElementFrame([this.totalBuildingFramework, this.sizing = 260]);

  @override
  num get kgPerSquareMeter =>
      FrameBarWeights.concreteWallElement200mmThickConcreteKgPerSqm /
      260 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      FrameBarWeights.concreteWallElement200mmThickConcreteKgPerCbm;

  @override
  num? get concreteVolume {
    if (totalBuildingFramework
            ?.concreteElementWallsWithoutFrameworkPortionSqm ==
        null) {
      return null;
    }

    return kgPerSquareMeter *
        totalBuildingFramework!
            .concreteElementWallsWithoutFrameworkPortionSqm! /
        kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (totalBuildingFramework
            ?.concreteElementWallsWithoutFrameworkPortionSqm ==
        null) {
      return null;
    }

    return kgPerSquareMeter *
        totalBuildingFramework!
            .concreteElementWallsWithoutFrameworkPortionSqm! /
        1000;
  }
}

// Tuulensuojalevy (bituliitti), oletuspaksuus 15mm
class WindProtectionBoardFrame extends DemolitionMaterials {
  final num sizing;

  WindProtectionBoardFrame([this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.windProtectionBoard15mmKgPerSqm / 15 * sizing;

  @override
  num get kgPerCubicMeter =>
      ExteriorWallWeights.windProtectionBoard15mmKgPerCbm;
}

// Mineraalivilla, oletuspaksuus 100mm
class MineralWoolFrame extends DemolitionMaterials {
  final num sizing;

  MineralWoolFrame([this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.mineralWool100mmKgPerSqm / 100 * sizing;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.mineralWool100mmKgPerCbm;
}

// 130mm kalkki tai punatiili
class LimeOrRedBrickFrame extends DemolitionMaterials {
  @override
  num get kgPerSquareMeter => ExteriorWallWeights.redBrick130mmKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.redBrick130mmKgPerCbm;
}

// 20mm ulkoverhouslauta
class ExteriorCladdingBoardFrame extends DemolitionMaterials {
  final num sizing;

  ExteriorCladdingBoardFrame([this.sizing = 20]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.claddingBoard20mmKgPerSqm / 20 * sizing;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.claddingBoard20mmKgPerCbm;
}

// Kipsilevy, oletuspaksuus 11mm
class PlasterBoardFrame extends DemolitionMaterials {
  final num sizing;

  PlasterBoardFrame([this.sizing = 11]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.plasterboard11mmKgPerSqm / 11 * sizing;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.plasterboard11mmKgPerCbm;
}

// Profiilipoelti, oletus vain toisella puolen (1kertainen)
class ProfiledSheetMetalBoard extends DemolitionMaterials {
  final num sizing;

  ProfiledSheetMetalBoard([this.sizing = 1]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.profiledSheetMetalKgPerSqm * sizing;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.profiledSheetMetalKgPerCbm;
}

// Puolikova kuitulevy
class SemiRigidFiberBoardFrame extends DemolitionMaterials {
  @override
  num get kgPerSquareMeter => ExteriorWallWeights.semiHardFiberboardKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.semiHardFiberboardKgPerCbm;
}

// Styrox
class StyrofoamFrame extends DemolitionMaterials {
  @override
  num get kgPerSquareMeter => ExteriorWallWeights.styrofoamKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.styrofoamKgPerCbm;
}

// Rappaus, sisä ja ulkoseinät
class PlasteringInteriorAndExteriorWallsFrame extends DemolitionMaterials {
  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.plasteringInteriorAndExteriorWallsKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      ExteriorWallWeights.plasteringInteriorAndExteriorWallsKgPerCbm;
}

// Mineriittilevy
class MineriteBoardFrame extends DemolitionMaterials {
  @override
  num get kgPerSquareMeter => ExteriorWallWeights.mineriteBoardKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.mineriteBoardKgPerCbm;
}
