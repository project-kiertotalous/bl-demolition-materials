import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data_types/material.dart';

part 'cellar.freezed.dart';

@freezed
class Cellar with _$Cellar {
  const factory Cellar(
      {num? floorArea,
      num? exteriorWallsPerimeter,
      num? wallHeight,
      Material? exteriorWallsMaterial}) = _Cellar;
}
