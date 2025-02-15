import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_structure.freezed.dart';

@freezed
class FloorStructure with _$FloorStructure {
  const FloorStructure._();

  const factory FloorStructure(
      {required num totalArea,
      required num particleBoardingMidsolePortion,
      required num gypsumBoardingMidsolePortion,
      required num solidBoardingMidsolePortion,
      required num floorPanelFloorPortion,
      required num vinylFlooringOrTileFloorPortion,
      required num parquetFloorPortion,
      required num ceramicTileFloorPortion}) = _FloorStructure;

  num get midsolePortionTotal =>
      particleBoardingMidsolePortion +
      gypsumBoardingMidsolePortion +
      solidBoardingMidsolePortion;

  num get floorPortionTotal =>
      floorPanelFloorPortion +
      vinylFlooringOrTileFloorPortion +
      parquetFloorPortion +
      ceramicTileFloorPortion;
}
