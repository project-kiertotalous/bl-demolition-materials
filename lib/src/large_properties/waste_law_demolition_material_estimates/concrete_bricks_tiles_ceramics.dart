import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';
import '../demolition_material_assessment/demolition_waste_and_costs.dart';
import '../partition_walls_doors_and_windows/exports.dart';
import 'waste_law_demolition_material_estimate_entry.dart';

part 'concrete_bricks_tiles_ceramics.freezed.dart';

/// betoni, tiilet, laatat ja keramiikka
@freezed
abstract class ConcreteBricksTilesCeramics with _$ConcreteBricksTilesCeramics {
  ConcreteBricksTilesCeramics._();

  factory ConcreteBricksTilesCeramics(
          {String? concreteNotes,
          String? brickNotes,
          String? ceramicTilesNotes,
          String? hazardousConcreteBrickTileCeramicMixturesNotes,
          WasteLawDemolitionMaterialEstimateEntry? others,
          Foundations? foundations,
          TotalIntermediateFloors? totalIntermediateFloors,
          TotalRoofs? totalRoofs,
          TotalBuildingFrame? totalBuildingFrame,
          RoomSpaces? roomSpaces,
          DemolitionWasteAndCosts? demolitionWasteAndCosts}) =
      _ConcreteBricksTilesCeramics;

  late final concrete = WasteLawDemolitionMaterialEstimateEntry(
      volume: _concreteVolume, tons: _concreteTons, notes: concreteNotes);

  late final brick = WasteLawDemolitionMaterialEstimateEntry(
      volume: Utils.sumOrNull([
        totalRoofs?.roofTileVolume,
        totalBuildingFrame?.brickVolume,
        totalBuildingFrame?.limeOrRedBrickVolume,
        roomSpaces?.totalBrickWallsVolume
      ]),
      tons: Utils.sumOrNull([
        totalRoofs?.roofTileTons,
        totalBuildingFrame?.brickTons,
        totalBuildingFrame?.limeOrRedBrickTons,
        roomSpaces?.totalBrickWallsTons
      ]),
      notes: brickNotes);

  late final ceramicTiles = WasteLawDemolitionMaterialEstimateEntry(
      volume: demolitionWasteAndCosts
          ?.reusableAndRecyclableMaterials?.ceramicTiles.volume,
      tons: demolitionWasteAndCosts
          ?.reusableAndRecyclableMaterials?.ceramicTiles.tons,
      notes: ceramicTilesNotes);

  late final hazardousConcreteBrickTileCeramicMixtures =
      WasteLawDemolitionMaterialEstimateEntry(
          volume: Utils.sumOrNull([
            demolitionWasteAndCosts?.disposalMaterialsAndHazardousWaste
                ?.asbestosOrBCPConcrete.volume,
            demolitionWasteAndCosts?.disposalMaterialsAndHazardousWaste
                ?.otherAsbestosContainingMaterial.volume,
          ]),
          tons: Utils.sumOrNull([
            demolitionWasteAndCosts?.disposalMaterialsAndHazardousWaste
                ?.asbestosOrBCPConcrete.tons,
            demolitionWasteAndCosts?.disposalMaterialsAndHazardousWaste
                ?.otherAsbestosContainingMaterial.tons,
          ]),
          notes: hazardousConcreteBrickTileCeramicMixturesNotes);

  num? get _concreteVolume {
    num? foundationsConcreteVolume;
    var intermediateFloorsConcreteVolume =
        totalIntermediateFloors?.concreteCastingConcreteVolume;
    var roofsConcreteVolume = (totalRoofs?.roofTrussesAreRecyclable ?? false)
        ? null
        : totalRoofs!.concreteVolume;
    var buildingFrameConcreteVolume = totalBuildingFrame?.plasterCoatingVolume;

    if ((foundations?.bituminousWaterProofing ?? false) == false) {
      // TODO: Why are we counting tons here?
      foundationsConcreteVolume = Utils.sumOrNull([
        foundations?.concreteBlockVolume,
        foundations?.concreteTons,
        foundations?.rebarTons,
        foundations?.concreteBlockVolume,
        foundations?.concreteBlockTons
      ]);
    }

    if ((totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
            false) ==
        true) {
      intermediateFloorsConcreteVolume = Utils.sumOrNull([
        intermediateFloorsConcreteVolume,
        totalIntermediateFloors?.hollowCoreSlabConcreteVolume
      ]);
    }

    if ((totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)) {
      buildingFrameConcreteVolume = Utils.sumOrNull([
        buildingFrameConcreteVolume,
        totalBuildingFrame?.concreteVerticalColumnsPart.concreteVolume,
        totalBuildingFrame
            ?.concreteElementWallsWithoutFrameworkPart.concreteVolume
      ]);
    }

    return Utils.sumOrNull([
      foundationsConcreteVolume,
      intermediateFloorsConcreteVolume,
      roofsConcreteVolume,
      buildingFrameConcreteVolume,
      roomSpaces?.totalConcreteElementOrCastingWallsVolume
    ]);
  }

  num? get _concreteTons {
    num? foundationsConcreteTons;
    var intermediateFloorsConcreteTons =
        totalIntermediateFloors?.concreteCastingConcreteTons;
    var roofsConcreteTons = (totalRoofs?.roofTrussesAreRecyclable ?? false)
        ? null
        : totalRoofs!.concreteTons;
    var buildingFrameConcreteTons = totalBuildingFrame?.plasterCoatingTons;

    if ((foundations?.bituminousWaterProofing ?? false) == false) {
      // TODO: Why are we counting tons here?
      foundationsConcreteTons = Utils.sumOrNull([
        foundations?.concreteBlockTons,
        foundations?.concreteTons,
        foundations?.rebarTons,
        foundations?.concreteBlockTons,
        foundations?.concreteBlockTons
      ]);
    }

    if ((totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
            false) ==
        true) {
      intermediateFloorsConcreteTons = Utils.sumOrNull([
        intermediateFloorsConcreteTons,
        totalIntermediateFloors?.hollowCoreSlabConcreteTons
      ]);
    }

    if ((totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)) {
      buildingFrameConcreteTons = Utils.sumOrNull([
        buildingFrameConcreteTons,
        totalBuildingFrame?.concreteVerticalColumnsPart.concreteTons,
        totalBuildingFrame
            ?.concreteElementWallsWithoutFrameworkPart.concreteTons
      ]);
    }

    return Utils.sumOrNull([
      foundationsConcreteTons,
      intermediateFloorsConcreteTons,
      roofsConcreteTons,
      buildingFrameConcreteTons,
      roomSpaces?.totalConcreteElementOrCastingWallsTons
    ]);
  }
}
