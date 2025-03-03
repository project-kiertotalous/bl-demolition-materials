import 'package:bl_demolition_materials/src/large_properties/demolition_materials/demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/roof.dart';
import 'package:bl_demolition_materials/src/large_properties/material_info.dart';

// Kattotyypit

//Harja- ja aumakattorunko

// Kattoristikot, puu
class WoodenTrussRidgeOrGableRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  WoodenTrussRidgeOrGableRoof([this.roof, this.sizing = 700]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights
          .gableAndPentRoofWithWoodenLatticeKgPerSqm /
      800 *
      sizing;

  @override
  num get kgPerCubicMeter => UpperBaseStructureAndWaterRoofWeights
      .gableAndPentRoofWithWoodenLatticeKgPerCbm;

  @override
  num get woodVolume =>
      kgPerSquareMeter * roof.ceilingArea / kgPerCubicMeter; // * O7 TODO

  @override
  num get woodTons => kgPerSquareMeter * roof.ceilingArea / 1000; // * O7 TODO
}

// Kattoristikot, teras
class SteelTrussRidgeOrGableRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  SteelTrussRidgeOrGableRoof([this.roof, this.sizing = 800]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights
          .gableAndPentRoofWithSteelLatticeKgPerSqm /
      800 *
      sizing;

  @override
  num get steelTons => kgPerSquareMeter * roof.ceilingArea / 1000; // * O8 TODO
}

// Betonipalkki
class ConcreteColumnRidgeOrGableRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  ConcreteColumnRidgeOrGableRoof([this.roof, this.sizing = 250]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.ferroConcreteBarKgPerSqm /
      250 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.ferroConcreteBarKgPerCbm;

  @override
  num get concreteVolume =>
      kgPerSquareMeter * roof.ceilingArea / kgPerCubicMeter; // * O9 TODO

  @override
  num get concreteTons =>
      kgPerSquareMeter * roof.ceilingArea / 1000; // * O9 TODO
}

// Katon kannatinniskat, 50x150, oletusväli 3000mm
class RoofBracketsRidgeOrGableRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  RoofBracketsRidgeOrGableRoof([this.roof, this.sizing = 3000]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodenTrunk50x150mmKgPerSqm /
      3000 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodenTrunk50x150mmKgPerCbm;

  @override
  num get woodVolume =>
      kgPerSquareMeter * roof.lowerCeilingArea / kgPerCubicMeter; // * O10 TODO

  @override
  num get concreteTons =>
      kgPerSquareMeter * roof.ceilingArea / 1000; // * O10 TODO
}

// Tasakatto ja pulpettikattorunko

// Kattoristikot, puu
class WoodenTrussFlatOrMonoPitchedRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  WoodenTrussFlatOrMonoPitchedRoof([this.roof, this.sizing = 800]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights
          .flatAndPentRoofWithWoodenLatticeKgPerSqm /
      800 *
      sizing;

  @override
  num get kgPerCubicMeter => UpperBaseStructureAndWaterRoofWeights
      .flatAndPentRoofWithWoodenLatticeKgPerCbm;

  @override
  num get woodVolume => kgPerSquareMeter; // TODO

  @override
  num get woodTons => kgPerSquareMeter; // TODO
}

// Kattoristikot, teras
class SteelTrussFlatOrMonoPitchedRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  SteelTrussFlatOrMonoPitchedRoof([this.roof, this.sizing = 800]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights
          .flatAndPentRoofWithSteelLatticeKgPerSqm /
      800 *
      sizing;

  @override
  num get steelTons => kgPerSquareMeter; // * E12 / 1000 * O16 TODO
}

// Betonipalkki
class ConcreteColumnFlatOrMonoPitchedRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  ConcreteColumnFlatOrMonoPitchedRoof([this.roof, this.sizing = 250]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.ferroConcreteBarKgPerSqm /
      250 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.ferroConcreteBarKgPerCbm;

  @override
  num get concreteVolume =>
      kgPerSquareMeter; // * E12 / kgPerCubicMeter * O17 TODO

  @override
  num get concreteTons => kgPerSquareMeter; // * E12 / 1000 * O17 TODO
}

// Katon kannatinniskat, 50x150, oletusväli 3000mm
class RoofBracketsFlatOrMonoPitchedRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  RoofBracketsFlatOrMonoPitchedRoof([this.roof, this.sizing = 3000]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodenTrunk50x150mmKgPerSqm /
      3000 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodenTrunk50x150mmKgPerCbm;

  @override
  num get woodVolume =>
      kgPerSquareMeter * roof.lowerCeilingArea / kgPerCubicMeter; // * O18 TODO

  @override
  num get woodTons => 0; // TODO
}

// Vesikatto

// Puurakenteinen aluslaudoitus kg/m2
class WoodenUnderPlankingWaterRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  WoodenUnderPlankingWaterRoof([this.roof, this.sizing = 16]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerSqm / 16 * sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerCbm;

  @override
  num get woodVolume =>
      kgPerSquareMeter; // * (E12 + roof.ceilingArea) / kgPerCubicMeter TODO

  @override
  num get woodTons =>
      kgPerSquareMeter; // * (E12 + roof.ceilingArea) / 1000 TODO
}

// Tuulensuojavilla 30mm
class WindProofWoolWaterRoof extends DemolitionMaterials {
  final num sizing;
  final Roof? roof;

  WindProofWoolWaterRoof([this.roof, this.sizing = 30]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.windProofWool30mmKgPerSqm /
      30 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.windProofWool30mmKgPerCbm /
      30 *
      sizing;

  @override
  num get volume =>
      kgPerSquareMeter; // * (E12 + roof.ceilingArea) / kgPerCubicMeter TODO

  @override
  num get tons => kgPerSquareMeter; // * (E12 + roof.ceilingArea) / 1000 TODO
}

// Aluskate
class UnderLayWaterRoof extends DemolitionMaterials {
  final Roof? roof;

  UnderLayWaterRoof([this.roof]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.vaporBarrierKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.vaporBarrierKgPerCbm;

  @override
  num get volume =>
      kgPerSquareMeter; // * (E12 + roof.ceilingArea) / kgPerCubicMeter TODO

  @override
  num get tons => kgPerSquareMeter; // * (E12 + roof.ceilingArea) / 1000 TODO
}

// Kattopelti
class RoofSheetWaterRoof extends DemolitionMaterials {
  final Roof? roof;

  RoofSheetWaterRoof([this.roof]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.roofSheet06mmKgPerSqm;

  @override
  num get steelTons =>
      kgPerSquareMeter; // =(F$24*D$3*O24+F$24*E$12*P24)/1000 TODO
}

// Huopakatto
class FeltRoofWaterRoof extends DemolitionMaterials {
  final Roof? roof;

  FeltRoofWaterRoof([this.roof]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.feltRoofBitumenKermiKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.feltRoofBitumenKermiKgPerCbm;

  @override
  num get volume => kgPerSquareMeter; // =(F25*D$3*O25+F25*E$12*P25)/G25 TODO

  @override
  num get tons => kgPerSquareMeter; // =(F25*D$3*O25+F25*E$12*P25)/1000 TODO
}

//Mineriittikate

class MineriteCoveringWaterRoof extends DemolitionMaterials {
  final Roof? roof;

  MineriteCoveringWaterRoof([this.roof]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.mineriteCoveringKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.mineriteCoveringKgPerCbm;

  @override
  num get volume => kgPerSquareMeter; // =(F26*D$3*O26+F26*E$12*P26)/G26 TODO

  @override
  num get tons => kgPerSquareMeter; // =(F26*D$3*O26+F26*E$12*P26)/1000 TODO
}

// Kattotiili
class RoofTileWaterRoof extends DemolitionMaterials {
  final Roof? roof;

  RoofTileWaterRoof([this.roof]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.roofTileKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.roofTileKgPerCbm;

  @override
  num get volume => kgPerSquareMeter; // =(F27*D$3*O27+F27*E$12*P27)/G27 TODO

  @override
  num get tons => kgPerSquareMeter; // =(F27*D$3*O27+F27*E$12*P27)/1000 TODO
}
