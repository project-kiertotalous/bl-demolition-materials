import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/foundation.dart';
import 'package:bl_demolition_materials/src/utils/arithmetics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foundation_and_floors.freezed.dart';

@freezed
class FoundationAndFloors with _$FoundationAndFloors {
  const FoundationAndFloors._();

  const factory FoundationAndFloors(
      {FalsePlinthFoundation? falsePlinth,
      CrawlSpaceFoundation? crawlSpace,
      ShallowFoundation? shallow,
      PillarFoundation? pillar,
      HollowCoreSlabFoundation? hollowCoreSlab,
      @Default(false) bool bituminousWaterProofing}) = _FoundationAndFLoors;

  num? get totalArea => Arithmetics.sumOrNull([
        falsePlinth?.area,
        crawlSpace?.area,
        shallow?.area,
        pillar?.area,
        hollowCoreSlab?.area
      ]);

  num? get totalLength => Arithmetics.sumOrNull([
        falsePlinth?.circumference,
        crawlSpace?.circumference,
        shallow?.circumference,
        pillar?.circumference,
        hollowCoreSlab?.circumference
      ]);
}
