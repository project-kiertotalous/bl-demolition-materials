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

class FrameBarWeights {
  static final num concreteVerticalBars300x300KgPerM = 225;
  static final num concreteVerticalBars300x300KgPerCbm = 2500;
  static final num concreteVerticalBars300x300SteelKgPerCbm = 100;
  static final num concreteVerticalBars500x500KgPerM = 375;
  static final num concreteVerticalBars500x500KgPerCbm = 2500;
  static final num concreteVerticalBars500x500SteelKgPerCbm = 100;
  static final num steelVerticalBarsIProfile200hx100bKgPerM = 22.4;
  static final num steelVerticalBarsIProfile200hx100bKgPerCbm = 7000;
  static final num steelVerticalBarsPipeProfile250x250KgPerM = 45.2;
  static final num steelVerticalBarsPipeProfile250x250KgPerCbm = 7000;
  static final num glueBarsVerticalVolume004CbmPerLinearMeterKgPerM = 20;
  static final num glueBarsVerticalVolume004CbmPerLinearMeterKgPerCbm = 500;
  static final num glueBarsRoofVolume005CbmPerLinearMeterKgPerM = 25;
  static final num glueBarsRoofVolume005CbmPerLinearMeterKgPerCbm = 500;
  static final num concreteWallElement200mmThickConcreteKgPerSqm = 260;
  static final num concreteWallElement200mmThickConcreteKgPerCbm = 1300;
  static final num glassWallFrameSteelRhs100x100x5KgPerM = 14.2;
  static final num glassWallFrameSteelRhs100x100x5KgPerSqm = 24.14;
  static final num aluminiumFrameRectangle150x200x5KgPerM = 9.22;
  static final num aluminiumFrameRectangle150x200x5KgPerSqm = 15.674;
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

class UpperBaseStructureAndWaterRoofWeights {
  static final num gableAndPentRoofWithWoodenLatticeKgPerSqm = 15;
  static final num gableAndPentRoofWithWoodenLatticeKgPerCbm = 500;
  static final num gableAndPentRoofWithSteelLatticeKgPerSqm = 50;
  static final num gableAndPentRoofWithSteelLatticeKgPerCbm = 7000;
  static final num flatAndPentRoofWithWoodenLatticeKgPerSqm = 15;
  static final num flatAndPentRoofWithWoodenLatticeKgPerCbm = 500;
  static final num flatAndPentRoofWithSteelLatticeKgPerSqm = 40;
  static final num flatAndPentRoofWithSteelLatticeKgPerCbm = 7000;
  static final num ferroConcreteBarKgPerSqm = 250;
  static final num ferroConcreteBarKgPerCbm = 7000;
  static final num roofSheet06mmKgPerSqm = 4.2;
  static final num roofSheet06mmKgPerCbm = 7000;
  static final num feltRoofBitumenKermiKgPerSqm = 8;
  static final num feltRoofBitumenKermiKgPerCbm = 1330;
  static final num mineriteCoveringKgPerSqm = 15;
  static final num mineriteCoveringKgPerCbm = 1775;
  static final num roofTileKgPerSqm = 39;
  static final num roofTileKgPerCbm = 1775;
  static final num woodenTrunk50x150mmKgPerSqm = 4.5;
  static final num woodenTrunk50x150mmKgPerCbm = 500;
  static final num underPlankingKgPerSqm = 16;
  static final num underPlankingKgPerCbm = 500;
  static final num glueBarsVolume004SqmPerLinearMeterKgPerM = 30;
  static final num glueBarsVolume004SqmPerLinearMeterKgPerCbm = 800;
  static final num mineralWool175mmKgPerSqm = 9.625;
  static final num mineralWool175mmKgPerCbm = 55;
  static final num hardDiskKgPerSqm = 9;
  static final num hardDiskKgPerCbm = 460;
  static final num mineralWool350mmKgPerSqm = 19.25;
  static final num mineralWool350mmKgPerCbm = 55;
  static final num vaporBarrierKgPerSqm = 0.21;
  static final num vaporBarrierKgPerCbm = 970;
  static final num plasterBoardKgPerSqm = 9;
  static final num plasterBoardKgPerCbm = 900;
  static final num chipBoard15mmKgPerSqm = 10.00;
  static final num chipBoard15mmKgPerCbm = 1000;
  static final num windProofWool30mmKgPerSqm = 1.65;
  static final num windProofWool30mmKgPerCbm = 55;
  static final num cutterSwarf100mmKgPerSqm = 11.00;
  static final num cutterSwarf100mmKgPerCbm = 100;
}

class YardStructureWeights {
  static final num soilToRemoveDensityKgPerCbm = 1500;
  static final num asphaltWeightKgPerSqm = 100;
  static final num asphaltDensityKgPerCbm = 2500;
}

class CellarStructureWeights {
  static final num ferroConcreteSlab200mmKgPerSqm = 500;
  static final num ferroConcreteSlab200mmKgPerCbm = 2500;
  static final num ferroConcreteSlab200mmSteelKgPerCbm = 100;
  static final num styrofoamKgPerSqm = 0.54;
  static final num styrofoamKgPerCbm = 18;
  static final num vaporBarrierKgPerSqm = 0.21;
  static final num vaporBarrierKgPerCbm = 970;
  static final num concretePlinthKgPerSqm = 500;
  static final num concretePlinthKgPerCbm = 2500;
  static final num concretePlinthSteelKgPerCbm = 100;
  static final num ceramicTileKgPerSqm = 16;
  static final num ceramicTileKgPerCbm = 2500;
  static final num mineralWool150mmKgPerSqm = 8.25;
  static final num mineralWool150mmKgPerCbm = 55;
  static final num limeSandBrick130mmKgPerSqm = 275;
  static final num limeSandBrick130mmKgPerCbm = 1775;
  static final num hotBitumenCoatingWeightKgPerSqm = 0.3;
  static final num hotBitumenCoatingDensityKgPerCbm = 700;
}

class DividingWallWeights {
  static final num redTile130mmKgPerSqm = 275;
  static final num redTile130mmKgPerCbm = 1775;
  static final num mineralWool150mmKgPerSwm = 8.25;
  static final num mineralWool150mmKgPerCbm = 55;
  static final num limeSandBrick130mmKgPerSqm = 275;
  static final num limeSandBrick130mmKgPerCbm = 1775;
  static final num woodenTrunkKgPerSqm = 3.1;
  static final num woodenTrunkKgPerCbm = 500;
  static final num semiHardFiberBoardKgPerSqm = 7.5;
  static final num semiHardFiberBoardKgPerCbm = 460;
  static final num ceramicTileKgPerSqm = 16;
  static final num ceramicTileKgPerCbm = 2500;
}

class FloorStructureAndMaterialWeights {
  static final num parquetKgPerSqm = 7.5;
  static final num parquetKgPerCbm = 500;
  static final num plasticMatKgPerSqm = 3.3;
  static final num plasticMatKgPerCbm = 1100;
  static final num plasticFloorTileKgPerSqm = 4.2;
  static final num plasticFloorTileKgPerCbm = 1100;
  static final num tilesKgPerSqm = 16;
  static final num tilesKgPerCbm = 2500;
}

class WindowWeights {
  static final num threeTimesClosedGlassKgPerSqm = 14.6;
  static final num threeTimesClosedGlassKgPerCbm = 2400;
  static final num lowerFramePaintedKgPerM = 2.5;
  static final num lowerFramePaintedKgPerSqm = 0.88;
  static final num lowerFramePaintedKgPerCbm = 500;
  static final num frame175mmKgPerM = 3.75;
  static final num frame175mmKgPerSqm = 1.31;
  static final num frame175mmKgPerCbm = 500;
  static final num outerListsAluminiumKgPerM = 1.7;
  static final num outerListsAluminiumKgPerSqm = 0.6;
  static final num outerListsAluminiumKgPerCbm = 2730;
}

class DoorWeights {
  static final num woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg = 51;
  static final num woodenOuterDoor210x80WithGlass05SqmGlassKg = 5;
  static final num woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKgPerCbm = 500;
  static final num woodenOuterDoor210x80WithGlass05SqmGlassKgPerCbm = 2400;
  static final num woodenInnerDoorWithGlass05SqmTrunkAndSlabKg = 21;
  static final num woodenInnerDoorWithGlass05SqmGlassKg = 5;
  static final num woodenInnerDoorWithGlass05SqmTrunkAndSlabKgPerCbm = 500;
  static final num woodenInnerDoorWithGlass05SqmGlassKgPerCbm = 2400;
  static final num aluminiumDoorWithGlassTrunkAndSlabKg = 40;
  static final num aluminiumDoorWithGlassGlassKg = 5;
  static final num aluminiumDoorWithGlassTrunkAndSlabKgPerCbm = 2730;
  static final num aluminiumDoorWithGlassGlassKgPerCbm = 2400;
  static final num steelDorWithGlass05SqmTrunkAndSlabKg = 80;
  static final num steelDorWithGlass05SqmGlassKg = 5;
  static final num steelDorWithGlass05SqmTrunkAndSlabKgPerCbm = 7800;
  static final num steelDorWithGlass05SqmGlassKgPerCbm = 2400;
  static final num steelDoorClosedFireDoorKg = 50;
  static final num steelDoorClosedFireDoorKgPerCbm = 7800;
  static final num metallicLiftDoorsAndBigPassageDoorsKg = 100;
  static final num metallicLiftDoorsAndBigPassageDoorsGlassKg = 20;
  static final num metallicLiftDoorsAndBigPassageDoorsKgPerCbm = 7800;
}

class AvhcAndElectricalInstallationsWeights {
  static final num waterPipesCopperKgPerM = 0.207;
  static final num waterPipesPlasticKgPerM = 0.12;
  static final num waterPipesPlasticKgPerCbm = 1100;
  static final num centralHeatingPipesWaterCirculationHeatingKgPerM = 4.3;
  static final num sewagePipesCastIronDn150KgPerM = 141;
  static final num sewagePipesPlasticDn150KgPerM = 22;
  static final num sewagePipesPlasticDn150KgPerCbm = 1100;
  static final num airConditioningPipesSteelDn300KgPerM = 25;
  static final num airConditioningPipesSteelDn500KgPerM = 52;
  static final num electricalWiresCopperKgPerM = 0.13;
  static final num waterAccumulatorsElectricSmallKgPerPcs = 100;
  static final num waterAccumulatorsElectricBigDistrictHeating500To1000LtrsKgPerPcs = 400;
  static final num radiatorsElectricKgPerPcs = 8;
  static final num radiatorsWaterCirculationKgPerPcs = 15;
  static final num ventilationMachinesKgPerPcs = 100;
  static final num electricalDistirbutionCabinetsAndMetersKgPerPcs = 20;
  static final num electricMotorsAndCirculationPumpsKgPerPcs = 25;
  static final num superVacuumCleanersKgPerPcs = 15;
}

class FurnitureDressingKitchenToiletSpaceWeights {
  static final num toiletSeatPorcelainKgPerPcs = 25.8;
  static final num toiletSeatPorcelainKgPerCbm = 2500;
  static final num toiletSinkPorcelainKgPerPcs = 13.0;
  static final num toiletSinkPorcelainKgPerCbm = 2500;
  static final num metallicDressingClosets500x1600KgPerLinearMeter = 50;
  static final num metallicDressingClosets500x1600KgPerPcs = 25;
  static final num woodBasedClosetsAndOtherFurnitureWidth06MKgPerLinearMeter = 25;
  static final num woodBasedClosetsAndOtherFurnitureWidth06MKgPerPcs = 15;
  static final num woodBasedClosetsAndOtherFurnitureWidth06MKgPerCbm = 500;
  static final num steelSinksAndTablesRustProofKgPerPcs = 7.3;
  static final num rustProofTablesFoodServiceFurnitureKgPerPcs = 15;
  static final num rustProofLegsFoodServiceFurnitureKgPerPcs = 8;
  static final num saunaStovesKgPerPcs = 12;
  static final num electricStovesForApartmentsKgPerPcs = 40;
  static final num fridgesKgPerPcs = 60;
  static final num foodServiceElecticStovesKgPerPcs = 60;
  static final num coldRoomCabinetsKgPerPcs = 100;
}

class FixedFurnitureAndStructuresRelatedToBuildingWeights {
  static final num rainGuttersKgPerM = 2;
  static final num dripTraysAndProtectiveSheeting08mmSteelDiskKgPerSqm = 8;
  static final num fireEscapesAndFootBridgesKgPerM = 10;
  static final num armorMeshFenceAluminiumHeight2mKgPerM = 4;
  static final num armorMeshFenceSteelHeight2mKgPerM = 5;
}

class DrainPipeWeights {
  static final num clayBrickPipeKgPerM = 25;
  static final num clayBrickPipeKgPerCbm = 1500;
  static final num holePipePlasticKgPerM = 1;
  static final num holePipePlasticKgPerCbm = 970;
}
