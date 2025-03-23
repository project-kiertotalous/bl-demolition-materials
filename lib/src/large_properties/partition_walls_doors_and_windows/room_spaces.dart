import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';
import '../material_info.dart';
import 'partition_walls_demolition_materials.dart';
import 'room_space.dart';

part 'room_spaces.freezed.dart';

/// Toimisto, aula, luokka, asumis, yms. tavanomaiset huonetilat
/// Sisältää jokaisen huoneen ja niiden yhteislaskettavat arvot
@freezed
abstract class RoomSpaces with _$RoomSpaces {
  const RoomSpaces._();

  const factory RoomSpaces(
          {RoomSpace? officeSpaces,
          RoomSpace? lobbiesAndOtherCommonAreas,
          RoomSpace? restroomsAndWashingFacilities,
          RoomSpace? kitchens,
          RoomSpace? teachingAndTreatmentSpaces,
          RoomSpace? storageAndWorkspaces,
          RoomSpace? otherSpaces,
          @Default(false) bool surfaceMaterialCoatingContainsAsbestos}) =
      _RoomSpaces;

  /// Kaikki tilat yhteensä (m2)
  num? get totalWoodFramedWallsInSquareMeters {
    final internalWallFramesAndSurfaceMaterial =
        InternalWallFramesAndSurfaceMaterial();
    if (internalWallFramesAndSurfaceMaterial
                .overallLengthOfInternalWallsAllFloors ==
            null ||
        internalWallFramesAndSurfaceMaterial.averageHeightOfInternalWalls ==
            null) {
      return null;
    }
    final totalHeight =
        internalWallFramesAndSurfaceMaterial.averageHeightOfInternalWalls ?? 0;
    final totalLength = Utils.sumOrNull([
      officeSpaces?.woodFramedWallsLinearMeters,
      lobbiesAndOtherCommonAreas?.woodFramedWallsLinearMeters,
      restroomsAndWashingFacilities?.woodFramedWallsLinearMeters,
      kitchens?.woodFramedWallsLinearMeters,
      teachingAndTreatmentSpaces?.woodFramedWallsLinearMeters,
      storageAndWorkspaces?.woodFramedWallsLinearMeters,
      otherSpaces?.woodFramedWallsLinearMeters,
    ]);
    if (Utils.anyNull([totalLength, totalHeight])) {
      return null;
    }
    return totalLength! * totalHeight;
  }

  num? get totalBrickWallsInSquareMeters {
    final internalWallFramesAndSurfaceMaterial =
        InternalWallFramesAndSurfaceMaterial();
    if (internalWallFramesAndSurfaceMaterial.averageHeightOfInternalWalls ==
        null) {
      return null;
    }
    if (Utils.allNull([
      officeSpaces?.brickWallsLinearMeters,
      lobbiesAndOtherCommonAreas?.brickWallsLinearMeters,
      restroomsAndWashingFacilities?.brickWallsLinearMeters,
      kitchens?.brickWallsLinearMeters,
      teachingAndTreatmentSpaces?.brickWallsLinearMeters,
      storageAndWorkspaces?.brickWallsLinearMeters,
      otherSpaces?.brickWallsLinearMeters,
    ])) {
      return null;
    }
    final totalHeight =
        internalWallFramesAndSurfaceMaterial.averageHeightOfInternalWalls;
    final totalLength = Utils.sumOrNull([
      officeSpaces?.brickWallsLinearMeters,
      lobbiesAndOtherCommonAreas?.brickWallsLinearMeters,
      restroomsAndWashingFacilities?.brickWallsLinearMeters,
      kitchens?.brickWallsLinearMeters,
      teachingAndTreatmentSpaces?.brickWallsLinearMeters,
      storageAndWorkspaces?.brickWallsLinearMeters,
      otherSpaces?.brickWallsLinearMeters,
    ]);

    return totalLength! * totalHeight!;
  }

  num? get totalConcreteElementOrCastingWallsInSquareMeters {
    final internalWallFramesAndSurfaceMaterial =
        InternalWallFramesAndSurfaceMaterial();
    if (internalWallFramesAndSurfaceMaterial.averageHeightOfInternalWalls ==
        null) {
      return null;
    }
    if (Utils.allNull([
      officeSpaces?.concreteElementOrCastingWallsLinearMeters,
      lobbiesAndOtherCommonAreas?.concreteElementOrCastingWallsLinearMeters,
      restroomsAndWashingFacilities?.concreteElementOrCastingWallsLinearMeters,
      kitchens?.concreteElementOrCastingWallsLinearMeters,
      teachingAndTreatmentSpaces?.concreteElementOrCastingWallsLinearMeters,
      storageAndWorkspaces?.concreteElementOrCastingWallsLinearMeters,
      otherSpaces?.concreteElementOrCastingWallsLinearMeters,
    ])) {
      return null;
    }
    final totalHeight =
        internalWallFramesAndSurfaceMaterial.averageHeightOfInternalWalls;
    final totalLength = Utils.sumOrNull([
      officeSpaces?.concreteElementOrCastingWallsLinearMeters,
      lobbiesAndOtherCommonAreas?.concreteElementOrCastingWallsLinearMeters,
      restroomsAndWashingFacilities?.concreteElementOrCastingWallsLinearMeters,
      kitchens?.concreteElementOrCastingWallsLinearMeters,
      teachingAndTreatmentSpaces?.concreteElementOrCastingWallsLinearMeters,
      storageAndWorkspaces?.concreteElementOrCastingWallsLinearMeters,
      otherSpaces?.concreteElementOrCastingWallsLinearMeters,
    ]);

    return totalLength! * totalHeight!;
  }

  num? get totalSpacesWallLengthInSquareMeters => Utils.sumOrNull([
        officeSpaces?.overallWallLengthLinearMeters,
        lobbiesAndOtherCommonAreas?.overallWallLengthLinearMeters,
        restroomsAndWashingFacilities?.overallWallLengthLinearMeters,
        kitchens?.overallWallLengthLinearMeters,
        teachingAndTreatmentSpaces?.overallWallLengthLinearMeters,
        storageAndWorkspaces?.overallWallLengthLinearMeters,
        otherSpaces?.overallWallLengthLinearMeters
      ]);

  num? get totalSpacesWallArea => Utils.sumOrNull([
        officeSpaces?.overallWallArea,
        lobbiesAndOtherCommonAreas?.overallWallArea,
        restroomsAndWashingFacilities?.overallWallArea,
        kitchens?.overallWallArea,
        teachingAndTreatmentSpaces?.overallWallArea,
        storageAndWorkspaces?.overallWallArea,
        otherSpaces?.overallWallArea
      ]);

  num? get overallPartitionWallsStructuresInPercents => Utils.sumOrNull([
        officeSpaces?.overallPartitionWallsStructuresInPercents,
        lobbiesAndOtherCommonAreas?.overallPartitionWallsStructuresInPercents,
        restroomsAndWashingFacilities
            ?.overallPartitionWallsStructuresInPercents,
        kitchens?.overallPartitionWallsStructuresInPercents,
        teachingAndTreatmentSpaces?.overallPartitionWallsStructuresInPercents,
        storageAndWorkspaces?.overallPartitionWallsStructuresInPercents,
        otherSpaces?.overallPartitionWallsStructuresInPercents
      ]);

  /// Materiaalimäärä yhteensa (m3)
  num? get totalWoodFramedWallsVolume {
    if (totalWoodFramedWallsInSquareMeters == null) {
      return null;
    }
    return totalWoodFramedWallsInSquareMeters! *
        WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
            WoodMaterialType.trunkWood50x100) *
        WoodMaterialInfo.volumePerLinearMeter(WoodMaterialType.trunkWood50x100);
  }

  num? get totalBrickWallsVolume {
    if (totalBrickWallsInSquareMeters == null) {
      return null;
    }
    return totalBrickWallsInSquareMeters! *
        FoundationStructureWeights.limeSandBrick130mmKgPerSqm /
        FoundationStructureWeights.limeSandBrick130mmKgPerCbm;
  }

  num? get totalConcreteElementOrCastingWallsVolume {
    if (totalConcreteElementOrCastingWallsInSquareMeters == null) {
      return null;
    }
    return totalConcreteElementOrCastingWallsInSquareMeters! *
        FrameBarWeights.concreteWallElement200mmThickConcreteKgPerSqm /
        FrameBarWeights.concreteWallElement200mmThickConcreteKgPerCbm;
  }

  /// Materiaalimaara yhteensa (tonnia)
  num? get totalWoodFramedWallsTons {
    if (totalWoodFramedWallsVolume == null) {
      return null;
    }
    return totalWoodFramedWallsVolume! *
        WoodMaterialInfo.densityKgPerCubicMeter() /
        1000;
  }

  num? get totalBrickWallsTons {
    if (totalBrickWallsVolume == null) {
      return null;
    }
    return totalBrickWallsVolume! *
        FoundationStructureWeights.limeSandBrick130mmKgPerSqm /
        1000;
  }

  num? get totalConcreteElementOrCastingWallsTons {
    if (totalConcreteElementOrCastingWallsVolume == null) {
      return null;
    }
    return totalConcreteElementOrCastingWallsVolume! *
        FrameBarWeights.concreteWallElement200mmThickConcreteKgPerSqm /
        1000;
  }

  /// Seinien pintarakenteen osuus % kaikista valiseinista (seinapinta-alasta)

  /// Kaikki tilat yhteensa (m2)
  num? get totalChipboardArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [officeSpaces?.chipboard, officeSpaces?.overallWallArea]),
        Utils.multiplyOrNull([
          lobbiesAndOtherCommonAreas?.chipboard,
          lobbiesAndOtherCommonAreas?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          restroomsAndWashingFacilities?.chipboard,
          restroomsAndWashingFacilities?.overallWallArea
        ]),
        Utils.multiplyOrNull([kitchens?.chipboard, kitchens?.overallWallArea]),
        Utils.multiplyOrNull([
          teachingAndTreatmentSpaces?.chipboard,
          teachingAndTreatmentSpaces?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          storageAndWorkspaces?.chipboard,
          storageAndWorkspaces?.overallWallArea
        ]),
        Utils.multiplyOrNull(
            [otherSpaces?.chipboard, otherSpaces?.overallWallArea])
      ]);

  num? get totalCybrocArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [officeSpaces?.cybroc, officeSpaces?.overallWallArea]),
        Utils.multiplyOrNull([
          lobbiesAndOtherCommonAreas?.cybroc,
          lobbiesAndOtherCommonAreas?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          restroomsAndWashingFacilities?.cybroc,
          restroomsAndWashingFacilities?.overallWallArea
        ]),
        Utils.multiplyOrNull([kitchens?.cybroc, kitchens?.overallWallArea]),
        Utils.multiplyOrNull([
          teachingAndTreatmentSpaces?.cybroc,
          teachingAndTreatmentSpaces?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          storageAndWorkspaces?.cybroc,
          storageAndWorkspaces?.overallWallArea
        ]),
        Utils.multiplyOrNull(
            [otherSpaces?.cybroc, otherSpaces?.overallWallArea])
      ]);

  num? get totalBoardPanelArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [officeSpaces?.boardPanel, officeSpaces?.overallWallArea]),
        Utils.multiplyOrNull([
          lobbiesAndOtherCommonAreas?.boardPanel,
          lobbiesAndOtherCommonAreas?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          restroomsAndWashingFacilities?.boardPanel,
          restroomsAndWashingFacilities?.overallWallArea
        ]),
        Utils.multiplyOrNull([kitchens?.boardPanel, kitchens?.overallWallArea]),
        Utils.multiplyOrNull([
          teachingAndTreatmentSpaces?.boardPanel,
          teachingAndTreatmentSpaces?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          storageAndWorkspaces?.boardPanel,
          storageAndWorkspaces?.overallWallArea
        ]),
        Utils.multiplyOrNull(
            [otherSpaces?.boardPanel, otherSpaces?.overallWallArea])
      ]);

  num? get totalCeramicTileWallsArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [officeSpaces?.ceramicTileWalls, officeSpaces?.overallWallArea]),
        Utils.multiplyOrNull([
          lobbiesAndOtherCommonAreas?.ceramicTileWalls,
          lobbiesAndOtherCommonAreas?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          restroomsAndWashingFacilities?.ceramicTileWalls,
          restroomsAndWashingFacilities?.overallWallArea
        ]),
        Utils.multiplyOrNull(
            [kitchens?.ceramicTileWalls, kitchens?.overallWallArea]),
        Utils.multiplyOrNull([
          teachingAndTreatmentSpaces?.ceramicTileWalls,
          teachingAndTreatmentSpaces?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          storageAndWorkspaces?.ceramicTileWalls,
          storageAndWorkspaces?.overallWallArea
        ]),
        Utils.multiplyOrNull(
            [otherSpaces?.ceramicTileWalls, otherSpaces?.overallWallArea])
      ]);

  num? get totalPaintedPlasteredBrickWallArea => Utils.sumOrNull([
        Utils.multiplyOrNull([
          officeSpaces?.paintedPlasteredBrickWall,
          officeSpaces?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          lobbiesAndOtherCommonAreas?.paintedPlasteredBrickWall,
          lobbiesAndOtherCommonAreas?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          restroomsAndWashingFacilities?.paintedPlasteredBrickWall,
          restroomsAndWashingFacilities?.overallWallArea
        ]),
        Utils.multiplyOrNull(
            [kitchens?.paintedPlasteredBrickWall, kitchens?.overallWallArea]),
        Utils.multiplyOrNull([
          teachingAndTreatmentSpaces?.paintedPlasteredBrickWall,
          teachingAndTreatmentSpaces?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          storageAndWorkspaces?.paintedPlasteredBrickWall,
          storageAndWorkspaces?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          otherSpaces?.paintedPlasteredBrickWall,
          otherSpaces?.overallWallArea
        ])
      ]);

  num? get totalPlasticCarpetArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [officeSpaces?.plasticCarpet, officeSpaces?.overallWallArea]),
        Utils.multiplyOrNull([
          lobbiesAndOtherCommonAreas?.plasticCarpet,
          lobbiesAndOtherCommonAreas?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          restroomsAndWashingFacilities?.plasticCarpet,
          restroomsAndWashingFacilities?.overallWallArea
        ]),
        Utils.multiplyOrNull(
            [kitchens?.plasticCarpet, kitchens?.overallWallArea]),
        Utils.multiplyOrNull([
          teachingAndTreatmentSpaces?.plasticCarpet,
          teachingAndTreatmentSpaces?.overallWallArea
        ]),
        Utils.multiplyOrNull([
          storageAndWorkspaces?.plasticCarpet,
          storageAndWorkspaces?.overallWallArea
        ]),
        Utils.multiplyOrNull(
            [otherSpaces?.plasticCarpet, otherSpaces?.overallWallArea])
      ]);

  num? get totalAreaInPercents => Utils.sumOrNull([
        totalChipboardArea,
        totalCybrocArea,
        totalBoardPanelArea,
        totalCeramicTileWallsArea,
        totalPaintedPlasteredBrickWallArea,
        totalPlasticCarpetArea
      ]);

  /// Materiaalimaara yhteensa (m3)
  num? get totalChipboardVolume {
    if (totalChipboardArea == null) {
      return null;
    }
    return totalChipboardArea! *
        UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerSqm /
        UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerCbm;
  }

  num? get totalCybrocVolume {
    if (totalCybrocArea == null) {
      return null;
    }
    return totalCybrocArea! *
        UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerSqm /
        UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerCbm;
  }

  num? get totalBoardPanelVolume {
    if (totalBoardPanelArea == null) {
      return null;
    }
    return totalBoardPanelArea! *
        WoodMaterialInfo.woodWeightPerSquareMeter(
            WoodMaterialType.board20x125) /
        WoodMaterialInfo.densityKgPerCubicMeter();
  }

  num? get totalCeramicTileWallsVolume {
    if (totalCeramicTileWallsArea == null) {
      return null;
    }
    return totalCeramicTileWallsArea! *
        DividingWallWeights.ceramicTileKgPerSqm /
        DividingWallWeights.ceramicTileKgPerCbm;
  }

  num? get totalPaintedPlasteredBrickWallVolume {
    if (totalPaintedPlasteredBrickWallArea == null) {
      return null;
    }
    return totalPaintedPlasteredBrickWallArea! *
        FoundationSlabWeights.acrylicCoatingKgPerSqm /
        FoundationSlabWeights.acrylicCoatingKgPerCbm;
  }

  num? get totalPlasticCarpetVolume {
    if (totalPlasticCarpetArea == null) {
      return null;
    }
    return totalPlasticCarpetArea! *
        FloorStructureAndMaterialWeights.plasticMatKgPerSqm /
        FloorStructureAndMaterialWeights.plasticMatKgPerCbm;
  }

  /// Materiaalimaara yhteensa (tonnia)
  num? get totalChipboardTons {
    if (totalChipboardArea == null) {
      return null;
    }
    return totalChipboardArea! *
        UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerSqm /
        1000;
  }

  num? get totalCybrocTons {
    if (totalCybrocArea == null) {
      return null;
    }
    return totalCybrocArea! *
        UpperBaseStructureAndWaterRoofWeights.hardDiskKgPerSqm /
        1000;
  }

  num? get totalBoardPanelTons {
    if (totalBoardPanelArea == null) {
      return null;
    }
    return totalBoardPanelArea! *
        WoodMaterialInfo.woodWeightPerSquareMeter(
            WoodMaterialType.board20x125) /
        1000;
  }

  num? get totalCeramicTileWallsTons {
    if (totalCeramicTileWallsArea == null) {
      return null;
    }
    return totalCeramicTileWallsArea! *
        DividingWallWeights.ceramicTileKgPerSqm /
        1000;
  }

  num? get totalPaintedPlasteredBrickWallTons {
    if (totalPaintedPlasteredBrickWallArea == null) {
      return null;
    }
    return totalPaintedPlasteredBrickWallArea! *
        FoundationSlabWeights.acrylicCoatingKgPerSqm /
        1000;
  }

  num? get totalPlasticCarpetTons {
    if (totalPlasticCarpetArea == null) {
      return null;
    }
    return totalPlasticCarpetArea! *
        FloorStructureAndMaterialWeights.plasticMatKgPerSqm /
        1000;
  }
}
