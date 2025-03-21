import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/waste_disposal_item.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/fixed_furniture.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/room_spaces.dart';
import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'disposal_materials_and_hazardous_waste.freezed.dart';

/// Loppusijoitettavat materiaalit ja ongelmajätteet
@freezed
abstract class DisposalMaterialsAndHazardousWaste
    with _$DisposalMaterialsAndHazardousWaste {
  DisposalMaterialsAndHazardousWaste._();

  factory DisposalMaterialsAndHazardousWaste(
          {ExcavationArea? excavationArea,
          Cellar? cellar,
          FixedFurniture? fixedFurniture,
          FloorStructures? floorStructures,
          Foundations? foundations,
          RoomSpaces? roomSpaces,
          num? nonRecyclableBrickWasteDemolitionOrProcessingCost,
          num? contaminatedSoilDemolitionOrProcessingCost,
          num? asbestosOrBCPConcreteDemolitionOrProcessingCost,
          num? bitumenDemolitionOrProcessingCost,
          num? otherAsbestosContainingMaterialDemolitionOrProcessingCost}) =
      _DisposalMaterialsAndHazardousWaste;

  /// Kierrätyskelvoton tiilijäte
  late final nonRecyclableBrickWaste = WasteDisposalItem(
      volume: cellar?.brickVolume,
      tons: cellar?.brickTons,
      demolitionOrProcessingCost:
          nonRecyclableBrickWasteDemolitionOrProcessingCost);

  /// Saastunut maa
  late final contaminatedSoil = WasteDisposalItem(
      volume: excavationArea?.contaminatedSoil,
      tons: excavationArea?.contaminatedLandTons,
      demolitionOrProcessingCost: contaminatedSoilDemolitionOrProcessingCost);

  /// Asbestia tai BCP maalia sisältävä betoni (bitumi ja akryylipinnoitettu)
  late final asbestosOrBCPConcrete = WasteDisposalItem(
      volume: Utils.sumOrNull([
        (foundations?.bituminousWaterProofing ?? false)
            ? Utils.sumOrNull([
                // TODO: I don't know why we use tons here to calculate volume.
                // This is according to spec, but a bit fishy regardless.
                foundations?.concreteVolume,
                foundations?.concreteTons,
                foundations?.rebarTons,
                foundations?.concreteBlockVolume,
                foundations?.concreteBlockTons
              ])
            : null,
        cellar?.concreteVolume,
        cellar?.brickVolume,
        (roomSpaces?.surfaceMaterialCoatingContainsAsbestos ?? false)
            ? roomSpaces?.totalPlasticCarpetVolume
            : null
      ]),
      tons: Utils.sumOrNull([
        (foundations?.bituminousWaterProofing ?? false)
            ? Utils.sumOrNull([
                // TODO: This also seems fishy. Check above.
                foundations?.concreteTons,
              ])
            : null,
        cellar?.concreteTons,
        cellar?.brickTons,
        (roomSpaces?.surfaceMaterialCoatingContainsAsbestos ?? false)
            ? roomSpaces?.totalPlasticCarpetTons
            : null
      ]),
      demolitionOrProcessingCost:
          asbestosOrBCPConcreteDemolitionOrProcessingCost);

  /// Bitumi
  late final bitumen = WasteDisposalItem(
      volume: Utils.sumOrNull([
        foundations?.hotBitumenCoatingVolume,
        cellar?.hotBitumenCoatingVolume
      ]),
      tons: Utils.sumOrNull(
          [foundations?.hotBitumenCoatingTons, cellar?.hotBitumenCoatingTons]),
      demolitionOrProcessingCost: bitumenDemolitionOrProcessingCost);

  /// Mineriitti, tiilet, tiilikate, kattohuopa, kaakelilaatat yms. sisältää asbestia
  late final otherAsbestosContainingMaterial = WasteDisposalItem(
      volume: Utils.sumOrNull([
        (floorStructures?.surfaceMaterialCoatingContainsAsbestos ?? false)
            ? floorStructures?.ceramicTileFloorVolume
            : null,
        (roomSpaces?.surfaceMaterialCoatingContainsAsbestos ?? false)
            ? roomSpaces?.totalCeramicTileWallsVolume
            : null,
        (fixedFurniture?.areFurnituresRecyclable ?? false)
            ? fixedFurniture?.ceramicVolume
            : null
      ]),
      tons: Utils.sumOrNull([
        (floorStructures?.surfaceMaterialCoatingContainsAsbestos ?? false)
            ? floorStructures?.ceramicTileFloorTons
            : null,
        (roomSpaces?.surfaceMaterialCoatingContainsAsbestos ?? false)
            ? roomSpaces?.totalCeramicTileWallsTons
            : null,
        (fixedFurniture?.areFurnituresRecyclable ?? false)
            ? fixedFurniture?.ceramicTons
            : null
      ]),
      demolitionOrProcessingCost:
          otherAsbestosContainingMaterialDemolitionOrProcessingCost);

  List<WasteDisposalItem> get all => [
        nonRecyclableBrickWaste,
        asbestosOrBCPConcrete,
        bitumen,
        otherAsbestosContainingMaterial
      ];

  num? get totalVolume =>
      all.fold<num>(0, (acc, element) => acc + (element.volume ?? 0));

  num? get totalTons =>
      all.fold<num>(0, (acc, element) => acc + (element.tons ?? 0));

  num? get totalBatchPrice =>
      all.fold<num>(0, (acc, element) => acc + (element.batchPrice ?? 0));
}
