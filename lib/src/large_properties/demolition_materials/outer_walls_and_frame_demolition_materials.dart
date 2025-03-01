import 'package:bl_demolition_materials/src/large_properties/demolition_materials/demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/material_info.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/building_framework.dart';

// Ulkoseinat ja runko


// Puurunko, oletus 50x200, oletusmenekki 1,25jm/m2
class WoodTrunk extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;

  WoodTrunk([this.buildingFramework, this.sizing = 1.25]);

  @override
  num get kgPerMeter => 0;

  @override
  num get kgPerSquareMeter => sizing / 1.25 * WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.trunkWood50x200);

  @override
  num get kgPerCubicMeter => WoodMaterialInfo.densityKgPerCubicMeter();
}

// Liimapalkit pysty, oletustilavuus 0,04m3/m, oletustukivali 5m
class GlulamBeamsVerticalVolume004 extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;
  
  GlulamBeamsVerticalVolume004([this.buildingFramework, this.sizing = 5]);

  @override
  num get kgPerMeter => FrameBarWeights.glulamBeamsVerticalVolume004CbmPerLinearMeterKgPerM;

  @override
  num get linearMeter => buildingFramework.externalWallsPerimeter! / sizing * buildingFramework.externalWallsAverageHeight!; // * buildingFramework. mysteeri!!!!

  @override
  num get kgPerCubicMeter => FrameBarWeights.glulamBeamsVerticalVolume004CbmPerLinearMeterKgPerCbm;

  @override
  num get woodVolume => linearMeter * kgPerMeter / kgPerCubicMeter;

  @override
  num get woodTons => linearMeter * kgPerMeter / 1000;
}

// Betoni pystypalkit, oletustilavuus 0,04m3/jm, oletustukivali 5m
class ConcreteVerticalBars extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;

  ConcreteVerticalBars([this.buildingFramework, this.sizing = 5]);

  @override
  num get kgPerMeter => FrameBarWeights.concreteRoofBars500x500KgPerM;

  @override
  num get linearMeter => buildingFramework.externalWallsPerimeter! / sizing; //* buildingFramework.externalWallsAverageHeight!; // * buildingFramework. mysteeri!!!!

  @override
  num get kgPerCubicMeter => FrameBarWeights.concreteRoofBars500x500KgPerCbm;

  @override
  num? get concreteVolume => linearMeter * kgPerMeter / kgPerCubicMeter;

  @override
  num get concreteTons => linearMeter * kgPerMeter / 1000;
}

// Teräs pystypalkit, oletus putkiprofiili 250x250
class SteelVerticalBars extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;

  SteelVerticalBars([this.buildingFramework, this.sizing = 5]);

  @override
  num get kgPerMeter => FrameBarWeights.steelVerticalBarsPipeProfile250x250KgPerM;

  @override
  num get linearMeter => buildingFramework.externalWallsPerimeter! / sizing; //* buildingFramework.externalWallsAverageHeight!; // * buildingFramework. mysteeri!!!!

  @override
  num get kgPerCubicMeter => FrameBarWeights.steelVerticalBarsPipeProfile250x250KgPerCbm;

  @override
  num get steelTons => linearMeter * kgPerMeter / 1000;
}

// Kaksinkertainen tiiliseina
class TwofoldBrickWall extends DemolitionMaterials {
  final BuildingFramework buildingFramework;

  TwofoldBrickWall([this.buildingFramework]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.redBrick130mmKgPerSqm * 2;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.redBrick130mmKgPerCbm;

  @override
  num get volume => kgPerSquareMeter; // * jatka tätä

  @override
  num get tons => volume * kgPerSquareMeter; // jatka tätä
}

// Betoniseina elementti, 200mm paksu betoni, oletus 260kg/m2
class ConcreteWallElement extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;

  ConcreteWallElement([this.buildingFramework, this.sizing = 260]);

  @override
  num get kgPerSquareMeter => FrameBarWeights.concreteWallElement200mmThickConcreteKgPerSqm / 260 * sizing;

  @override
  num get kgPerCubicMeter => FrameBarWeights.concreteWallElement200mmThickConcreteKgPerCbm;

  @override
  num get concreteVolume => kgPerSquareMeter; // jatka§ tätä

  @override
  num get concreteTons => concreteVolume * kgPerSquareMeter; // jatka tätä
}

// Tuulensuojalevy (bituliitti), oletuspaksuus 15mm
class WindProtectionBoard extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;

  WindProtectionBoard([this.buildingFramework, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.windProtectionBoard15mmKgPerSqm / 15 * sizing;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.windProtectionBoard15mmKgPerCbm;
}

// Mineraalivilla, oletuspaksuus 100mm
class MineralWool extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;

  MineralWool([this.buildingFramework, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.mineralWool100mmKgPerSqm / 100 * sizing;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.mineralWool100mmKgPerCbm;
}

// 130mm kalkki tai punatiili
class RedBrick extends DemolitionMaterials {
  final BuildingFramework buildingFramework;

  RedBrick([this.buildingFramework]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.redBrick130mmKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.redBrick130mmKgPerCbm;
}

// 20mm ulkoverhouslauta
class CladdingBoard extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;

  CladdingBoard([this.buildingFramework, this.sizing = 20]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.claddingBoard20mmKgPerSqm / 20 * sizing;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.claddingBoard20mmKgPerCbm;
}

// Kipsilevy, oletuspaksuus 11mm
class PlasterBoard extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;

  PlasterBoard([this.buildingFramework, this.sizing = 11]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.plasterboard11mmKgPerSqm / 11 * sizing;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.plasterboard11mmKgPerCbm;
}

// Profiilipoelti, oletus vain toisella puolen (1kertainen)
class ProfiledSheet extends DemolitionMaterials {
  final num sizing;
  final BuildingFramework buildingFramework;

  ProfiledSheet([this.buildingFramework, this.sizing = 1]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.profiledSheetMetalKgPerSqm * sizing;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.profiledSheetMetalKgPerCbm;
}

// Puolikova kuitulevy
class SemiHardFiberBoard  extends DemolitionMaterials {
  final BuildingFramework buildingFramework;

  SemiHardFiberBoard([this.buildingFramework]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.semiHardFiberboardKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.semiHardFiberboardKgPerCbm;
}

// Styrox
class Styrox extends DemolitionMaterials {
  final BuildingFramework buildingFramework;

  Styrox([this.buildingFramework]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.styroxKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.styroxKgPerCbm;
}

// Rappaus, sisä ja ulkoseinät
class PlasteringInteriorAndExteriorWalls extends DemolitionMaterials {
  final BuildingFramework buildingFramework;

  PlasteringInteriorAndExteriorWalls([this.buildingFramework]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.plasteringInteriorAndExteriorWallsKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.plasteringInteriorAndExteriorWallsKgPerCbm;
}

// Mineriittilevy
class MineriteBoard extends DemolitionMaterials{
  final BuildingFramework buildingFramework;

  MineriteBoard([this.buildingFramework]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.mineriteBoardKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.mineriteBoardKgPerCbm;
}