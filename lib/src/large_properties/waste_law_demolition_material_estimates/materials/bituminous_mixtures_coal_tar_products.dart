import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/demolition_waste_and_costs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'bituminous_mixtures_coal_tar_products.freezed.dart';

/// bitumiseokset, kivihiiliterva ja -tervatuotteet
@freezed
abstract class BituminousMixturesCoalTarProducts
    with _$BituminousMixturesCoalTarProducts {
  BituminousMixturesCoalTarProducts._();

  factory BituminousMixturesCoalTarProducts(
          {String? coalTarContainingBituminousMixturesNotes,
          WasteLawDemolitionMaterialEstimateEntry? otherBituminousMixtures,
          WasteLawDemolitionMaterialEstimateEntry? coalTarAndTarProducts,
          DemolitionWasteAndCosts? demolitionWasteAndCosts}) =
      _BituminousMixturesCoalTarProducts;

  late final coalTarContainingBituminousMixtures =
      WasteLawDemolitionMaterialEstimateEntry(
          volume: demolitionWasteAndCosts
              ?.disposalMaterialsAndHazardousWaste?.bitumen.volume,
          tons: demolitionWasteAndCosts
              ?.disposalMaterialsAndHazardousWaste?.bitumen.tons,
          notes: coalTarContainingBituminousMixturesNotes);
}
