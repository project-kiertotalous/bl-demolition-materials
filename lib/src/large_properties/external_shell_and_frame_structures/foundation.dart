import 'package:bl_demolition_materials/src/data_types/foundation_material.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';

import '../demolition_materials/foundation_and_floors_demolition_materials.dart';

abstract class Foundation {
  num? get concreteVolume;

  num? get concreteTons;

  num? get rebarTons;

  num? get concreteBlockVolume;

  num? get concreteBlockTons;

  num? get mineralWoolVolume;

  num? get mineralWoolTons;

  num? get plasticWasteVolume;

  num? get plasticWasteTons;

  num? get woodShavingsVolume;

  num? get woodShavingsTons;

  num? get solidBoardingAndWoodFrameVolume;

  num? get solidBoardingAndWoodFrameTons;

  num? get combustibleWasteVolume;

  num? get combustibleWasteTons;

  num? get hotBitumenCoatingVolume;

  num? get hotBitumenCoatingTons;

  num? get area;

  num? get circumference;

  FoundationMaterial? get material;
}

class FalsePlinthFoundation extends Foundation {
  @override
  final num? area;
  @override
  final num? circumference;
  @override
  final FoundationMaterial? material;

  FalsePlinthFoundation(
      {this.area,
      this.circumference,
      this.material = FoundationMaterial.concreteCasting});

  late final _reinforcedConcreteColumnFalsePlinth =
      ReinforcedConcreteColumnFalsePlinth(this);
  late final _concreteBlockFalsePlinth = ConcreteBlockFalsePlinth(this);
  late final _frostProofStyrofoamFalsePlinth =
      FrostProofStyrofoamFalsePlinth(this);
  late final _finnFoamFalsePlinth = FinnFoamFalsePlinth(this);
  late final _vaporBarrierPlasticFalsePlinth =
      VaporBarrierPlasticFalsePlinth(this);
  late final _reinforcedConcreteSlabFalsePlinthGroundFloor =
      ReinforcedConcreteSlabFalsePlinthGroundFloor(this);
  late final _hotBitiumBrushingFalsePlinthGroundFloor =
      HotBitiumBrushingFalsePlinthGroundFloor(this);
  late final _mineralWoolFalsePlinthGroundFloor =
      MineralWoolFalsePlinthGroundFloor(this);
  late final _styrofoamFalsePlinthGroundFloor =
      StyrofoamFalsePlinthGroundFloor(this);
  late final _concreteCastingFalsePlinthGroundFloor =
      ConcreteCastingFalsePlinthGroundFloor(this);

  @override
  num? get concreteVolume => Utils.sumOrNull([
        _reinforcedConcreteColumnFalsePlinth.volume,
        _reinforcedConcreteSlabFalsePlinthGroundFloor.volume,
        _concreteCastingFalsePlinthGroundFloor.volume
      ]);

  @override
  num? get concreteTons => Utils.sumOrNull([
        _reinforcedConcreteColumnFalsePlinth.concreteTons,
        _reinforcedConcreteSlabFalsePlinthGroundFloor.tons,
        _concreteCastingFalsePlinthGroundFloor.concreteTons
      ]);

  @override
  num? get rebarTons => Utils.sumOrNull([
        _reinforcedConcreteColumnFalsePlinth.steelTons,
        _reinforcedConcreteSlabFalsePlinthGroundFloor.steelTons,
        _concreteCastingFalsePlinthGroundFloor.steelTons
      ]);

  @override
  num? get concreteBlockVolume => material == FoundationMaterial.concreteBlock
      ? _concreteBlockFalsePlinth.volume
      : 0;

  @override
  num? get concreteBlockTons => material == FoundationMaterial.concreteBlock
      ? _concreteBlockFalsePlinth.tons
      : 0;

  @override
  num? get mineralWoolVolume => _mineralWoolFalsePlinthGroundFloor.volume;

  @override
  num? get mineralWoolTons => _mineralWoolFalsePlinthGroundFloor.tons;

  @override
  num? get plasticWasteVolume => Utils.sumOrNull([
        _frostProofStyrofoamFalsePlinth.volume,
        _finnFoamFalsePlinth.volume,
        _vaporBarrierPlasticFalsePlinth.volume,
        _styrofoamFalsePlinthGroundFloor.volume
      ]);

  @override
  num? get plasticWasteTons => Utils.sumOrNull([
        _frostProofStyrofoamFalsePlinth.tons,
        _finnFoamFalsePlinth.tons,
        _vaporBarrierPlasticFalsePlinth.tons,
        _styrofoamFalsePlinthGroundFloor.tons
      ]);

  @override
  num? get woodShavingsVolume => 0;

  @override
  num? get woodShavingsTons => 0;

  @override
  num? get solidBoardingAndWoodFrameVolume => 0;

  @override
  num? get solidBoardingAndWoodFrameTons => 0;

  @override
  num? get combustibleWasteVolume => 0;

  @override
  num? get combustibleWasteTons => 0;

  @override
  num? get hotBitumenCoatingVolume =>
      _hotBitiumBrushingFalsePlinthGroundFloor.volume;

  @override
  num? get hotBitumenCoatingTons =>
      _hotBitiumBrushingFalsePlinthGroundFloor.tons;
}

class CrawlSpaceFoundation extends Foundation {
  @override
  final num? area;
  @override
  final num? circumference;
  @override
  final FoundationMaterial? material;

  CrawlSpaceFoundation(
      {this.area,
      this.circumference,
      this.material = FoundationMaterial.concreteCasting});

  late final _reinforcedConcreteSlabFalsePlinthGroundFloor =
      ReinforcedConcreteSlabFalsePlinthGroundFloor(this);
  late final _reinforcedConcreteColumnCrawlSpace =
      ReinforcedConcreteColumnCrawlSpace(this);
  late final _reinforcedConcreteCastFoundationCrawlSpace =
      ReinforcedConcreteCastFoundationCrawlSpace(this);
  late final _concreteBlockCrawlSpace = ConcreteBlockCrawlSpace(this);
  late final _woodShavingsCrawlSpaceGroundFloor =
      WoodShavingsCrawlSpaceGroundFloor(this);
  late final _woodFrameCrawlSpaceGroundFloor =
      WoodFrameCrawlSpaceGroundFloor(this);
  late final _solidBoardingCrawlSpaceGroundFloor =
      SolidBoardingCrawlSpaceGroundFloor(this);
  late final _constructionPaperCrawlSpaceGroundFloor =
      ConstructionPaperCrawlSpaceGroundFloor(this);
  late final _tarPaperCrawlSpaceGroundFloor =
      TarPaperCrawlSpaceGroundFloor(this);

  @override
  num? get concreteVolume => material == FoundationMaterial.concreteCasting
      ? Utils.sumOrNull([
          _reinforcedConcreteColumnCrawlSpace.volume,
          _reinforcedConcreteCastFoundationCrawlSpace.volume
        ])
      : 0;

  @override
  num? get concreteTons => Utils.sumOrNull([
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteSlabFalsePlinthGroundFloor.concreteTons
            : null,
        _reinforcedConcreteSlabFalsePlinthGroundFloor.tons,
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteCastFoundationCrawlSpace.tons
            : null,
      ]);

  @override
  num? get rebarTons => _reinforcedConcreteColumnCrawlSpace.steelTons;

  @override
  num? get concreteBlockVolume => material == FoundationMaterial.concreteBlock
      ? _concreteBlockCrawlSpace.volume
      : 0;

  @override
  num? get concreteBlockTons => material == FoundationMaterial.concreteBlock
      ? _concreteBlockCrawlSpace.tons
      : 0;

  @override
  num? get mineralWoolVolume => 0;

  @override
  num? get mineralWoolTons => 0;

  @override
  num? get plasticWasteVolume => 0;

  @override
  num? get plasticWasteTons => 0;

  @override
  num? get woodShavingsVolume => _woodShavingsCrawlSpaceGroundFloor.volume;

  @override
  num? get woodShavingsTons => _woodShavingsCrawlSpaceGroundFloor.tons;

  @override
  num? get solidBoardingAndWoodFrameVolume => Utils.sumOrNull([
        _woodFrameCrawlSpaceGroundFloor.volume,
        _solidBoardingCrawlSpaceGroundFloor.volume,
      ]);

  @override
  num? get solidBoardingAndWoodFrameTons => Utils.sumOrNull([
        _woodFrameCrawlSpaceGroundFloor.tons,
        _solidBoardingCrawlSpaceGroundFloor.tons,
      ]);

  @override
  num? get combustibleWasteVolume => Utils.sumOrNull([
        _constructionPaperCrawlSpaceGroundFloor.volume,
        _tarPaperCrawlSpaceGroundFloor.volume,
      ]);

  @override
  num? get combustibleWasteTons => Utils.sumOrNull([
        _constructionPaperCrawlSpaceGroundFloor.tons,
        _tarPaperCrawlSpaceGroundFloor.tons,
      ]);

  @override
  num? get hotBitumenCoatingVolume => 0;

  @override
  num? get hotBitumenCoatingTons => 0;
}

class ShallowFoundation extends Foundation {
  @override
  final num? area;
  @override
  final num? circumference;

  ShallowFoundation({this.area, this.circumference});

  late final _frostProofStyrofoamShallowFoundation =
      FrostProofStyrofoamShallowFoundation(this);
  late final _finnFoamShallowFoundation = FinnFoamShallowFoundation(this);
  late final _vaporBarrierPlasticShallowFoundation =
      VaporBarrierPlasticShallowFoundation(this);
  late final _reinforcedConcreteSlabShallowFoundationGroundFloor =
      ReinforcedConcreteSlabShallowFoundationGroundFloor(this);
  late final _hotBitiumBrushingShallowFoundationGroundFloor =
      HotBitiumBrushingShallowFoundationGroundFloor(this);
  late final _mineralWoolShallowFoundationGroundFloor =
      MineralWoolShallowFoundationGroundFloor(this);
  late final _styrofoamShallowFoundationGroundFloor =
      StyrofoamShallowFoundationGroundFloor(this);
  late final _reinforcedConcreteColumnColumnFoundation =
      ReinforcedConcreteColumnColumnFoundation(this);

  @override
  num? get concreteVolume => Utils.sumOrNull([
        _reinforcedConcreteSlabShallowFoundationGroundFloor.volume,
        _reinforcedConcreteColumnColumnFoundation.volume
      ]);

  @override
  num? get concreteTons => Utils.sumOrNull([
        _reinforcedConcreteSlabShallowFoundationGroundFloor.concreteTons,
        _reinforcedConcreteColumnColumnFoundation.concreteTons
      ]);

  @override
  num? get rebarTons => Utils.sumOrNull([
        _reinforcedConcreteSlabShallowFoundationGroundFloor.steelTons,
        _reinforcedConcreteColumnColumnFoundation.steelTons
      ]);

  @override
  num? get concreteBlockVolume => 0;

  @override
  num? get concreteBlockTons => 0;

  @override
  num? get mineralWoolVolume => _mineralWoolShallowFoundationGroundFloor.volume;

  @override
  num? get mineralWoolTons => _mineralWoolShallowFoundationGroundFloor.tons;

  @override
  num? get plasticWasteVolume => Utils.sumOrNull([
        _frostProofStyrofoamShallowFoundation.volume,
        _finnFoamShallowFoundation.volume,
        _vaporBarrierPlasticShallowFoundation.volume,
        _styrofoamShallowFoundationGroundFloor.volume
      ]);

  @override
  num? get plasticWasteTons => Utils.sumOrNull([
        _frostProofStyrofoamShallowFoundation.tons,
        _finnFoamShallowFoundation.tons,
        _vaporBarrierPlasticShallowFoundation.tons,
        _styrofoamShallowFoundationGroundFloor.tons
      ]);

  @override
  num? get woodShavingsVolume => 0;

  @override
  num? get woodShavingsTons => 0;

  @override
  num? get solidBoardingAndWoodFrameVolume => 0;

  @override
  num? get solidBoardingAndWoodFrameTons => 0;

  @override
  num? get combustibleWasteVolume => 0;

  @override
  num? get combustibleWasteTons => 0;

  @override
  num? get hotBitumenCoatingVolume =>
      _hotBitiumBrushingShallowFoundationGroundFloor.volume;

  @override
  num? get hotBitumenCoatingTons =>
      _hotBitiumBrushingShallowFoundationGroundFloor.tons;

  @override
  FoundationMaterial? get material => null;
}

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

class HollowCoreSlabFoundation extends Foundation {
  @override
  final num? area;
  @override
  final num? circumference;
  @override
  final FoundationMaterial? material;

  HollowCoreSlabFoundation(
      {this.area,
      this.circumference,
      this.material = FoundationMaterial.concreteBlock});

  late final _reinforcedConcreteColumnHollowCoreSlabFoundation =
      ReinforcedConcreteColumnHollowCoreSlabFoundation(this);
  late final _concreteBlockHollowCoreSlabFoundation =
      ConcreteBlockHollowCoreSlabFoundation(this);
  late final _frostProofStyrofoamHollowCoreSlabFoundation =
      FrostProofStyrofoamHollowCoreSlabFoundation(this);
  late final _finnFoamHollowCoreSlabFoundation =
      FinnFoamHollowCoreSlabFoundation(this);
  late final _vaporBarrierPlasticHollowCoreSlabFoundation =
      VaporBarrierPlasticHollowCoreSlabFoundation(this);
  late final _hollowCoreSlabHollowCoreSlabFoundationGroundFloor =
      HollowCoreSlabHollowCoreSlabFoundationGroundFloor(this);
  late final _hotBitiumBrushingHollowCoreSlabFoundationGroundFloor =
      HotBitiumBrushingHollowCoreSlabFoundationGroundFloor(this);
  late final _mineralWoolHollowCoreSlabFoundationGroundFloor =
      MineralWoolHollowCoreSlabFoundationGroundFloor(this);
  late final _styrofoamHollowCoreSlabFoundationGroundFloor =
      StyrofoamHollowCoreSlabFoundationGroundFloor(this);
  late final _concreteCastingHollowCoreSlabFoundationGroundFloor =
      ConcreteCastingHollowCoreSlabFoundationGroundFloor(this);

  @override
  num? get concreteVolume => Utils.sumOrNull([
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteColumnHollowCoreSlabFoundation.volume
            : null,
        _hollowCoreSlabHollowCoreSlabFoundationGroundFloor.volume,
        _concreteCastingHollowCoreSlabFoundationGroundFloor.volume
      ]);

  @override
  num? get concreteTons => Utils.sumOrNull([
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteColumnHollowCoreSlabFoundation.concreteTons
            : null,
        _hollowCoreSlabHollowCoreSlabFoundationGroundFloor.concreteTons,
        _concreteCastingHollowCoreSlabFoundationGroundFloor.concreteTons
      ]);

  @override
  num? get rebarTons => Utils.sumOrNull([
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteColumnHollowCoreSlabFoundation.steelTons
            : null,
        _concreteCastingHollowCoreSlabFoundationGroundFloor.steelTons
      ]);

  @override
  num? get concreteBlockVolume => material == FoundationMaterial.concreteCasting
      ? _concreteBlockHollowCoreSlabFoundation.volume
      : 0;

  @override
  num? get concreteBlockTons => material == FoundationMaterial.concreteCasting
      ? _concreteBlockHollowCoreSlabFoundation.tons
      : 0;

  @override
  num? get mineralWoolVolume =>
      _mineralWoolHollowCoreSlabFoundationGroundFloor.volume;

  @override
  num? get mineralWoolTons =>
      _mineralWoolHollowCoreSlabFoundationGroundFloor.tons;

  @override
  num? get plasticWasteVolume => Utils.sumOrNull([
        _frostProofStyrofoamHollowCoreSlabFoundation.volume,
        _finnFoamHollowCoreSlabFoundation.volume,
        _vaporBarrierPlasticHollowCoreSlabFoundation.volume,
        _styrofoamHollowCoreSlabFoundationGroundFloor.volume
      ]);

  @override
  num? get plasticWasteTons => Utils.sumOrNull([
        _frostProofStyrofoamHollowCoreSlabFoundation.tons,
        _finnFoamHollowCoreSlabFoundation.tons,
        _vaporBarrierPlasticHollowCoreSlabFoundation.tons,
        _styrofoamHollowCoreSlabFoundationGroundFloor.tons
      ]);

  @override
  num? get woodShavingsVolume => 0;

  @override
  num? get woodShavingsTons => 0;

  @override
  num? get solidBoardingAndWoodFrameVolume => 0;

  @override
  num? get solidBoardingAndWoodFrameTons => 0;

  @override
  num? get combustibleWasteVolume => 0;

  @override
  num? get combustibleWasteTons => 0;

  @override
  num? get hotBitumenCoatingVolume =>
      _hotBitiumBrushingHollowCoreSlabFoundationGroundFloor.volume;

  @override
  num? get hotBitumenCoatingTons =>
      _hotBitiumBrushingHollowCoreSlabFoundationGroundFloor.tons;
}
