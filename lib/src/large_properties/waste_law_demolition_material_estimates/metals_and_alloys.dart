import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';
import '../demolition_material_assessment/demolition_waste_and_costs.dart';
import 'exports.dart';

part 'metals_and_alloys.freezed.dart';

/// metallit, niiden seokset (lejeeringit) mukaan luettuina
@freezed
abstract class MetalsAndAlloys with _$MetalsAndAlloys {
  MetalsAndAlloys._();

  factory MetalsAndAlloys(
      {String? copperBronzeAndBrassNotes,
      String? aluminiumNotes,
      String? ironAndSteelNotes,
      String? mixedMetalsNotes,
      WasteLawDemolitionMaterialEstimateEntry? lead,
      WasteLawDemolitionMaterialEstimateEntry? zinc,
      WasteLawDemolitionMaterialEstimateEntry? tin,
      WasteLawDemolitionMaterialEstimateEntry? contaminatedMetalWaste,
      WasteLawDemolitionMaterialEstimateEntry? hazardousOilAndTarCables,
      WasteLawDemolitionMaterialEstimateEntry? otherCables,
      DemolitionWasteAndCosts? demolitionWasteAndCosts}) = _MetalsAndAlloys;

  late final copperBronzeAndBrass = WasteLawDemolitionMaterialEstimateEntry(
      tons:
          demolitionWasteAndCosts?.reusableAndRecyclableMaterials?.copper.tons,
      notes: copperBronzeAndBrassNotes);

  late final aluminium = WasteLawDemolitionMaterialEstimateEntry(
      tons: demolitionWasteAndCosts
          ?.reusableAndRecyclableMaterials?.aluminium.tons,
      notes: aluminiumNotes);

  late final ironAndSteel = WasteLawDemolitionMaterialEstimateEntry(
      tons: demolitionWasteAndCosts
          ?.reusableAndRecyclableMaterials?.rebarAndSteelScrap.tons,
      notes: ironAndSteelNotes);

  late final mixedMetals = WasteLawDemolitionMaterialEstimateEntry(
      tons: Utils.sumOrNull([
        demolitionWasteAndCosts?.reusableAndRecyclableMaterials?.eWaste.tons,
        demolitionWasteAndCosts
            ?.reusableAndRecyclableMaterials?.stainlessSteel.tons
      ]),
      notes: mixedMetalsNotes);
}
