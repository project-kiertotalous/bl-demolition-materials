import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_properties_disposal_materials_and_hazardous_waste.freezed.dart';

/// Loppusijoitettavat materiaalit ja ongelmajätteet
@freezed
abstract class SmallPropertiesDisposalMaterialsAndHazardousWaste
    with _$SmallPropertiesDisposalMaterialsAndHazardousWaste {
  SmallPropertiesDisposalMaterialsAndHazardousWaste._();

  factory SmallPropertiesDisposalMaterialsAndHazardousWaste(
          {num? unusableTilePorcelainGlassAndMineralInsulationProcessingCost,
          num? nonRecyclableBrickWasteProcessingCost,
          num? nonRecyclablePlasterBoardProcessingCost,
          num? contaminatedSoilProcessingCost,
          num? concreteContainingAsbestosProcessingCost,
          num? mineralWoolOrFeltRoofingContainingAsbestosProcessingCost,
          num? concreteContainingPcbPaintProcessingCost}) =
      _SmallPropertiesDisposalMaterialsAndHazardousWaste;
}
