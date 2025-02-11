import 'package:freezed_annotation/freezed_annotation.dart';

part 'large_property_evaluation_info.freezed.dart';

@freezed
class LargePropertyEvaluationInfo with _$LargePropertyEvaluationInfo {
  const factory LargePropertyEvaluationInfo({required String propertyName,
    required String buildingType,
    required String address,
    required String municipality,
    required String author,
    required DateTime date,
    required DateTime version,
    required String description}) = _LargePropertyEvaluationInfo;
}
