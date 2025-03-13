import 'package:freezed_annotation/freezed_annotation.dart';

part 'partition_walls_demolition_materials.freezed.dart';

// Valiseinat, ikkunat ja ovet

// Sisaseinien rungot ja pintamateriaalit
@freezed
class InternalWallFramesAndSurfaceMaterial
    with _$InternalWallFramesAndSurfaceMaterial {
  const InternalWallFramesAndSurfaceMaterial._();

  const factory InternalWallFramesAndSurfaceMaterial({
    //Sisaseinien kokonaispituus sisaltaa kaikki huonetilat mukaan lukien aulat, WC, pukuhuone, pesutilat jne.
    num? overallLengthOfInternalWallsAllFloors,
    num? averageHeightOfInternalWalls,
  }) = _InternalWallFramesAndSurfaceMaterial;

  num? get totalArea {
    if (overallLengthOfInternalWallsAllFloors == null ||
        averageHeightOfInternalWalls == null) {
      return null;
    }
    return overallLengthOfInternalWallsAllFloors! *
        averageHeightOfInternalWalls!;
  }
}
