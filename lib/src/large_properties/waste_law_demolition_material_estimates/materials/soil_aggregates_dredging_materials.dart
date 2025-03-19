import 'package:freezed_annotation/freezed_annotation.dart';

part 'soil_aggregates_dredging_materials.freezed.dart';

/// maa-ainekset (pilaantuneilta alueilta kaivetut
/// maa-ainekset mukaan luettuina), kiviainekset ja ruoppausmassat
@freezed
abstract class SoilAggregatesDredgingMaterials
    with _$SoilAggregatesDredgingMaterials {
  const factory SoilAggregatesDredgingMaterials() =
      _SoilAggregatesDredgingMaterials;
}
