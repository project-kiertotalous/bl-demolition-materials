enum WoodMaterialType {
  board20x125,
  trunkWood50x100,
  trunkWood50x150,
  trunkWood50x200,
  trunkWood100x100,
  trunkWood150x150,
}

class WoodMaterialInfo {
  static final Map<WoodMaterialType, num> _volumes = {
    WoodMaterialType.board20x125: 0.004,
    WoodMaterialType.trunkWood50x100: 0.005,
    WoodMaterialType.trunkWood50x150: 0.0075,
    WoodMaterialType.trunkWood50x200: 0.01,
    WoodMaterialType.trunkWood100x100: 0.01,
    WoodMaterialType.trunkWood150x150: 0.0225,
  };

  static num volumePerLinearMeter(WoodMaterialType materialType) =>
      _volumes[materialType]!;

  static num weightPerLinearMeter(WoodMaterialType materialType) =>
      _volumes[materialType]! * 500;

  static num boardConsumptionPerSquareMeter(WoodMaterialType materialType) {
    switch (materialType) {
      case WoodMaterialType.board20x125:
        return 8;
      default:
        return 1.25;
    }
  }

  static num woodWeightPerSquareMeter(WoodMaterialType materialType) =>
      boardConsumptionPerSquareMeter(materialType) /
      weightPerLinearMeter(materialType);

  static num densityKgPerCubicMeter() => 500;
}

class FoundationWeights {
  static final num steelConcreteSilt250x250KgPerM = 155;
  static final num steelConcreteSilt250x250KgPerSqm = 50;
  static final num steelConcreteSilt250x250KgPerCbm = 2500;
  static final num steelConcreteSilt250x250SteelKgPerCbm = 100;
  static final num steelConcreteCastKgPerCbm = 2500;
  static final num steelConcreteCastSteelKgPerCbm = 100;
  static final num hollowSlab200mmKgPerSqm = 260;
  static final num hollowSlab200mmKgPerCbm = 1300;
  static final num frostProofStyrox100mmKgPerSqm = 0.54;
  static final num frostProofStyrox100mmKgPerCbm = 5.4;
  static final num styrox150mmKgPerSqm = 2.7;
  static final num styrox150mmKgPerCbm = 18;
  static final num finnFoam50mmKgPerSqm = 1.6;
  static final num finnFoam50mmKgPerCbm = 32;
}

class FoundationSlabWeights {
  static final num plasticMatKgPerSqm = 3.3;
  static final num plasticMatKgPerCbm = 1100;
  static final num rockWool200mmKgPerSqm = 4;
  static final num rockWool200mmKgPerCbm = 20;
  static final num bitiumSolutionBrushingKgPerSqm = 0.1;
  static final num bitiumSolutionBrushingKgPerCbm = 700;
  static final num hotBitiumBrushingKgPerSqm = 0.3;
  static final num hotBitiumBrushingKgPerCbm = 700;
  static final num acrylicCoatingKgPerSqm = 0.2;
  static final num acrylicCoatingKgPerCbm = 700;
  static final num sinteredTileMortarKgPerSqm = 16;
  static final num sinteredTileMortarKgPerCbm = 2500;
  static final num styrox120mmKgPerSqm = 0.54;
  static final num styrox120mmKgPerCbm = 18;
}

class FoundationStructureWeights {
  static final num protectivePlasticKgPerSqm = 0.21;
  static final num protectivePlasticKgPerCbm = 970;
  static final num mineralWool100mmKgPerSqm = 5.5;
  static final num mineralWool100mmKgPerCbm = 55;
  static final num limeSandBrick130mmKgPerSqm = 275;
  static final num limeSandBrick130mmKgPerCbm = 2500;
  static final num interiorPlaster1to3mmKgPerSqm = 3;
  static final num interiorPlaster1to3mmKgPerCbm = 2500;
  static final num plasterboard13mmKgPerSqm = 9;
  static final num plasterboard13mmKgPerCbm = 900;
  static final num vaporBarrierPlasticKgPerSqm = 0.21;
  static final num vaporBarrierPlasticKgPerCbm = 970;
  static final num mineralWool64mmAndVerticalFrameKgPerSqm = 6.7;
  static final num mineralWool64mmAndVerticalFrameKgPerCbm = 23;
  static final num xpsInsulation50mmKgPerSqm = 0.216;
  static final num xpsInsulation50mmKgPerCbm = 32;
  static final num blockFoundationKgPerSqm = 205;
  static final num blockFoundationKgPerCbm = 700;
  static final num brickOrConcrete130mmKgPerSqm = 275;
  static final num brickOrConcrete130mmKgPerCbm = 1775;
  static final num windProtectionBoard15mmKgPerSqm = 7;
  static final num windProtectionBoard15mmKgPerCbm = 460;
  static final num mineralWool150mmKgPerSqm = 8.25;
  static final num mineralWool150mmKgPerCbm = 55;
  static final num vapourBarrierPlasticAndBuildingPaperKgPerSqm = 0.21;
  static final num vapourBarrierPlasticAndBuildingPaperKgPerCbm = 970;
}

class ExteriorWallWeights {
  static final num claddingAndFloorboard25mmKgPerSqm = 20;
  static final num claddingAndFloorboard25mmKgPerCbm = 500;
  static final num windProtectionBoard15mmKgPerSqm = 7;
  static final num windProtectionBoard15mmKgPerCbm = 460;
  static final num mineralWool100mmKgPerSqm = 5.5;
  static final num mineralWool100mmKgPerCbm = 55;
  static final num redBrick130mmKgPerSqm = 150;
  static final num redBrick130mmKgPerCbm = 1775;
  static final num moduleBrick85mmKgPerSqm = 150;
  static final num moduleBrick85mmKgPerCbm = 1775;
  static final num limeSandBrick130mmKgPerSqm = 150;
  static final num limeSandBrick130mmKgPerCbm = 1775;
  static final num claddingBoard20mmKgPerSqm = 16;
  static final num claddingBoard20mmKgPerCbm = 500;
  static final num plasterboard11mmKgPerSqm = 9;
  static final num plasterboard11mmKgPerCbm = 692;
  static final num woodFrame45x100mmKgPerSqm = 3.1;
  static final num woodFrame45x100mmKgPerCbm = 500;
  static final num bottomGuideWood45x100mmKgPerSqm = 3.1;
  static final num bottomGuideWood45x100mmKgPerCbm = 500;
  static final num profiledSheetMetalKgPerSqm = 4.2;
  static final num profiledSheetMetalKgPerCbm = 7000;
  static final num bitumenMembraneKgPerSqm = 7;
  static final num bitumenMembraneKgPerCbm = 460;
  static final num semiHardFiberboardKgPerSqm = 7;
  static final num semiHardFiberboardKgPerCbm = 460;
  static final num styroxKgPerSqm = 0.54;
  static final num styroxKgPerCbm = 18;
  static final num plasteringInteriorAndExteriorWallsKgPerSqm = 2.4;
  static final num plasteringInteriorAndExteriorWallsKgPerCbm = 2500;
  static final num mineriteBoardKgPerSqm = 15;
  static final num mineriteBoardKgPerCbm = 1775;
}

class YardStructureWeights {
  static final num soilToRemoveDensityKgPerCbm = 1500;
  static final num asphaltWeightKgPerSqm = 100;
  static final num asphaltDensityKgPerCbm = 2500;
}

class CellarStructureWeights {
  static final num hotBitumenCoatingWeightKgPerSqm = 0.3;
  static final num hotBitumenCoatingDensityKgPerCbm = 700;
}
