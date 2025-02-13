import 'package:bl_demolition_materials/bl_demolition_materials.dart';
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

  SquareMeter get totalArea => SquareMeter(falsePinth.area.area +
      crawlSpace.areaValue +
      shallow.areaValue +
      pillar.areaValue +
      hollowCoreSlab.areaValue);

  Length get totalLength => Length.fromMeters(falsePinth.circumference.meters +
      crawlSpace.circumference.meters +
      shallow.circumference.meters +
      pillar.circumference.meters +
      hollowCoreSlab.circumference.meters);
}
