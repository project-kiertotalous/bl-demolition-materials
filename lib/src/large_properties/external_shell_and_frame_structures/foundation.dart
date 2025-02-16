import 'package:bl_demolition_materials/src/data_types/foundation_material.dart';
import 'package:bl_demolition_materials/src/large_properties/external_shell_and_frame_structures/foundation_demolition_materials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foundation.freezed.dart';

@freezed
class Foundation with _$Foundation {
  const Foundation._();

  const factory Foundation(
          {num? area,
          num? circumference,
          FoundationMaterial? material,
          FoundationDemolitionMaterials? foundationDemolitionMaterials}) =
      _Foundation;

  FoundationDemolitionMaterials get demolitionMaterials =>
      foundationDemolitionMaterials ?? FoundationDemolitionMaterials(this);
}
