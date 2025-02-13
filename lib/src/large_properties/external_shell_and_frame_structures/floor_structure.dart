import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_structure.freezed.dart';

@freezed
class FloorStructure with _$FloorStructure {
  const factory FloorStructure(
      {required num totalArea,
      required num particleBoardingPortion,
      required num gypsumBoardingPortion,
      required num solidBoardingPortion}) = _FloorStructure;
}
