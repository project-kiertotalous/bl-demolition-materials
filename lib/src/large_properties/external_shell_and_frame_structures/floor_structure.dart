import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';

part 'floor_structure.freezed.dart';

part 'floor_structure.g.dart';

@freezed
abstract class FloorStructure with _$FloorStructure {
  const FloorStructure._();

  const factory FloorStructure(
      {num? totalArea,
      num? chipBoardMidsolePortion,
      num? gypsumBoardingMidsolePortion,
      num? solidBoardingMidsolePortion,
      num? floorPanelFloorPortion,
      num? plasticCarpetOrPlasticTileFloorPortion,
      num? parquetFloorPortion,
      num? ceramicTileFloorPortion}) = _FloorStructure;

  factory FloorStructure.fromJson(Map<String, dynamic> json) =>
      _$FloorStructureFromJson(json);

  num? get midsolePortionTotal => Utils.sumOrNull([
        chipBoardMidsolePortion,
        gypsumBoardingMidsolePortion,
        solidBoardingMidsolePortion
      ]);

  num? get floorPortionTotal => Utils.sumOrNull([
        floorPanelFloorPortion,
        plasticCarpetOrPlasticTileFloorPortion,
        parquetFloorPortion,
        ceramicTileFloorPortion
      ]);
}
