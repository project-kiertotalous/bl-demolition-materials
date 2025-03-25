import '../../bl_demolition_materials.dart';
import '../large_properties/demolition_material_assessment/exports.dart';
import '../large_properties/hvac_electrical_and_other_equipment/exports.dart';
import '../large_properties/hvac_electrical_and_other_equipment/fixtures_or_structures/exports.dart';
import '../large_properties/hvac_electrical_and_other_equipment/hvac_or_electrical_installations/exports.dart';
import '../large_properties/hvac_electrical_and_other_equipment/machines_or_equipments/exports.dart';
import '../large_properties/hvac_electrical_and_other_equipment/yard_or_protective_structures/exports.dart';
import '../large_properties/large_properties_repository.dart';
import '../large_properties/partition_walls_doors_and_windows/exports.dart';
import '../large_properties/waste_law_demolition_material_estimates/exports.dart';
import '../reports/waste_law_report_exporter.dart';

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
        woodFramePercentageFraction: 0.25,
        concreteCastingPercentageFraction: 0.25,
        hollowCoreSlabPercentageFraction: 0.1,
        glulamBeamPercentageFraction: 0.4);

    final roofs = Roofs(
        ceilingArea: 1024,
        ridgeOrGableRoofPortion: 0.4,
        ridgeOrGableRoofType: RoofType.woodenTruss,
        ridgeOrGableWaterRoofType: WaterRoofType.mineriteRoof,
        flatOrMonoPitchedRoofType: RoofType.steelTruss,
        flatOrMonoPitchedWaterRoofType: WaterRoofType.tiledRoof);

    final buildingFrame = BuildingFrame(
        externalWallsPerimeter: 5123,
        externalWallsAverageHeight: 233,
        woodPortionFractionPercentage: 0.2,
        glulamVerticalColumnsPortionFractionPercentage: 0.2,
        concreteElementWallsWithoutFrameworkPortionFractionPercentage: 0.1,
        steelProfileSandwichStructurePortionFractionPercentage: 0.1,
        doubleLoadBearingBrickWallPortionFractionPercentage: 0.05,
        concreteVerticalColumnsPortionFractionPercentage: 0.1,
        brickCladWallPortionFractionPercentage: 0.05,
        boardWallPortionFractionPercentage: 0.1,
        profiledSheetMetalPortionFractionPercentage: 0.05,
        steelVerticalColumnsPortionFractionPercentage: 0.025,
        mineriteOrOtherStoneBoardPortionFractionPercentage: 0.025);

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
        cleanSoilPortionPercentageFraction: 0.851);

    final largePropertyEvaluationInfo = LargePropertyEvaluationInfo(
        buildingType: 'A very large one',
        address: 'Santamalakatu 6 A 20',
        municipality: 'Viikanteri',
        author: 'Gustav Von Hanselmo',
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
          chipBoardMidsolePortion: 0.15,
          gypsumBoardingMidsolePortion: 0.15,
          solidBoardingMidsolePortion: 0.15,
          floorPanelFloorPortion: 0.05,
          plasticCarpetOrPlasticTileFloorPortion: 0.2,
          parquetFloorPortion: 0.2,
          ceramicTileFloorPortion: 0.1),
      lobbiesAndOtherCommonAreas: FloorStructure(
          totalArea: 300,
          chipBoardMidsolePortion: 0.05,
          gypsumBoardingMidsolePortion: 0.2,
          solidBoardingMidsolePortion: 0.15,
          floorPanelFloorPortion: 0.15,
          plasticCarpetOrPlasticTileFloorPortion: 0.15,
          parquetFloorPortion: 0.1,
          ceramicTileFloorPortion: 0.2),
      restroomsAndWashingFacilities: FloorStructure(
          totalArea: 351,
          chipBoardMidsolePortion: 0.2,
          gypsumBoardingMidsolePortion: 0.05,
          solidBoardingMidsolePortion: 0.1,
          floorPanelFloorPortion: 0.15,
          plasticCarpetOrPlasticTileFloorPortion: 0.15,
          parquetFloorPortion: 0.15,
          ceramicTileFloorPortion: 0.2),
      kitchens: FloorStructure(
          totalArea: 987,
          chipBoardMidsolePortion: 0,
          gypsumBoardingMidsolePortion: 0,
          solidBoardingMidsolePortion: 0.5,
          floorPanelFloorPortion: 0.25,
          plasticCarpetOrPlasticTileFloorPortion: 0,
          parquetFloorPortion: 0.25,
          ceramicTileFloorPortion: 0),
      teachingAndTreatmentSpaces: FloorStructure(
          totalArea: 135,
          chipBoardMidsolePortion: 0.5,
          gypsumBoardingMidsolePortion: 0.4,
          solidBoardingMidsolePortion: 0,
          floorPanelFloorPortion: 0.1,
          plasticCarpetOrPlasticTileFloorPortion: 0,
          parquetFloorPortion: 0,
          ceramicTileFloorPortion: 0),
      storageAndWorkspaces: FloorStructure(
          totalArea: 50,
          chipBoardMidsolePortion: 0,
          gypsumBoardingMidsolePortion: 0,
          solidBoardingMidsolePortion: 1,
          floorPanelFloorPortion: 0,
          plasticCarpetOrPlasticTileFloorPortion: 0,
          parquetFloorPortion: 0,
          ceramicTileFloorPortion: 0),
      otherSpaces: FloorStructure(
          totalArea: 152,
          chipBoardMidsolePortion: 0,
          gypsumBoardingMidsolePortion: 0,
          solidBoardingMidsolePortion: 0,
          floorPanelFloorPortion: 0.75,
          plasticCarpetOrPlasticTileFloorPortion: 0,
          parquetFloorPortion: 0.1,
          ceramicTileFloorPortion: 0.1),
    );

    final roomSpaces = RoomSpaces(
        officeSpaces: RoomSpace(
            woodFramedWallsLinearMeters: 15,
            brickWallsLinearMeters: 31,
            concreteElementOrCastingWallsLinearMeters: 94,
            parOfWholeWallAreaInPercents: 0.5,
            chipboard: 81,
            cybroc: 14,
            boardPanel: 18,
            ceramicTileWalls: 52,
            paintedPlasteredBrickWall: 49,
            plasticCarpet: 35),
        lobbiesAndOtherCommonAreas: RoomSpace(
            woodFramedWallsLinearMeters: 24,
            brickWallsLinearMeters: 26,
            concreteElementOrCastingWallsLinearMeters: 42,
            parOfWholeWallAreaInPercents: 0.9,
            chipboard: 35,
            cybroc: 61,
            boardPanel: 82,
            ceramicTileWalls: 28,
            paintedPlasteredBrickWall: 30,
            plasticCarpet: 3),
        restroomsAndWashingFacilities: RoomSpace(
            woodFramedWallsLinearMeters: 22,
            brickWallsLinearMeters: 28,
            concreteElementOrCastingWallsLinearMeters: 52,
            parOfWholeWallAreaInPercents: 0.9,
            chipboard: 14,
            cybroc: 21,
            boardPanel: 11,
            ceramicTileWalls: 39,
            paintedPlasteredBrickWall: 32,
            plasticCarpet: 11),
        kitchens: RoomSpace(
            woodFramedWallsLinearMeters: 5,
            brickWallsLinearMeters: 8,
            concreteElementOrCastingWallsLinearMeters: 11,
            parOfWholeWallAreaInPercents: 1,
            chipboard: 2,
            cybroc: 5,
            boardPanel: 0,
            ceramicTileWalls: 9,
            paintedPlasteredBrickWall: 8,
            plasticCarpet: 12),
        teachingAndTreatmentSpaces: RoomSpace(
            woodFramedWallsLinearMeters: 15,
            brickWallsLinearMeters: 31,
            concreteElementOrCastingWallsLinearMeters: 94,
            parOfWholeWallAreaInPercents: 0.5,
            chipboard: 81,
            cybroc: 14,
            boardPanel: 18,
            ceramicTileWalls: 52,
            paintedPlasteredBrickWall: 49,
            plasticCarpet: 35),
        storageAndWorkspaces: RoomSpace(
            woodFramedWallsLinearMeters: 51,
            brickWallsLinearMeters: 13,
            concreteElementOrCastingWallsLinearMeters: 49,
            parOfWholeWallAreaInPercents: 0.775,
            chipboard: 18,
            cybroc: 41,
            boardPanel: 81,
            ceramicTileWalls: 25,
            paintedPlasteredBrickWall: 94,
            plasticCarpet: 53),
        otherSpaces: RoomSpace(
            woodFramedWallsLinearMeters: 52,
            brickWallsLinearMeters: 23,
            concreteElementOrCastingWallsLinearMeters: 24,
            parOfWholeWallAreaInPercents: 0.4,
            chipboard: 28,
            cybroc: 24,
            boardPanel: 28,
            ceramicTileWalls: 22,
            paintedPlasteredBrickWall: 32,
            plasticCarpet: 41));

    final windows =
        Windows(windowsPcs: 205, windowsArea: 765, glassWallArea: 200);

    final outerDoors = OuterDoors(
        accessAndLoadingDoors: 8,
        woodenDoors: OuterDoor(shutDoors: 4, glassDoors: 1),
        aluminiumDoors: OuterDoor(shutDoors: 12, glassDoors: 2),
        steelDoors: OuterDoor(shutDoors: 8, glassDoors: 0));

    final innerDoors = InnerDoors(
      panelDoors: InnerDoor(shutDoors: 8, glassDoors: 4),
      fireDoors: InnerDoor(shutDoors: 2, glassDoors: 2),
      woodenDoors: InnerDoor(shutDoors: 5, glassDoors: 0),
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
        roomSpaces: roomSpaces,
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
