import 'package:bl_demolition_materials/src/data_types/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foundation.freezed.dart';

@freezed
class Foundation with _$Foundation {
  const Foundation._();

  const factory Foundation(
      {required num area,
      required num circumference,
      Material? material}) = _Foundation;
}
