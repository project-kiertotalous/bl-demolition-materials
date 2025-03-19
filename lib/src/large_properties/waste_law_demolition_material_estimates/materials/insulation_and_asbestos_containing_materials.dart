import 'package:freezed_annotation/freezed_annotation.dart';

part 'insulation_and_asbestos_containing_materials.freezed.dart';

/// eristysaineet ja asbestia sisältävät rakennusaineet
@freezed
abstract class InsulationAndAsbestosContainingMaterials
    with _$InsulationAndAsbestosContainingMaterials {
  const factory InsulationAndAsbestosContainingMaterials() =
      _InsulationAndAsbestosContainingMaterials;
}
