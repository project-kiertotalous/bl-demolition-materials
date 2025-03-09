import '../../../../bl_demolition_materials.dart';
import '../../../utils/utils.dart';
import '../../demolition_materials/foundation_and_floors_demolition_materials.dart';
import 'foundation.dart';

class PillarFoundation extends Foundation {
  @override
  final num? area;
  @override
  final num? circumference;
  @override
  final FoundationMaterial? material;

  PillarFoundation(
      {this.area,
      this.circumference,
      this.material = FoundationMaterial.concreteBlock});

  late final _reinforcedConcreteColumnColumnFoundation =
      ReinforcedConcreteColumnColumnFoundation(this);
  late final _concreteBlockColumnFoundation =
      ConcreteBlockColumnFoundation(this);
  late final _frostProofStyrofoamColumnFoundation =
      FrostProofStyrofoamColumnFoundation(this);
  late final _finnFoamColumnFoundation = FinnFoamColumnFoundation(this);
  late final _vaporBarrierPlasticColumnFoundation =
      VaporBarrierPlasticColumnFoundation(this);
  late final _woodFrameColumnFoundationGroundFloor =
      WoodFrameColumnFoundationGroundFloor(this);
  late final _solidBoardingColumnFoundationGroundFloor =
      SolidBoardingColumnFoundationGroundFloor(this);

  @override
  num? get concreteVolume => material == FoundationMaterial.concreteCasting
      ? _reinforcedConcreteColumnColumnFoundation.volume
      : 0;

  @override
  num? get concreteTons => material == FoundationMaterial.concreteCasting
      ? _reinforcedConcreteColumnColumnFoundation.concreteTons
      : 0;

  @override
  num? get rebarTons => material == FoundationMaterial.concreteCasting
      ? _reinforcedConcreteColumnColumnFoundation.steelTons
      : 0;

  @override
  num? get concreteBlockVolume => material == FoundationMaterial.concreteBlock
      ? _concreteBlockColumnFoundation.volume
      : 0;

  @override
  num? get concreteBlockTons => material == FoundationMaterial.concreteBlock
      ? _concreteBlockColumnFoundation.tons
      : 0;

  @override
  num? get mineralWoolVolume => 0;

  @override
  num? get mineralWoolTons => 0;

  @override
  num? get plasticWasteVolume => Utils.sumOrNull([
        _frostProofStyrofoamColumnFoundation.volume,
        _finnFoamColumnFoundation.volume,
        _vaporBarrierPlasticColumnFoundation.volume
      ]);

  @override
  num? get plasticWasteTons => Utils.sumOrNull([
        _frostProofStyrofoamColumnFoundation.tons,
        _finnFoamColumnFoundation.tons,
        _vaporBarrierPlasticColumnFoundation.tons
      ]);

  @override
  num? get woodShavingsVolume => 0;

  @override
  num? get woodShavingsTons => 0;

  @override
  num? get solidBoardingAndWoodFrameVolume => Utils.sumOrNull([
        _woodFrameColumnFoundationGroundFloor.volume,
        _solidBoardingColumnFoundationGroundFloor.volume
      ]);

  @override
  num? get solidBoardingAndWoodFrameTons => Utils.sumOrNull([
        _woodFrameColumnFoundationGroundFloor.tons,
        _solidBoardingColumnFoundationGroundFloor.tons
      ]);

  @override
  num? get combustibleWasteVolume => 0;

  @override
  num? get combustibleWasteTons => 0;

  @override
  num? get hotBitumenCoatingVolume => 0;

  @override
  num? get hotBitumenCoatingTons => 0;
}
