import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/demolition_waste_and_costs.dart';
import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/materials/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_materials.freezed.dart';

/// muut rakentamisessa ja purkamisessa syntyvät jätteet
@freezed
abstract class OtherMaterials with _$OtherMaterials {
  OtherMaterials._();

  factory OtherMaterials(
      {WasteLawDemolitionMaterialEstimateEntry? mercuryContainingMaterials,
      String? pcbContainingDemolitionWasteNotes,
      WasteLawDemolitionMaterialEstimateEntry? otherHazardousDemolitionWaste,
      WasteLawDemolitionMaterialEstimateEntry? otherDemolitionWaste,
      DemolitionWasteAndCosts? demolitionAndWasteCosts}) = _OtherMaterials;

  late final pcbContainingDemolitionWaste =
      WasteLawDemolitionMaterialEstimateEntry(
          volume:
              demolitionAndWasteCosts?.disposalMaterialsAndHazardousWaste
                  ?.asbestosOrBCPConcrete.volume,
          tons: demolitionAndWasteCosts
              ?.disposalMaterialsAndHazardousWaste?.asbestosOrBCPConcrete.tons,
          notes: pcbContainingDemolitionWasteNotes);
}
