import '../../bl_demolition_materials.dart';

/// An utility class for all things related to testing
class TestUtils {
  /// Returns an instance of WasteLawReportExporter with some sample data
  static WasteLawReportExporter get sampleWasteLawReportExporter {
    final repo = sampleLargePropertiesRepository;

    return WasteLawReportExporter(
        totalConcreteBricksTilesCeramics: repo.totalConcreteBricksTilesCeramics,
        totalWoodGlassPlastics: repo.totalWoodGlassPlastics,
        totalBituminousMixturesCoalTarProducts:
            repo.totalBituminousMixturesCoalTarProducts,
        totalMetalsAndAlloys: repo.totalMetalsAndAlloys,
        totalSoilAggregatesDredgingMaterials:
            repo.totalSoilAggregatesDredgingMaterials,
        insulationAndAsbestosContainingMaterials:
            repo.insulationAndAsbestosContainingMaterials,
        gypsumBasedBuildingMaterials: repo.gypsumBasedBuildingMaterials,
        totalOtherMaterials: repo.totalOtherMaterials);
  }

  /// Returns an instance of LargePropertiesRepositorywith some sample data
  static LargePropertiesRepository get sampleLargePropertiesRepository {
    final foundations = Foundations(
      falsePlinth: FalsePlinthFoundation(area: 45, circumference: 500),
      crawlSpace: CrawlSpaceFoundation(area: 63, circumference: 424),
      shallow: ShallowFoundation(area: 33, circumference: 210),
      pillar: PillarFoundation(area: 56, circumference: 332),
      hollowCoreSlab: HollowCoreSlabFoundation(area: 42, circumference: 341),
    );

    final intermediateFloors = IntermediateFloors(
        woodFramePercentage: 25,
        concreteCastingPercentage: 25,
        hollowCoreSlabPercentage: 10,
        glulamBeamPercentage: 40);

    final roofs = Roofs(
        ceilingArea: 1024,
        ridgeOrGableRoofPortionPercentage: 40,
        ridgeOrGableRoofType: RoofType.woodenTruss,
        ridgeOrGableWaterRoofType: WaterRoofType.mineriteRoof,
        flatOrMonoPitchedRoofType: RoofType.steelTruss,
        flatOrMonoPitchedWaterRoofType: WaterRoofType.tiledRoof);

    final buildingFrame = BuildingFrame(
        externalWallsPerimeter: 5123,
        externalWallsAverageHeight: 233,
        woodPortionPercentage: 20,
        glulamVerticalColumnsPortionPercentage: 20,
        concreteElementWallsWithoutFrameworkPortionPercentage: 10,
        steelProfileSandwichStructurePortionPercentage: 10,
        doubleLoadBearingBrickWallPortionPercentage: 5,
        concreteVerticalColumnsPortionPercentage: 10,
        brickCladWallPortionPercentage: 5,
        boardWallPortionPercentage: 10,
        profiledSheetMetalPortionPercentage: 5,
        steelVerticalColumnsPortionPercentage: 2.5,
        mineriteOrOtherStoneBoardPortionPercentage: 2.5);

    final buildingDimensions = BuildingDimensions(
        grossFloorArea: 8945,
        volume: 156892,
        floorCountExcludingCellars: 18,
        averageArea: 3661);

    final cellar = Cellar(
        floorArea: 8000,
        wallHeight: 80,
        exteriorWallsPerimeter: 200,
        exteriorWallsMaterial: CellarExteriorMaterial.brick);

    final excavationArea = ExcavationArea(
        areaToRemoveSize: 51,
        areaToRemoveDepth: 25,
        asphaltArea: 16,
        cleanSoilPortionPercentage: 85.1);

    final largePropertyEvaluationInfo = LargePropertyEvaluationInfo(
        propertyName: 'Sandyville',
        buildingType: 'Kerrostalo',
        address: 'Santamalakatu 6 A 20',
        municipality: 'Viikanteri',
        author: 'Matti H',
        date: DateTime.now(),
        version: DateTime.utc(2013, 12, 17),
        description: 'Some sample evaluation info');

    final concreteBricksTilesCeramics = ConcreteBricksTilesCeramics(
        concreteNotes: 'nice concrete',
        ceramicTilesNotes: 'ceramic tiles are so shiny i want to lick them',
        brickNotes: 'dont smash this brick thru the window',
        hazardousConcreteBrickTileCeramicMixturesNotes:
            'mix match of weird structures',
        otherMaterials: WasteLawDemolitionMaterialEstimateEntry(
            volume: 300,
            tons: 5123,
            notes: 'Some random junk I found in the corner'));

    final floorStructures = FloorStructures(
      officeSpaces: FloorStructure(
          totalArea: 512,
          chipBoardMidsolePortionPercentage: 15,
          gypsumBoardingMidsolePortionPercentage: 15,
          solidBoardingMidsolePortionPercentage: 15,
          floorPanelFloorPortionPercentage: 5,
          plasticCarpetOrPlasticTileFloorPortionPercentage: 20,
          parquetFloorPortionPercentage: 20,
          ceramicTileFloorPortionPercentage: 10),
      lobbiesAndOtherCommonAreas: FloorStructure(
          totalArea: 300,
          chipBoardMidsolePortionPercentage: 5,
          gypsumBoardingMidsolePortionPercentage: 20,
          solidBoardingMidsolePortionPercentage: 15,
          floorPanelFloorPortionPercentage: 15,
          plasticCarpetOrPlasticTileFloorPortionPercentage: 15,
          parquetFloorPortionPercentage: 10,
          ceramicTileFloorPortionPercentage: 20),
      restroomsAndWashingFacilities: FloorStructure(
          totalArea: 351,
          chipBoardMidsolePortionPercentage: 20,
          gypsumBoardingMidsolePortionPercentage: 5,
          solidBoardingMidsolePortionPercentage: 10,
          floorPanelFloorPortionPercentage: 15,
          plasticCarpetOrPlasticTileFloorPortionPercentage: 15,
          parquetFloorPortionPercentage: 15,
          ceramicTileFloorPortionPercentage: 20),
      kitchens: FloorStructure(
          totalArea: 987,
          chipBoardMidsolePortionPercentage: 0,
          gypsumBoardingMidsolePortionPercentage: 0,
          solidBoardingMidsolePortionPercentage: 50,
          floorPanelFloorPortionPercentage: 25,
          plasticCarpetOrPlasticTileFloorPortionPercentage: 0,
          parquetFloorPortionPercentage: 25,
          ceramicTileFloorPortionPercentage: 0),
      teachingAndTreatmentSpaces: FloorStructure(
          totalArea: 135,
          chipBoardMidsolePortionPercentage: 50,
          gypsumBoardingMidsolePortionPercentage: 40,
          solidBoardingMidsolePortionPercentage: 0,
          floorPanelFloorPortionPercentage: 10,
          plasticCarpetOrPlasticTileFloorPortionPercentage: 0,
          parquetFloorPortionPercentage: 0,
          ceramicTileFloorPortionPercentage: 0),
      storageAndWorkspaces: FloorStructure(
          totalArea: 50,
          chipBoardMidsolePortionPercentage: 0,
          gypsumBoardingMidsolePortionPercentage: 0,
          solidBoardingMidsolePortionPercentage: 100,
          floorPanelFloorPortionPercentage: 0,
          plasticCarpetOrPlasticTileFloorPortionPercentage: 0,
          parquetFloorPortionPercentage: 0,
          ceramicTileFloorPortionPercentage: 0),
      otherSpaces: FloorStructure(
          totalArea: 152,
          chipBoardMidsolePortionPercentage: 0,
          gypsumBoardingMidsolePortionPercentage: 0,
          solidBoardingMidsolePortionPercentage: 5,
          floorPanelFloorPortionPercentage: 75,
          plasticCarpetOrPlasticTileFloorPortionPercentage: 0,
          parquetFloorPortionPercentage: 10,
          ceramicTileFloorPortionPercentage: 10),
    );

    final internalWallFramesAndSurfaceMaterial =
        InternalWallFramesAndSurfaceMaterial(
            officeSpaces: RoomSpace(
                woodFramedWalls: 15,
                brickWalls: 31,
                concreteElementOrCastingWalls: 94,
                chipboardPortionPercentage: 81,
                cybrocPortionPercentage: 14,
                boardPanelPortionPercentage: 18,
                ceramicTileWallsPortionPercentage: 52,
                paintedPlasteredBrickWallPortionPercentage: 49,
                plasticCarpetPortionPercentage: 35),
            lobbiesAndOtherCommonAreas: RoomSpace(
                woodFramedWalls: 24,
                brickWalls: 26,
                concreteElementOrCastingWalls: 42,
                chipboardPortionPercentage: 35,
                cybrocPortionPercentage: 61,
                boardPanelPortionPercentage: 82,
                ceramicTileWallsPortionPercentage: 28,
                paintedPlasteredBrickWallPortionPercentage: 30,
                plasticCarpetPortionPercentage: 3),
            restroomsAndWashingFacilities: RoomSpace(
                woodFramedWalls: 22,
                brickWalls: 28,
                concreteElementOrCastingWalls: 52,
                chipboardPortionPercentage: 14,
                cybrocPortionPercentage: 21,
                boardPanelPortionPercentage: 11,
                ceramicTileWallsPortionPercentage: 39,
                paintedPlasteredBrickWallPortionPercentage: 32,
                plasticCarpetPortionPercentage: 11),
            kitchens: RoomSpace(
                woodFramedWalls: 5,
                brickWalls: 8,
                concreteElementOrCastingWalls: 11,
                chipboardPortionPercentage: 2,
                cybrocPortionPercentage: 5,
                boardPanelPortionPercentage: 0,
                ceramicTileWallsPortionPercentage: 9,
                paintedPlasteredBrickWallPortionPercentage: 8,
                plasticCarpetPortionPercentage: 12),
            teachingAndTreatmentSpaces: RoomSpace(
                woodFramedWalls: 15,
                brickWalls: 31,
                concreteElementOrCastingWalls: 94,
                chipboardPortionPercentage: 81,
                cybrocPortionPercentage: 14,
                boardPanelPortionPercentage: 18,
                ceramicTileWallsPortionPercentage: 52,
                paintedPlasteredBrickWallPortionPercentage: 49,
                plasticCarpetPortionPercentage: 35),
            storageAndWorkspaces: RoomSpace(
                woodFramedWalls: 51,
                brickWalls: 13,
                concreteElementOrCastingWalls: 49,
                chipboardPortionPercentage: 18,
                cybrocPortionPercentage: 41,
                boardPanelPortionPercentage: 81,
                ceramicTileWallsPortionPercentage: 25,
                paintedPlasteredBrickWallPortionPercentage: 94,
                plasticCarpetPortionPercentage: 53),
            otherSpaces: RoomSpace(
                woodFramedWalls: 52,
                brickWalls: 23,
                concreteElementOrCastingWalls: 24,
                chipboardPortionPercentage: 28,
                cybrocPortionPercentage: 24,
                boardPanelPortionPercentage: 28,
                ceramicTileWallsPortionPercentage: 22,
                paintedPlasteredBrickWallPortionPercentage: 32,
                plasticCarpetPortionPercentage: 41));

    final windows =
        Windows(windowsPcs: 205, windowsArea: 765, glassWallArea: 200);

    final outerDoors = OuterDoors(
        accessAndLoadingDoors: 8,
        woodenDoors: DoorsInfo(shutDoors: 4, glassDoors: 1),
        aluminiumDoors: DoorsInfo(shutDoors: 12, glassDoors: 2),
        steelDoors: DoorsInfo(shutDoors: 8, glassDoors: 0));

    final innerDoors = InnerDoors(
      panelDoors: DoorsInfo(shutDoors: 8, glassDoors: 4),
      fireDoors: DoorsInfo(shutDoors: 2, glassDoors: 2),
      woodenDoors: DoorsInfo(shutDoors: 5, glassDoors: 0),
    );

    final fixedFurniture = FixedFurniture(
        porcelainSinks: 24,
        porcelainToilets: 12,
        steelLockerCabinets: 4,
        kitchenClosetsWoodOrChipboard: 1,
        steelTables: 128,
        clothingOrOtherClosetsWood: 64,
        electricStoves: 2,
        industrialElectricStoves: 12,
        coldRoomCabinets: 4,
        refrigerators: 4,
        saunaStoves: 15);

    final fixturesAndStructures = FixturesAndStructures(
      rainGuttersAndDownSpouts:
          RainGuttersAndDownspouts(meters: 32, weightKgPerMeter: 8),
      fireLaddersAndWalkways:
          FireLaddersAndWalkways(meters: 16, weightKgPerMeter: 24),
      aluminiumChainLinkFences:
          AluminiumChainLinkFences(meters: 200, weightKgPerMeter: 10),
      steelChainLinkFences:
          SteelChainLinkFences(meters: 25, weightKgPerMeter: 25),
    );

    final hvacAndElectricalInstallations = HvacAndElectricalInstallations(
        copperWaterPipes: CopperWaterPipes(meters: 21, weightKgPerMeter: 8),
        plasticWaterPipes: PlasticWaterPipes(meters: 32, weightKgPerMeter: 12),
        centralHeatingPipes:
            CentralHeatingPipes(meters: 44, weightKgPerMeter: 4),
        castIronSewagePipes:
            CastIronSewagePipes(meters: 31, weightKgPerMeter: 150),
        plasticSewagePipes:
            PlasticSewagePipes(meters: 21, weightKgPerMeter: 12),
        steelVentilationPipes300Dn:
            SteelVentilationPipes300Dn(meters: 8, weightKgPerMeter: 40),
        steelVentilationPipes500Dn:
            SteelVentilationPipes500Dn(meters: 21, weightKgPerMeter: 75),
        copperElectricalWires:
            CopperElectricalWires(meters: 52112, weightKgPerMeter: 4));

    final machinesAndEquipments = MachinesAndEquipments(
        smallElectricalAccumulators:
            SmallElectricalWaterAccumulators(quantity: 5, weightKgPerPiece: 20),
        largeElectricalAccumulators:
            LargeElectricalWaterAccumulators(quantity: 5, weightKgPerPiece: 17),
        electricRadiators: ElectricRadiators(quantity: 4, weightKgPerPiece: 18),
        waterCirculatedRadiators:
            WaterCirculatedRadiators(quantity: 7, weightKgPerPiece: 20),
        ventilationUnits: VentilationUnits(quantity: 1, weightKgPerPiece: 50),
        electricalDistributionCabinetsAndMeters:
            ElectricalDistributionCabinetsAndMeters(
                quantity: 9, weightKgPerPiece: 40),
        electricMotorsAndCirculationPumps: ElectricMotorsAndCirculationPumps(
            quantity: 3, weightKgPerPiece: 42),
        roofExhaustFans: RoofExhaustFans(quantity: 4, weightKgPerPiece: 4));

    final yardAndProtectiveStructures = YardAndProtectiveStructures(
        dripTraysAndProtectiveMetalSheets: DripTraysAndProtectiveMetalSheets(
            squareMeters: 1024, weightKgPerSquareMeter: 15),
        concretePavingSlabs:
            ConcretePavingSlabs(squareMeters: 512, weightKgPerSquareMeter: 51));

    final demolitionWasteAndCosts =
        DemolitionWasteAndCosts(demolitionCostPerTon: 500.75);

    final disposalMaterialsAndHazardousWaste =
        DisposalMaterialsAndHazardousWaste(
            nonRecyclableBrickWasteDemolitionOrProcessingCost: 12.75,
            contaminatedSoilDemolitionOrProcessingCost: 5.5,
            asbestosOrBCPConcreteDemolitionOrProcessingCost: 28.5,
            bitumenDemolitionOrProcessingCost: 24.25,
            otherAsbestosContainingMaterialDemolitionOrProcessingCost: 26);

    final recyclableComponentsAndFurniture = RecyclableComponentsAndFurniture(
      concreteFrameBeamsUnitPrice: 1,
      concreteHollowSlabsUnitPrice: 2,
      concreteRoofBeamsUnitPrice: 3,
      concreteWallElementsUnitPrice: 4,
      glulamBeamsUnitPrice: 5,
      floorSupportWoodenBeamsUnitPrice: 6,
      steelFrameBeamsUnitPrice: 7,
      rainGuttersAndDownspoutsUnitPrice: 8,
      fireLaddersAndWalkwaysUnitPrice: 9,
      woodenRoofTrussesUnitPrice: 10,
      steelRoofTrussesUnitPrice: 11,
      steelChainLinkFenceUnitPrice: 12,
      aluminumChainLinkFenceUnitPrice: 13,
      woodAndFiberboardDoorsUnitPrice: 14,
      aluminumDoorsUnitPrice: 15,
      exteriorAndFireExitSteelDoorsUnitPrice: 16,
      woodenOrBoardCabinetsAndFurnitureUnitPrice: 17,
      steelLockerCabinetsUnitPrice: 18,
      woodenWindowsUnitPrice: 19,
      porcelainToiletsUnitPrice: 20,
      porcelainSinksUnitPrice: 21,
      stainlessSteelSinksAndTablesUnitPrice: 22,
      saunaStovesUnitPrice: 23,
      electricStovesUnitPrice: 24,
      industrialElectricStovesUnitPrice: 25,
      refrigeratorsUnitPrice: 26,
      coldRoomCabinetsUnitPrice: 27,
      electricRadiatorsUnitPrice: 28,
      smallElectricalAccumulatorsUnitPrice: 29,
      largeElectricalAccumulatorsUnitPrice: 30,
      electricMotorsAndCirculationPumpsUnitPrice: 31,
      ventilationUnitsUnitPrice: 32,
      electricalDistributionCabinetsAndMetersUnitPrice: 33,
      roofExhaustFansUnitPrice: 34,
    );

    final reusableAndRecyclableMaterials = ReusableAndRecyclableMaterials(
        cleanSoilDemolitionCost: 0,
        asphaltWasteDemolitionCost: 10,
        cleanConcreteDemolitionCost: 1,
        concreteBlocksDemolitionCost: 9,
        wallAndRoofTilesDemolitionCost: 2,
        ceramicTilesDemolitionCost: 8,
        rebarAndSteelScrapDemolitionCost: 3,
        stainlessSteelDemolitionCost: 7,
        copperDemolitionCost: 4,
        aluminiumDemolitionCost: 6,
        cleanUsableWoodDemolitionCost: 5,
        combustibleWoodWasteDemolitionCost: 5,
        glassDemolitionCost: 11,
        glassAndMineralWoolDemolitionCost: 14,
        fiberCementBoardsDemolitionCost: 13,
        gypsumBoardsDemolitionCost: 12,
        chipboardDemolitionCost: 16,
        windProtectionBoardDemolitionCost: 17,
        eWasteDemolitionCost: 19,
        plasticWasteDemolitionCost: 14,
        energyWasteDemolitionCost: 44);

    final woodGlassPlastics = WoodGlassPlastics(
        woodNotes: 'some wood notes',
        glassNotes: 'some glass notes',
        plasticNotes: 'some plastic notes',
        otherDangerousOrContaminatedMaterialsNotes: 'this is dangerous!');

    final bituminousMixturesCoalTarProducts = BituminousMixturesCoalTarProducts(
        coalTarContainingBituminousMixturesNotes: 'this is inedible I think',
        otherBituminousMixtures: WasteLawDemolitionMaterialEstimateEntry(
            volume: 50, tons: 211, notes: 'note1'),
        unnamed: WasteLawDemolitionMaterialEstimateEntry(
            volume: 2166, tons: 126342, notes: 'note2'),
        coalTarAndTarProducts: WasteLawDemolitionMaterialEstimateEntry(
            volume: 12, tons: 55, notes: 'note3'));

    final metalsAndAlloys = MetalsAndAlloys(
        copperBronzeAndBrassNotes: 'copper is cool, changes color over time',
        aluminiumNotes: 'this is soon to be rare metal',
        ironAndSteelNotes: 'hard stuff',
        mixedMetalsNotes: 'mixing metals makes them mixed',
        hazardousOilAndTarCables: WasteLawDemolitionMaterialEstimateEntry(
            volume: 55112, tons: 40000, notes: 'almost an entire oil rig'),
        lead: WasteLawDemolitionMaterialEstimateEntry(
            volume: 12, tons: 411, notes: 'boink'),
        zinc: WasteLawDemolitionMaterialEstimateEntry(
            volume: 21, tons: 123, notes: 'zincish khan'),
        tin: WasteLawDemolitionMaterialEstimateEntry(
            volume: 1, tons: 0.55, notes: 'a tin can rastatan'),
        contaminatedMetalWaste: WasteLawDemolitionMaterialEstimateEntry(
            volume: 10, tons: 5, notes: 'estimate amount of stinky socks'),
        otherCables: WasteLawDemolitionMaterialEstimateEntry(
            volume: 5, tons: 2000, notes: 'very heavy cables'));

    final soilAggregatesDredgingMaterials = SoilAggregatesDredgingMaterials(
        hazardousSoilAndRockNotes: 'Toxic avenger slime',
        soilAndRock: WasteLawDemolitionMaterialEstimateEntry(
            tons: 1, volume: 2, notes: 'monkeyfood'),
        hazardousDredgingSpoil: WasteLawDemolitionMaterialEstimateEntry(
            tons: 4, volume: 5, notes: 'young money'),
        dredgingSpoil: WasteLawDemolitionMaterialEstimateEntry(
            tons: 7, volume: 8, notes: 'dredging soil sounds nice'),
        hazardousRailwayBallast: WasteLawDemolitionMaterialEstimateEntry(
            tons: 6, volume: 7, notes: 'ballasting that railway'),
        railwayBallast: WasteLawDemolitionMaterialEstimateEntry(
            tons: 3,
            volume: 4,
            notes: 'ballasting that railway non-hazardously'));

    final insulationAndAsbestosContainingMaterials =
        InsulationAndAsbestosContainingMaterials(
            asbestosContainingInsulationMaterials:
                WasteLawDemolitionMaterialEstimateEntry(
                    tons: 100, volume: 50, notes: 'bored banana bread'),
            otherHazardousInsulationMaterials:
                WasteLawDemolitionMaterialEstimateEntry(
                    tons: 87, volume: 112, notes: 'test'),
            otherInsulationMaterials: WasteLawDemolitionMaterialEstimateEntry(
                tons: 552,
                volume: 5612,
                notes: 'ive been breathing this stuff forever!'),
            asbestosContainingBuildingMaterials:
                WasteLawDemolitionMaterialEstimateEntry(
                    tons: 81, volume: 24, notes: 'ping pong'));

    final gypsumBasedBuildingMaterials = GypsumBasedBuildingMaterials(
        contaminatedGypsumBasedMaterials:
            WasteLawDemolitionMaterialEstimateEntry(
                volume: 15,
                tons: 200,
                notes: 'gypsum is plaster. this one is dangerous'),
        otherGypsumBasedMaterials: WasteLawDemolitionMaterialEstimateEntry(
            volume: 19, tons: 197, notes: 'this is non-hazardous'));

    final otherMaterials = OtherMaterials(
        pcbContainingDemolitionWasteNotes:
            'reported this last year, must get rid of ASAP',
        mercuryContainingMaterials: WasteLawDemolitionMaterialEstimateEntry(
            volume: 50, tons: 100, notes: 'mercury not the planet'),
        otherDemolitionWaste: WasteLawDemolitionMaterialEstimateEntry(
            volume: 141, tons: 2451, notes: 'toxic'),
        otherHazardousDemolitionWaste: WasteLawDemolitionMaterialEstimateEntry(
            volume: 50, tons: 2, notes: 'stinky sock in the corner'));

    return LargePropertiesRepository(
        excavationArea: excavationArea,
        buildingFrame: buildingFrame,
        buildingDimensions: buildingDimensions,
        cellar: cellar,
        foundations: foundations,
        intermediateFloors: intermediateFloors,
        roofs: roofs,
        largePropertyEvaluationInfo: largePropertyEvaluationInfo,
        concreteBricksTilesCeramics: concreteBricksTilesCeramics,
        floorStructures: floorStructures,
        internalWallFramesAndSurfaceMaterial:
            internalWallFramesAndSurfaceMaterial,
        windows: windows,
        outerDoors: outerDoors,
        innerDoors: innerDoors,
        fixedFurniture: fixedFurniture,
        fixturesAndStructures: fixturesAndStructures,
        hvacAndElectricalInstallations: hvacAndElectricalInstallations,
        machinesAndEquipments: machinesAndEquipments,
        yardAndProtectiveStructures: yardAndProtectiveStructures,
        demolitionWasteAndCosts: demolitionWasteAndCosts,
        disposalMaterialsAndHazardousWaste: disposalMaterialsAndHazardousWaste,
        recyclableComponentsAndFurniture: recyclableComponentsAndFurniture,
        reusableAndRecyclableMaterials: reusableAndRecyclableMaterials,
        woodGlassPlastics: woodGlassPlastics,
        bituminousMixturesCoalTarProducts: bituminousMixturesCoalTarProducts,
        metalsAndAlloys: metalsAndAlloys,
        soilAggregatesDredgingMaterials: soilAggregatesDredgingMaterials,
        insulationAndAsbestosContainingMaterials:
            insulationAndAsbestosContainingMaterials,
        gypsumBasedBuildingMaterials: gypsumBasedBuildingMaterials,
        otherMaterials: otherMaterials);
  }
}
