import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data_types/material.dart';

part 'basement.freezed.dart';

@freezed
class Basement with _$Basement {
  const factory Basement(
      {required num floorArea,
      required num circumference,
      required num height,
      required Material material}) = _Basement;
}
