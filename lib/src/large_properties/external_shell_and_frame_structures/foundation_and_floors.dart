import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foundation_and_floors.freezed.dart';

@freezed
class FoundationAndFloors with _$FoundationAndFloors {
  const FoundationAndFloors._();

  const factory FoundationAndFloors(
      {required Foundation falsePinth,
      required Foundation crawlSpace,
      required Foundation shallow,
      required Foundation pillar,
      required Foundation hollowCoreSlab}) = _FoundationAndFLoors;

  num get totalArea =>
      falsePinth.area +
      crawlSpace.area +
      shallow.area +
      pillar.area +
      hollowCoreSlab.area;

  num get totalLength =>
      falsePinth.circumference +
      crawlSpace.circumference +
      shallow.circumference +
      pillar.circumference +
      hollowCoreSlab.circumference;
}
