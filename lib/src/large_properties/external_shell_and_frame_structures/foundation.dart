import 'package:bl_demolition_materials/src/data_types/foundation_material.dart';

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

  num? get solidBoardingAndWoodFrameTons;

  num? get solidBoardingAndWoodFrameVolume;

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

  @override
  num? get concreteVolume => throw UnimplementedError();

  @override
  num? get concreteTons => throw UnimplementedError();

  @override
  num? get rebarTons => throw UnimplementedError();

  @override
  num? get concreteBlockVolume => throw UnimplementedError();

  @override
  num? get concreteBlockTons => throw UnimplementedError();

  @override
  num? get mineralWoolVolume => throw UnimplementedError();

  @override
  num? get mineralWoolTons => throw UnimplementedError();

  @override
  num? get plasticWasteVolume => throw UnimplementedError();

  @override
  num? get plasticWasteTons => throw UnimplementedError();

  @override
  num? get woodShavingsVolume => throw UnimplementedError();

  @override
  num? get woodShavingsTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteTons => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingVolume => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingTons => throw UnimplementedError();
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

  @override
  num? get concreteVolume => throw UnimplementedError();

  @override
  num? get concreteTons => throw UnimplementedError();

  @override
  num? get rebarTons => throw UnimplementedError();

  @override
  num? get concreteBlockVolume => throw UnimplementedError();

  @override
  num? get concreteBlockTons => throw UnimplementedError();

  @override
  num? get mineralWoolVolume => throw UnimplementedError();

  @override
  num? get mineralWoolTons => throw UnimplementedError();

  @override
  num? get plasticWasteVolume => throw UnimplementedError();

  @override
  num? get plasticWasteTons => throw UnimplementedError();

  @override
  num? get woodShavingsVolume => throw UnimplementedError();

  @override
  num? get woodShavingsTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteTons => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingVolume => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingTons => throw UnimplementedError();
}

class ShallowFoundation extends Foundation {
  @override
  final num? area;
  @override
  final num? circumference;

  ShallowFoundation({this.area, this.circumference});

  @override
  num? get concreteVolume => throw UnimplementedError();

  @override
  num? get concreteTons => throw UnimplementedError();

  @override
  num? get rebarTons => throw UnimplementedError();

  @override
  num? get concreteBlockVolume => throw UnimplementedError();

  @override
  num? get concreteBlockTons => throw UnimplementedError();

  @override
  num? get mineralWoolVolume => throw UnimplementedError();

  @override
  num? get mineralWoolTons => throw UnimplementedError();

  @override
  num? get plasticWasteVolume => throw UnimplementedError();

  @override
  num? get plasticWasteTons => throw UnimplementedError();

  @override
  num? get woodShavingsVolume => throw UnimplementedError();

  @override
  num? get woodShavingsTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteTons => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingVolume => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingTons => throw UnimplementedError();

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

  @override
  num? get concreteVolume => throw UnimplementedError();

  @override
  num? get concreteTons => throw UnimplementedError();

  @override
  num? get rebarTons => throw UnimplementedError();

  @override
  num? get concreteBlockVolume => throw UnimplementedError();

  @override
  num? get concreteBlockTons => throw UnimplementedError();

  @override
  num? get mineralWoolVolume => throw UnimplementedError();

  @override
  num? get mineralWoolTons => throw UnimplementedError();

  @override
  num? get plasticWasteVolume => throw UnimplementedError();

  @override
  num? get plasticWasteTons => throw UnimplementedError();

  @override
  num? get woodShavingsVolume => throw UnimplementedError();

  @override
  num? get woodShavingsTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteTons => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingVolume => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingTons => throw UnimplementedError();
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

  @override
  num? get concreteVolume => throw UnimplementedError();

  @override
  num? get concreteTons => throw UnimplementedError();

  @override
  num? get rebarTons => throw UnimplementedError();

  @override
  num? get concreteBlockVolume => throw UnimplementedError();

  @override
  num? get concreteBlockTons => throw UnimplementedError();

  @override
  num? get mineralWoolVolume => throw UnimplementedError();

  @override
  num? get mineralWoolTons => throw UnimplementedError();

  @override
  num? get plasticWasteVolume => throw UnimplementedError();

  @override
  num? get plasticWasteTons => throw UnimplementedError();

  @override
  num? get woodShavingsVolume => throw UnimplementedError();

  @override
  num? get woodShavingsTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameTons => throw UnimplementedError();

  @override
  num? get solidBoardingAndWoodFrameVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteVolume => throw UnimplementedError();

  @override
  num? get combustibleWasteTons => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingVolume => throw UnimplementedError();

  @override
  num? get hotBitumenCoatingTons => throw UnimplementedError();
}
