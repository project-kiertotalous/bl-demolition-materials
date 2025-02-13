import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor_material.freezed.dart';

@freezed
class FloorMaterial with _$FloorMaterial {
  const factory FloorMaterial(
      {required num floorPanelPortion,
      required num vinylFlooringOrTilingPortion,
      required num parquetPortion,
      required num ceramicTilePortion}) = _FloorMaterial;
}
