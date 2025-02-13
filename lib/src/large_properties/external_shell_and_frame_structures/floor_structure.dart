import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_structure.freezed.dart';

@freezed
class FloorStructure with _$FloorStructure {
  const factory FloorStructure(
      {required num totalArea,
      required num particleBoardingMidsolePortion,
      required num gypsumBoardingMidsolePortion,
      required num solidBoardingMidsolePortion,
      required num floorPanelTotalPortion,
      required num vinylFlooringOrTileTotalPortion,
      required num parquetTotalPortion,
      required num ceramicTileTotalPortion}) = _FloorStructure;
}
