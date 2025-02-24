import 'package:bl_demolition_materials/src/large_properties/demolition_materials/cellar_demolition_materials.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data_types/cellar_exterior_material.dart';

part 'cellar.freezed.dart';

@freezed
class Cellar with _$Cellar {
  late final _reinforcedConcreteSlabGroundFloor =
      ReinforcedConcreteSlabGroundFloor(this);
  late final _hotBitiumBrushingGroundFloor =
      ReinforcedConcreteSlabGroundFloor(this);
  late final _mineralWoolGroundFloor = ReinforcedConcreteSlabGroundFloor(this);
  late final _styroxGroundFloor = ReinforcedConcreteSlabGroundFloor(this);
  late final _concreteCastingGroundFloor =
      ReinforcedConcreteSlabGroundFloor(this);
  late final _vaporBarrierPlasticGroundFloor =
      ReinforcedConcreteSlabGroundFloor(this);
  late final _frostProofStyroxInsulation =
      ReinforcedConcreteSlabGroundFloor(this);
  late final _styroxInsulation = ReinforcedConcreteSlabGroundFloor(this);
  late final _finnFoamInsulation = ReinforcedConcreteSlabGroundFloor(this);
  late final _vaporBarrierPlasticInsulation =
      ReinforcedConcreteSlabGroundFloor(this);
  late final _hotBitumenCoatingInsulation =
      ReinforcedConcreteSlabGroundFloor(this);
  late final _concreteCastingWalls = ReinforcedConcreteSlabGroundFloor(this);
  late final _brickWalls = ReinforcedConcreteSlabGroundFloor(this);
  late final _brickWallInnerFiller = ReinforcedConcreteSlabGroundFloor(this);
  late final _lightweightConcreteBlockWalls =
      ReinforcedConcreteSlabGroundFloor(this);
  late final _plasteringInteriorAndExteriorWalls =
      ReinforcedConcreteSlabGroundFloor(this);

  Cellar._();

  factory Cellar(
      {num? floorArea,
      num? exteriorWallsPerimeter,
      num? wallHeight,
      CellarExteriorMaterial? exteriorWallsMaterial}) = _Cellar;

  num? get concreteDemolitionVolume => Utils.sumOrNull([
        _reinforcedConcreteSlabGroundFloor.volume,
        _concreteCastingGroundFloor.volume,
        _concreteCastingWalls.volume,
        _brickWallInnerFiller.volume,
        _plasteringInteriorAndExteriorWalls.volume
      ]);

  num? get concreteDemolitionTons => Utils.sumOrNull([
        _reinforcedConcreteSlabGroundFloor.concreteTons,
        _concreteCastingGroundFloor.concreteTons,
        _concreteCastingWalls.concreteTons,
        _brickWallInnerFiller.tons,
        _plasteringInteriorAndExteriorWalls.tons
      ]);

  num? get rebarTons => Utils.sumOrNull([
        _reinforcedConcreteSlabGroundFloor.steelTons,
        _concreteCastingGroundFloor.steelTons,
        _concreteCastingWalls.steelTons
      ]);

  num? get brickVolume => _brickWalls.volume;

  num? get brickTons => _brickWalls.tons;

  num? get blockVolume => _lightweightConcreteBlockWalls.volume;

  num? get blockTons => _lightweightConcreteBlockWalls.tons;

  num? get glassAndMineralWoolInsulationVolume =>
      _mineralWoolGroundFloor.volume;

  num? get glassAndMineralWoolInsulationTons => _mineralWoolGroundFloor.tons;

  num? get plasticWasteVolume => Utils.sumOrNull([
        _styroxGroundFloor.volume,
        _vaporBarrierPlasticGroundFloor.volume,
        _frostProofStyroxInsulation.volume,
        _styroxInsulation.volume,
        _finnFoamInsulation.volume,
        _vaporBarrierPlasticInsulation.volume
      ]);

  num? get plasticWasteTons => Utils.sumOrNull([
        _styroxGroundFloor.tons,
        _vaporBarrierPlasticGroundFloor.tons,
        _frostProofStyroxInsulation.tons,
        _styroxInsulation.tons,
        _finnFoamInsulation.tons,
        _vaporBarrierPlasticInsulation.tons
      ]);

  num? get hotBitumenCoatingVolume => Utils.sumOrNull([
        _hotBitiumBrushingGroundFloor.volume,
        _hotBitumenCoatingInsulation.volume
      ]);

  num? get hotBitumenCoatingTons => Utils.sumOrNull(
      [_hotBitiumBrushingGroundFloor.tons, _hotBitumenCoatingInsulation.tons]);
}
