import 'package:freezed_annotation/freezed_annotation.dart';

import '../demolition_material_assessment/demolition_waste_and_costs.dart';
import 'exports.dart';

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
