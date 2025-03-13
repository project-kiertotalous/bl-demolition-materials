enum WoodMaterialType {
  board20x125,
  trunkWood50x100,
  trunkWood50x150,
  trunkWood50x200,
  trunkWood100x100,
  trunkWood150x150,
}

class WoodMaterialInfo {
  static Map<WoodMaterialType, num> _volumes = {
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

  static Map<WoodMaterialType, num> _boardConsumption = {
    WoodMaterialType.board20x125: 8,
    WoodMaterialType.trunkWood50x100: 1.25,
    WoodMaterialType.trunkWood50x150: 1.25,
    WoodMaterialType.trunkWood50x200: 1.25,
    WoodMaterialType.trunkWood100x100: 1.25,
    WoodMaterialType.trunkWood150x150: 1.25,
  };

  static num getBoardConsumptionPerSquareMeter(WoodMaterialType materialType) =>
      _boardConsumption[materialType]!;

  static void setBoardConsumptionPerSquareMeter(
      WoodMaterialType materialType, num value) {
    _boardConsumption[materialType] = value;
  }

  static num woodWeightPerSquareMeter(WoodMaterialType materialType) =>
      getBoardConsumptionPerSquareMeter(materialType) *
      weightPerLinearMeter(materialType);

  static num densityKgPerCubicMeter() => 500;
}

class FoundationWeights {
  static num reinforcedConcreteColumn250x250KgPerM = 155;
  static num reinforcedConcreteColumn250x250KgPerSqm = 50;
  static num reinforcedConcreteColumn250x250KgPerCbm = 2500;
  static num reinforcedConcreteColumn250x250SteelKgPerCbm = 100;
  static num concreteCastingKgPerCbm = 2500;
  static num concreteCastingSteelKgPerCbm = 100;
  static num hollowSlab200mmKgPerSqm = 260;
  static num hollowSlab200mmKgPerCbm = 1300;
  static num frostProofStyrofoam100mmKgPerSqm = 0.54;
  static num frostProofStyrofoam100mmKgPerCbm = 5.4;
  static num styrofoam150mmKgPerSqm = 2.7;
  static num styrofoam150mmKgPerCbm = 18;
  static num finnFoam50mmKgPerSqm = 1.6;
  static num finnFoam50mmKgPerCbm = 32;
}

class FoundationSlabWeights {
  static num plasticMatKgPerSqm = 3.3;
  static num plasticMatKgPerCbm = 1100;
  static num mineralWool200mmKgPerSqm = 4;
  static num mineralWool200mmKgPerCbm = 20;
  static num bitumenSolutionBrushingKgPerSqm = 0.1;
  static num bitumenSolutionBrushingKgPerCbm = 700;
  static num hotBitumenBrushingKgPerSqm = 0.3;
  static num hotBitumenBrushingKgPerCbm = 700;
  static num acrylicCoatingKgPerSqm = 0.2;
  static num acrylicCoatingKgPerCbm = 700;
  static num sinteredTileMortarKgPerSqm = 16;
  static num sinteredTileMortarKgPerCbm = 2500;
  static num styrofoam120mmKgPerSqm = 0.54;
  static num styrofoam120mmKgPerCbm = 18;
}

class FoundationStructureWeights {
  static num protectivePlasticKgPerSqm = 0.21;
  static num protectivePlasticKgPerCbm = 970;
  static num mineralWool100mmKgPerSqm = 5.5;
  static num mineralWool100mmKgPerCbm = 55;
  static num limeSandBrick130mmKgPerSqm = 275;
  static num limeSandBrick130mmKgPerCbm = 2500;
  static num interiorPlaster1to3mmKgPerSqm = 3;
  static num interiorPlaster1to3mmKgPerCbm = 2500;
  static num plasterboard13mmKgPerSqm = 9;
  static num plasterboard13mmKgPerCbm = 900;
  static num vaporBarrierPlasticKgPerSqm = 0.21;
  static num vaporBarrierPlasticKgPerCbm = 970;
  static num mineralWool64mmAndVerticalFrameKgPerSqm = 6.7;
  static num mineralWool64mmAndVerticalFrameKgPerCbm = 23;
  static num mineralWool64mmAndVerticalFrameWoodKgPerCbm = 3.125;
  static num xpsInsulation50mmKgPerSqm = 0.216;
  static num xpsInsulation50mmKgPerCbm = 32;
  static num blockFoundationKgPerSqm = 205;
  static num blockFoundationKgPerCbm = 700;
  static num brickOrConcrete130mmKgPerSqm = 275;
  static num brickOrConcrete130mmKgPerCbm = 1775;
  static num windProtectionBoard15mmKgPerSqm = 7;
  static num windProtectionBoard15mmKgPerCbm = 460;
  static num mineralWool150mmKgPerSqm = 8.25;
  static num mineralWool150mmKgPerCbm = 55;
  static num vapourBarrierPlasticAndBuildingPaperKgPerSqm = 0.21;
  static num vapourBarrierPlasticAndBuildingPaperKgPerCbm = 970;
}

class FrameBarWeights {
  static num concreteVerticalBars300x300KgPerM = 225;
  static num concreteVerticalBars300x300KgPerCbm = 2500;
  static num concreteVerticalBars300x300SteelKgPerCbm = 100;
  static num concreteRoofBars500x500KgPerM = 375;
  static num concreteRoofBars500x500KgPerCbm = 2500;
  static num concreteRoofBars500x500SteelKgPerCbm = 100;
  static num steelVerticalBarsIProfile200hx100bKgPerM = 22.4;
  static num steelVerticalBarsIProfile200hx100bKgPerCbm = 7000;
  static num steelVerticalBarsPipeProfile250x250KgPerM = 45.2;
  static num steelVerticalBarsPipeProfile250x250KgPerCbm = 7000;
  static num glulamBeamsVerticalVolume004CbmPerLinearMeterKgPerM = 20;
  static num glulamBeamsVerticalVolume004CbmPerLinearMeterKgPerCbm = 500;
  static num glulamBeamsRoofVolume005CbmPerLinearMeterKgPerM = 25;
  static num glulamBeamsRoofVolume005CbmPerLinearMeterKgPerCbm = 500;
  static num concreteWallElement200mmThickConcreteKgPerSqm = 260;
  static num concreteWallElement200mmThickConcreteKgPerCbm = 1300;
  static num glassWallFrameSteelRhs100x100x5KgPerM = 14.2;
  static num glassWallFrameSteelRhs100x100x5KgPerSqm = 24.14;
  static num aluminiumFrameRectangle150x200x5KgPerM = 9.22;
  static num aluminiumFrameRectangle150x200x5KgPerSqm = 15.674;
}

class ExteriorWallWeights {
  static num claddingAndFloorboard25mmKgPerSqm = 20;
  static num claddingAndFloorboard25mmKgPerCbm = 500;
  static num windProtectionBoard15mmKgPerSqm = 7;
  static num windProtectionBoard15mmKgPerCbm = 460;
  static num mineralWool100mmKgPerSqm = 5.5;
  static num mineralWool100mmKgPerCbm = 55;
  static num redBrick130mmKgPerSqm = 150;
  static num redBrick130mmKgPerCbm = 1775;
  static num moduleBrick85mmKgPerSqm = 150;
  static num moduleBrick85mmKgPerCbm = 1775;
  static num limeSandBrick130mmKgPerSqm = 150;
  static num limeSandBrick130mmKgPerCbm = 1775;
  static num claddingBoard20mmKgPerSqm = 16;
  static num claddingBoard20mmKgPerCbm = 500;
  static num plasterboard11mmKgPerSqm = 9;
  static num plasterboard11mmKgPerCbm = 692;
  static num woodFrame45x100mmKgPerSqm = 3.1;
  static num woodFrame45x100mmKgPerCbm = 500;
  static num bottomGuideWood45x100mmKgPerSqm = 3.1;
  static num bottomGuideWood45x100mmKgPerCbm = 500;
  static num profiledSheetMetalKgPerSqm = 4.2;
  static num profiledSheetMetalKgPerCbm = 7000;
  static num bitumenMembraneKgPerSqm = 7;
  static num bitumenMembraneKgPerCbm = 460;
  static num semiHardFiberboardKgPerSqm = 7;
  static num semiHardFiberboardKgPerCbm = 460;
  static num styrofoamKgPerSqm = 0.54;
  static num styrofoamKgPerCbm = 18;
  static num plasteringInteriorAndExteriorWallsKgPerSqm = 2.4;
  static num plasteringInteriorAndExteriorWallsKgPerCbm = 2500;
  static num mineriteBoardKgPerSqm = 15;
  static num mineriteBoardKgPerCbm = 1775;
}

class UpperBaseStructureAndWaterRoofWeights {
  static num gableAndPentRoofWithWoodenLatticeKgPerSqm = 15;
  static num gableAndPentRoofWithWoodenLatticeKgPerCbm = 500;
  static num gableAndPentRoofWithSteelLatticeKgPerSqm = 50;
  static num gableAndPentRoofWithSteelLatticeKgPerCbm = 7000;
  static num flatAndPentRoofWithWoodenLatticeKgPerSqm = 15;
  static num flatAndPentRoofWithWoodenLatticeKgPerCbm = 500;
  static num flatAndPentRoofWithSteelLatticeKgPerSqm = 40;
  static num flatAndPentRoofWithSteelLatticeKgPerCbm = 7000;
  static num ferroConcreteBarKgPerSqm = 250;
  static num ferroConcreteBarKgPerCbm = 7000;
  static num roofSheet06mmKgPerSqm = 4.2;
  static num roofSheet06mmKgPerCbm = 7000;
  static num feltRoofBitumenKermiKgPerSqm = 8;
  static num feltRoofBitumenKermiKgPerCbm = 1330;
  static num mineriteCoveringKgPerSqm = 15;
  static num mineriteCoveringKgPerCbm = 1775;
  static num roofTileKgPerSqm = 39;
  static num roofTileKgPerCbm = 1775;
  static num woodenTrunk50x150mmKgPerSqm = 4.5;
  static num woodenTrunk50x150mmKgPerCbm = 500;
  static num underPlankingKgPerSqm = 16;
  static num underPlankingKgPerCbm = 500;
  static num glulamBeamsVolume004SqmPerLinearMeterKgPerM = 30;
  static num glulamBeamsVolume004SqmPerLinearMeterKgPerCbm = 800;
  static num mineralWool175mmKgPerSqm = 9.625;
  static num mineralWool175mmKgPerCbm = 55;
  static num hardDiskKgPerSqm = 9;
  static num hardDiskKgPerCbm = 460;
  static num mineralWool350mmKgPerSqm = 19.25;
  static num mineralWool350mmKgPerCbm = 55;
  static num vaporBarrierKgPerSqm = 0.21;
  static num vaporBarrierKgPerCbm = 970;
  static num plasterBoardKgPerSqm = 9;
  static num plasterBoardKgPerCbm = 900;
  static num particleBoard15mmKgPerSqm = 10.00;
  static num particleBoard15mmKgPerCbm = 1000;
  static num windProofWool30mmKgPerSqm = 1.65;
  static num windProofWool30mmKgPerCbm = 55;
  static num woodShavings100mmKgPerSqm = 11.00;
  static num woodShavings100mmKgPerCbm = 100;
}

class YardStructureWeights {
  static num concreteYardTilesKgPerPcs = 15;
  static num concreteYardTilesKgPerSqm = 120;
  static num concreteYardTilesKgPerCbm = 2500;
  static num soilToRemoveDensityKgPerCbm = 1500;
  static num asphaltWeightKgPerSqm = 100;
  static num asphaltDensityKgPerCbm = 2500;
}

class CellarStructureWeights {
  static num ferroConcreteSlab200mmKgPerSqm = 500;
  static num ferroConcreteSlab200mmKgPerCbm = 2500;
  static num ferroConcreteSlab200mmSteelKgPerCbm = 100;
  static num styrofoamKgPerSqm = 0.54;
  static num styrofoamKgPerCbm = 18;
  static num vaporBarrierKgPerSqm = 0.21;
  static num vaporBarrierKgPerCbm = 970;
  static num concretePlinthKgPerSqm = 500;
  static num concretePlinthKgPerCbm = 2500;
  static num concretePlinthSteelKgPerCbm = 100;
  static num ceramicTileKgPerSqm = 16;
  static num ceramicTileKgPerCbm = 2500;
  static num mineralWool150mmKgPerSqm = 8.25;
  static num mineralWool150mmKgPerCbm = 55;
  static num limeSandBrick130mmKgPerSqm = 275;
  static num limeSandBrick130mmKgPerCbm = 1775;
  static num hotBitumenCoatingWeightKgPerSqm = 0.3;
  static num hotBitumenCoatingDensityKgPerCbm = 700;
}

class DividingWallWeights {
  static num redTile130mmKgPerSqm = 275;
  static num redTile130mmKgPerCbm = 1775;
  static num mineralWool150mmKgPerSwm = 8.25;
  static num mineralWool150mmKgPerCbm = 55;
  static num limeSandBrick130mmKgPerSqm = 275;
  static num limeSandBrick130mmKgPerCbm = 1775;
  static num woodenTrunkKgPerSqm = 3.1;
  static num woodenTrunkKgPerCbm = 500;
  static num semiHardFiberBoardKgPerSqm = 7.5;
  static num semiHardFiberBoardKgPerCbm = 460;
  static num ceramicTileKgPerSqm = 16;
  static num ceramicTileKgPerCbm = 2500;
}

class FloorStructureAndMaterialWeights {
  static num parquetKgPerSqm = 7.5;
  static num parquetKgPerCbm = 500;
  static num plasticMatKgPerSqm = 3.3;
  static num plasticMatKgPerCbm = 1100;
  static num plasticFloorTileKgPerSqm = 4.2;
  static num plasticFloorTileKgPerCbm = 1100;
  static num ceramicTilesKgPerSqm = 16;
  static num ceramicTilesKgPerCbm = 2500;
}

class WindowWeights {
  static num threeTimesClosedGlassKgPerSqm = 14.6;
  static num threeTimesClosedGlassKgPerCbm = 2400;
  static num lowerFramePaintedKgPerM = 2.5;
  static num lowerFramePaintedKgPerSqm = 0.88;
  static num lowerFramePaintedKgPerCbm = 500;
  static num frame175mmKgPerM = 3.75;
  static num frame175mmKgPerSqm = 1.31;
  static num frame175mmKgPerCbm = 500;
  static num outerListsAluminiumKgPerM = 1.7;
  static num outerListsAluminiumKgPerSqm = 0.6;
  static num outerListsAluminiumKgPerCbm = 2730;
}

class DoorWeights {
  static num woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg = 51;
  static num woodenOuterDoor210x80WithGlass05SqmGlassKg = 5;
  static num woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKgPerCbm = 500;
  static num woodenOuterDoor210x80WithGlass05SqmGlassKgPerCbm = 2400;
  static num woodenInnerDoorWithGlass05SqmTrunkAndSlabKg = 21;
  static num woodenInnerDoorWithGlass05SqmGlassKg = 5;
  static num woodenInnerDoorWithGlass05SqmTrunkAndSlabKgPerCbm = 500;
  static num woodenInnerDoorWithGlass05SqmGlassKgPerCbm = 2400;
  static num aluminiumDoorWithGlassTrunkAndSlabKg = 40;
  static num aluminiumDoorWithGlassGlassKg = 5;
  static num aluminiumDoorWithGlassTrunkAndSlabKgPerCbm = 2730;
  static num aluminiumDoorWithGlassGlassKgPerCbm = 2400;
  static num steelDoorWithGlass05SqmTrunkAndSlabKg = 80;
  static num steelDoorWithGlass05SqmGlassKg = 5;
  static num steelDoorWithGlass05SqmTrunkAndSlabKgPerCbm = 7800;
  static num steelDoorWithGlass05SqmGlassKgPerCbm = 2400;
  static num steelDoorClosedFireDoorKg = 50;
  static num steelDoorClosedFireDoorKgPerCbm = 7800;
  static num metallicLiftDoorsAndBigPassageDoorsKg = 100;
  static num metallicLiftDoorsAndBigPassageDoorsGlassKg = 20;
  static num metallicLiftDoorsAndBigPassageDoorsKgPerCbm = 7800;
}

class HvacAndElectricalInstallationsWeights {
  static num waterPipesCopperKgPerM = 0.207;
  static num waterPipesPlasticKgPerM = 0.12;
  static num waterPipesPlasticKgPerCbm = 1100;
  static num centralHeatingPipesWaterCirculationHeatingKgPerM = 4.3;
  static num sewagePipesCastIronDn150KgPerM = 141;
  static num sewagePipesPlasticDn150KgPerM = 22;
  static num sewagePipesPlasticDn150KgPerCbm = 1100;
  static num steelVentilationPipes300DnKgPerM = 25;
  static num steelVentilationPipes500DnKgPerM = 52;
  static num electricalWiresCopperKgPerM = 0.13;
  static num waterAccumulatorsElectricSmallKgPerPcs = 100;
  static num
      waterAccumulatorsElectricBigDistrictHeating500To1000LitersKgPerPcs = 400;
  static num radiatorsElectricKgPerPcs = 8;
  static num radiatorsWaterCirculationKgPerPcs = 15;
  static num ventilationUnitsKgPerPcs = 100;
  static num electricalDistributionCabinetsAndMetersKgPerPcs = 20;
  static num electricMotorsAndCirculationPumpsKgPerPcs = 25;
  static num roofExhaustFansKgPerPcs = 15;
}

class FurnitureDressingKitchenToiletSpaceWeights {
  static num toiletSeatPorcelainKgPerPcs = 25.8;
  static num toiletSeatPorcelainKgPerCbm = 2500;
  static num toiletSinkPorcelainKgPerPcs = 13.0;
  static num toiletSinkPorcelainKgPerCbm = 2500;
  static num metallicDressingClosets500x1600KgPerLinearMeter = 50;
  static num metallicDressingClosets500x1600KgPerPcs = 25;
  static num woodBasedClosetsAndOtherFurnitureWidth06MKgPerLinearMeter = 25;
  static num woodBasedClosetsAndOtherFurnitureWidth06MKgPerPcs = 15;
  static num woodBasedClosetsAndOtherFurnitureWidth06MKgPerCbm = 500;
  static num steelSinksAndTablesRustProofKgPerPcs = 7.3;
  static num rustProofTablesFoodServiceFurnitureKgPerPcs = 15;
  static num rustProofLegsFoodServiceFurnitureKgPerPcs = 8;
  static num saunaStovesKgPerPcs = 12;
  static num electricStovesForApartmentsKgPerPcs = 40;
  static num fridgesKgPerPcs = 60;
  static num foodServiceElecticStovesKgPerPcs = 60;
  static num coldRoomCabinetsKgPerPcs = 100;
}

class FixturesAndStructuresWeights {
  static num rainGuttersKgPerM = 2;
  static num dripTraysAndProtectiveSheeting08mmSteelDiskKgPerSqm = 8;
  static num fireEscapesAndFootBridgesKgPerM = 10;
  static num armorMeshFenceAluminiumHeight2mKgPerM = 4;
  static num armorMeshFenceSteelHeight2mKgPerM = 5;
}

class DrainPipeWeights {
  static num clayBrickPipeKgPerM = 25;
  static num clayBrickPipeKgPerCbm = 1500;
  static num holePipePlasticKgPerM = 1;
  static num holePipePlasticKgPerCbm = 970;
}
