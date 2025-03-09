import 'package:freezed_annotation/freezed_annotation.dart';

part 'large_property_evaluation_info.freezed.dart';

@freezed
abstract class LargePropertyEvaluationInfo with _$LargePropertyEvaluationInfo {
  const factory LargePropertyEvaluationInfo(
      {String? propertyName,
      String? buildingType,
      String? address,
      String? municipality,
      String? author,
      DateTime? date,
      DateTime? version,
      String? description}) = _LargePropertyEvaluationInfo;
}
