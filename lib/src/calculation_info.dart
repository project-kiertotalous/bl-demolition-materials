import 'package:equatable/equatable.dart';

/// Holds basic information or metadata related to evaluation the demolition
/// materials for a building.
///
/// [SmallPropertyEvaluationInfo] should be used when evaluating a terraced or
/// small apartment building. Use [LargePropertyEvaluationInfo] otherwise.
sealed class EvaluationInfo extends Equatable {
  final String propertyName;
  final String buildingType;
  final String address;

  EvaluationInfo(
      {required this.propertyName,
      required this.buildingType,
      required this.address});

  EvaluationInfo copyWith();

  @override
  List<Object> get props => [propertyName, buildingType, address];

  @override
  String toString() {
    return '${this.runtimeType.toString()}@${address.replaceAll(' ', '')}';
  }
}

class SmallPropertyEvaluationInfo extends EvaluationInfo {
  final bool hazardousSubstanceSurveyDone;

  SmallPropertyEvaluationInfo(
      {required super.propertyName,
      required super.buildingType,
      required super.address,
      required this.hazardousSubstanceSurveyDone});

  @override
  SmallPropertyEvaluationInfo copyWith({
    String? propertyName,
    String? buildingType,
    String? address,
    bool? hazardousSubstanceSurveyDone,
  }) {
    return SmallPropertyEvaluationInfo(
      propertyName: propertyName ?? this.propertyName,
      buildingType: buildingType ?? this.buildingType,
      address: address ?? this.address,
      hazardousSubstanceSurveyDone:
          hazardousSubstanceSurveyDone ?? this.hazardousSubstanceSurveyDone,
    );
  }

  @override
  List<Object> get props =>
      [propertyName, buildingType, address, hazardousSubstanceSurveyDone];
}

class LargePropertyEvaluationInfo extends EvaluationInfo {
  final String municipality;
  final String author;
  final DateTime date;
  final DateTime version;
  final String description;

  LargePropertyEvaluationInfo(
      {required super.propertyName,
      required super.buildingType,
      required super.address,
      required this.municipality,
      required this.author,
      required this.date,
      required this.version,
      required this.description});

  @override
  LargePropertyEvaluationInfo copyWith(
      {String? propertyName,
      String? buildingType,
      String? address,
      String? municipality,
      String? author,
      DateTime? date,
      DateTime? version,
      String? description}) {
    return LargePropertyEvaluationInfo(
      propertyName: propertyName ?? this.propertyName,
      buildingType: buildingType ?? this.buildingType,
      address: address ?? this.address,
      municipality: municipality ?? this.municipality,
      author: author ?? this.author,
      date: date ?? this.date,
      version: version ?? this.version,
      description: description ?? this.description,
    );
  }

  @override
  List<Object> get props => [
        propertyName,
        buildingType,
        address,
        municipality,
        author,
        date,
        version,
        description
      ];
}
