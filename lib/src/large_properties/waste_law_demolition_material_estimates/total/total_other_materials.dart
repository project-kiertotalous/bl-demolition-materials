import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/total/exports.dart';
import 'package:bl_demolition_materials/src/large_properties/waste_law_demolition_material_estimates/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'total_other_materials.freezed.dart';

/// muut rakentamisessa ja purkamisessa syntyvät jätteet
@freezed
abstract class TotalOtherMaterials with _$TotalOtherMaterials {
  TotalOtherMaterials._();

  factory TotalOtherMaterials(
          {OtherMaterials? otherMaterials,
          TotalDemolitionWasteAndCosts? totalDemolitionWasteAndCosts}) =
      _TotalOtherMaterials;

  late final pcbContainingDemolitionWaste =
      WasteLawDemolitionMaterialEstimateEntry(
          volume:
              totalDemolitionWasteAndCosts
                  ?.totalDisposalMaterialsAndHazardousWaste
                  ?.asbestosOrBCPConcrete
                  .volume,
          tons: totalDemolitionWasteAndCosts
              ?.totalDisposalMaterialsAndHazardousWaste
              ?.asbestosOrBCPConcrete
              .tons,
          notes: otherMaterials?.pcbContainingDemolitionWasteNotes);
}
