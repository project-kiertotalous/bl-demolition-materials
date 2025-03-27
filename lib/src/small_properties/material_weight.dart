/// 5. Rakenteiden materiaali painot

/// Puutavara
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

  static final Map<WoodMaterialType, num> _boardConsumption = {
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
}

/// Rakennuslevyt- ja eristemateriaali ja paksuus (mm)
class BuildingBoardsAndInsulationMaterialWeights {
  static num plasterBoard15mmKgPerSqm = 9;
  static num chipBoard11mmKgPerSqm = 7.5;
  static num windProtectionBoardKgPerSqm = 7;
  static num steelBoardCladding06mmKgPerSqm = 4.2;
  static num roofSheet06mmKgPerSqm = 4.2;
  static num mineriteBoardKgPerSqm = 15;
  static num roofingFeltKgPerSqm = 8;
  static num roofBrickKgPerSqm = 39;
  static num underlaymentKgPerSqm = 0.21;
  static num insulationWool100mmKgPerSqm = 5.5;
}

/// Ovet ja ikkunat
///Runko ja levy (kg), lasi (kg)
class DoorsAndWindowsWeights {
  static num woodenOutdoors210x180Glass05sqmFrameKg = 51;
  static num woodenOutdoors210x180Glass05GlassKg = 0.5 * 10;
  static num woodenOutdoor210x180ClosedKg = 47;
  static num woodenInnerDoorsGlass05sqmFrameKg = 21;
  static num woodenInnerDoorsGlass05sqmGlassKg = 0.5 * 10;
  static num fiberDoorsGlass05sqmFrameKg = 14;
  static num fiberDoorsGlass05sqmGlassKg = 0.5 * 10;
  static num steelDoorsGlass05sqmFrameKg = 80;
  static num steelDoorsGlass05sqmGlassKg = 0.5 * 10;
  static num steelDoorsClosedKg = 50;
  static num aluminiumDoorsWithGlassFrameKg = 40;
  static num aluminiumDoorsWithGlassGlassKg = 5;
  static num metallicLiftAndPassageDoorsFrameKg = 100;
  static num metallicLiftAndPassageDoorsGlassKg = 2 * 10;
  static num woodenWindows140x140glass2x1_5sqmFrameKg = 25;
  static num woodenWindows140x140glass2x1_5sqmGlassKg = 3 * 10;
  static num aluminiumFramedWindows140x140glass2x1_5sqmFrameKg = 40;
  static num aluminiumFramedWindows140x140glass2x1_5sqmGlassKg = 3 * 10;
  static num steelFramedWindows140x140glass2x1_5sqmFrameKg = 50;
  static num steelFramedWindows140x140glass2x1_5sqmGlassKg = 3 * 10;
}

/// Lattiarakenteet ja materiaalit
class FloorStructuresAndMaterialsWeights {
  static num parquetKgPerSqm = 0.2;
  static num plasticCarpetKgPerSqm = 0.2;
  static num ceramicTilesKgPerSqm = 16;
  static num treeTrunks50x100mm600mmDivision1_6LmPerSqmKgPerSqm = 1.6 *
      WoodMaterialInfo.weightPerLinearMeter(WoodMaterialType.trunkWood50x100);
  static num concreteCasting100mmKgPerSqm = 0.1 * 2500;
}

/// Puiset kattorakenteet, ristikot, aluslaudoitus yms.
class WoodenRoofStructuresWeights {
  static num gableRoofWithLattice800mmKgPerSqm = 20;
  static num flatRoofWithLattice800mmKgPerSqm = 15;
  static num cofferedCeilingWithLattice800mmKgPerSqm = 15;
}

/// Teraksiset kattorakenteet, ristikor yms.
class SteelRoofStructuresWeights {
  static num gableRoofKgPerSqm = 50;
  static num flatRoofKgPerSqm = 40;
  static num cofferedCeilingKgPerSqm = 40;
}

/// Kivi ja keraamiset materiaalit yms.
class StoneAndCeramicMaterialsWeights {
  static num brickWallsAndMortarKgPerSqm = 150;
  static num ceramicTilesKgPerSqm = 16;
  static num concreteWallElements100mmKgPerSqm = 0.1 * 2500;
  static num yardTilesKgPerSqm = 135;
}

/// Runkopalkit ja niiden mitat (mm)
class FrameBarWeights {
  static num concreteVerticalBars300x300KgPerM = 225;
  static num concreteRoofBars500x300KgPerM = 375;
  static num steelVerticalBarsIProfile200hx100bKgPerM = 22.4;
  static num steelVerticalBarsPipeProfile250x250KgPerM = 45.2;
  static num glulamBeamsVolume004SqmPerLinearMeterKgPerM = 0.04 * 500;
  static num glulamBeamsRoofVolume005SqmPerLinearMeterKgPerM = 0.05 * 500;
}

/// Kalusteet puku, keittio ja WC-tilat
class FurnitureDressingKitchenToiletSpaceWeights {
  static num toiletSeatPorcelainKgPerPcs = 25.8;
  static num washingSinkPorcelainKgPerPcs = 13;
  static num metallicDressingClosetsKgPerPcs = 25;
  static num woodBasedClosetsAndOtherFurnitureWidth06MKgPerPcs = 15;
  static num woodBasedClosetsAndOtherFurnitureWidth06MKgPerLinearMeter =
      woodBasedClosetsAndOtherFurnitureWidth06MKgPerPcs / 0.6;
  static num steelSinksAndTablesRustProofKgPerPcs = 7.3;
  static num saunaStovesKgPerPcs = 12;
  static num electricStovesKgPerPcs = 40;
  static num refridgeratorsKgPerPcs = 60;
  static num waterAccumulatorsKgPerPcs = 100;
  static num centralHeatingRadiatorsWaterCirculatinKgPerPcs = 10;
  static num ventilationMachineKgPerPcs = 100;
  static num electicCentralKgPerPcs = 20;
  static num electricEngineKgPerPcs = 10;
}

/// Putket ja johdot
class PipesAndCablesWeights {
  static num waterPipesCopperKgPerM = 0.207;
  static num waterPipesPlasticKgPerM = 0.12;
  static num sewerPipesCastIronDn150KGPerM = 141;
  static num sewerPipesPlasticDn150KgPerM = 22;
  static num centralHeatingPipesKgPerM = 4.3;
  static num steelVentilationPipes300DnKgPerM = 52;
  static num electricalWiresCopperKgPerM = 0.13;
}

/// Perustukset
class FoundationWeights {
  static num concreteKgPerCbm = 2500;
  static num concreteOrSteelBlockKgPerCbm = 100;
  static num removableSoilKgPerCbm = 1500;
  static num asphaltKgPerSqm = 100;
}

/// Piharakenteet, varastot ja muut varusteet
class YardStructureWeights {
  static num concreteYardTilesAndStonesKgPerSqm = 120;
  static num waterGuttersKgPerSqm = 20;
  static num woodenFencesHeight1_2mKgPerM = 2;
  static num steelMeshFencesHeight1_2mKgPerM = 2.5;
  static num aluminiumMeshFencesHeight1_2mKgPerM = 2;

  static num concreteBarsKgPerPcs = 35;
  static num steelLiftDoorsAndBigPassageDoors3x5mKg = 100;
  static num aluminiumLiftDoorsAndBigPassageDoors3x5mKg = 80;
  static num woodenLiftDoorsAndBigPassageDoors3x5mKg = 70;
}

/// Lampokeskukset, keskuslammitys putket ja patterit
class CentralHeatingWeights {
  static num woodChipBoilerKg = 800;
  static num electricBoilerKg = 500;
  static num remoteHeatChangerKg = 300;
  static num waterHeaterKg = 500;
}
