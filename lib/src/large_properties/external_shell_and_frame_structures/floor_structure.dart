import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_structure.freezed.dart';

@freezed
abstract class FloorStructure with _$FloorStructure {
  const FloorStructure._();

  const factory FloorStructure(
      {num? totalArea,
      num? chipBoardMidsolePortion,
      num? gypsumBoardingMidsolePortion,
      num? solidBoardingMidsolePortion,
      num? floorPanelFloorPortion,
      num? vinylFlooringOrTileFloorPortion,
      num? parquetFloorPortion,
      num? ceramicTileFloorPortion}) = _FloorStructure;

  num? get midsolePortionTotal => Utils.sumOrNull([
        chipBoardMidsolePortion,
        gypsumBoardingMidsolePortion,
        solidBoardingMidsolePortion
      ]);

  num? get floorPortionTotal => Utils.sumOrNull([
        floorPanelFloorPortion,
        vinylFlooringOrTileFloorPortion,
        parquetFloorPortion,
        ceramicTileFloorPortion
      ]);
}
