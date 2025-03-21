import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/exports.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'wood_glass_plastics.freezed.dart';

/// puu, lasi ja muovit
@freezed
abstract class WoodGlassPlastics with _$WoodGlassPlastics {
  WoodGlassPlastics._();

  factory WoodGlassPlastics(
      {String? woodNotes,
      String? glassNotes,
      String? plasticNotes,
      String? otherDangerousOrContaminatedMaterialsNotes,
      DemolitionWasteAndCosts? demolitionWasteAndCosts}) = _WoodGlassPlastics;

  late final wood = WasteLawDemolitionMaterialEstimateEntry(
      volume: Utils.sumOrNull([
        demolitionWasteAndCosts
            ?.reusableAndRecyclableMaterials?.cleanUsableWood.volume,
        demolitionWasteAndCosts
            ?.reusableAndRecyclableMaterials?.combustibleWoodWaste.volume,
      ]),
      tons: Utils.sumOrNull([
        demolitionWasteAndCosts
            ?.reusableAndRecyclableMaterials?.cleanUsableWood.tons,
        demolitionWasteAndCosts
            ?.reusableAndRecyclableMaterials?.combustibleWoodWaste.tons,
      ]),
      notes: woodNotes);

  late final glass = WasteLawDemolitionMaterialEstimateEntry(
      volume:
          demolitionWasteAndCosts?.reusableAndRecyclableMaterials?.glass.volume,
      tons: demolitionWasteAndCosts?.reusableAndRecyclableMaterials?.glass.tons,
      notes: glassNotes);

  late final plastic = WasteLawDemolitionMaterialEstimateEntry(
      volume: demolitionWasteAndCosts
          ?.reusableAndRecyclableMaterials?.plasticWaste.volume,
      tons: demolitionWasteAndCosts
          ?.reusableAndRecyclableMaterials?.plasticWaste.tons,
      notes: plasticNotes);

  late final otherDangerousOrContaminatedMaterial =
      WasteLawDemolitionMaterialEstimateEntry(
          volume: demolitionWasteAndCosts?.disposalMaterialsAndHazardousWaste
              ?.asbestosOrBCPConcrete.volume,
          tons: demolitionWasteAndCosts
              ?.disposalMaterialsAndHazardousWaste?.asbestosOrBCPConcrete.tons,
          notes: otherDangerousOrContaminatedMaterialsNotes);
}
