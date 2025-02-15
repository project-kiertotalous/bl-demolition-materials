import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foundation_and_floors.freezed.dart';

@freezed
class FoundationAndFloors with _$FoundationAndFloors {
  const FoundationAndFloors._();

  const factory FoundationAndFloors(
      {Foundation? falsePinth,
      Foundation? crawlSpace,
      Foundation? shallow,
      Foundation? pillar,
      Foundation? hollowCoreSlab,
      @Default(false) bool bituminousWaterProofing}) = _FoundationAndFLoors;

  num? get totalArea => _allNull()
      ? null
      : (falsePinth?.area ?? 0) +
          (crawlSpace?.area ?? 0) +
          (shallow?.area ?? 0) +
          (pillar?.area ?? 0) +
          (hollowCoreSlab?.area ?? 0);

  num? get totalLength => _allNull()
      ? null
      : (falsePinth?.circumference ?? 0) +
          (crawlSpace?.circumference ?? 0) +
          (shallow?.circumference ?? 0) +
          (pillar?.circumference ?? 0) +
          (hollowCoreSlab?.circumference ?? 0);

  bool _allNull() {
    return falsePinth == null &&
        crawlSpace == null &&
        shallow == null &&
        pillar == null &&
        hollowCoreSlab == null;
  }
}
