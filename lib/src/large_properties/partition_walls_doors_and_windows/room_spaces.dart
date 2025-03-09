import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'partition_walls_demolition_materials.dart';

import 'room_space.dart';
import '../material_info.dart';

part 'room_spaces.freezed.dart';

// Toimisto, aula, luokka, asumis, yms. tavanomaiset huonetilat
// Sisaltaa jokaisen huoneen ja niiden yhteislaskettavat arvot

@freezed
class RoomSpaces with _$RoomSpaces {
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

// Kaikki tilat yhteensä (m2)
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
          officeSpaces?.woodFramedWallsLinearMeters ?? 0,
          lobbiesAndOtherCommonAreas?.woodFramedWallsLinearMeters ?? 0,
          restroomsAndWashingFacilities?.woodFramedWallsLinearMeters ?? 0,
          kitchens?.woodFramedWallsLinearMeters ?? 0,
          teachingAndTreatmentSpaces?.woodFramedWallsLinearMeters ?? 0,
          storageAndWorkspaces?.woodFramedWallsLinearMeters ?? 0,
          otherSpaces?.woodFramedWallsLinearMeters ?? 0,
        ]) ??
        0;

    return totalLength * totalHeight;
  }

  num? get totalBrickWallsInSquareMeters {
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
          officeSpaces?.brickWallsLinearMeters ?? 0,
          lobbiesAndOtherCommonAreas?.brickWallsLinearMeters ?? 0,
          restroomsAndWashingFacilities?.brickWallsLinearMeters ?? 0,
          kitchens?.brickWallsLinearMeters ?? 0,
          teachingAndTreatmentSpaces?.brickWallsLinearMeters ?? 0,
          storageAndWorkspaces?.brickWallsLinearMeters ?? 0,
          otherSpaces?.brickWallsLinearMeters ?? 0,
        ]) ??
        0;

    return totalLength * totalHeight;
  }

  num? get totalConcreteElementOrCastingWallsInSquareMeters {
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
          officeSpaces?.concreteElementOrCastingWallsLinearMeters ?? 0,
          lobbiesAndOtherCommonAreas
                  ?.concreteElementOrCastingWallsLinearMeters ??
              0,
          restroomsAndWashingFacilities
                  ?.concreteElementOrCastingWallsLinearMeters ??
              0,
          kitchens?.concreteElementOrCastingWallsLinearMeters ?? 0,
          teachingAndTreatmentSpaces
                  ?.concreteElementOrCastingWallsLinearMeters ??
              0,
          storageAndWorkspaces?.concreteElementOrCastingWallsLinearMeters ?? 0,
          otherSpaces?.concreteElementOrCastingWallsLinearMeters ?? 0,
        ]) ??
        0;

    return totalLength * totalHeight;
  }

  num? get totalSpacesWallLengthInSquareMeters =>
      Utils.sumOrNull([
        officeSpaces?.overallWallLengthLinearMeters ?? 0,
        lobbiesAndOtherCommonAreas?.overallWallLengthLinearMeters ?? 0,
        restroomsAndWashingFacilities?.overallWallLengthLinearMeters ?? 0,
        kitchens?.overallWallLengthLinearMeters ?? 0,
        teachingAndTreatmentSpaces?.overallWallLengthLinearMeters ?? 0,
        storageAndWorkspaces?.overallWallLengthLinearMeters ?? 0,
        otherSpaces?.overallWallLengthLinearMeters ?? 0
      ]) ??
      0;

  num? get totalSpacesWallArea =>
      Utils.sumOrNull([
        officeSpaces?.overallWallArea ?? 0,
        lobbiesAndOtherCommonAreas?.overallWallArea ?? 0,
        restroomsAndWashingFacilities?.overallWallArea ?? 0,
        kitchens?.overallWallArea ?? 0,
        teachingAndTreatmentSpaces?.overallWallArea ?? 0,
        storageAndWorkspaces?.overallWallArea ?? 0,
        otherSpaces?.overallWallArea ?? 0
      ]) ??
      0;

  num? get overallPartitionWallsStructuresInPercents =>
      Utils.sumOrNull([
        officeSpaces?.overallPartitionWallsStructuresInPercents ?? 0,
        lobbiesAndOtherCommonAreas?.overallPartitionWallsStructuresInPercents ??
            0,
        restroomsAndWashingFacilities
                ?.overallPartitionWallsStructuresInPercents ??
            0,
        kitchens?.overallPartitionWallsStructuresInPercents ?? 0,
        teachingAndTreatmentSpaces?.overallPartitionWallsStructuresInPercents ??
            0,
        storageAndWorkspaces?.overallPartitionWallsStructuresInPercents ?? 0,
        otherSpaces?.overallPartitionWallsStructuresInPercents ?? 0
      ]) ??
      0;

  // Materiaalimaara yhteensa (m3)
  num? get totalWoodFramedWallsMaterialVolume =>
      totalWoodFramedWallsInSquareMeters! *
      WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
          WoodMaterialType.trunkWood50x100) *
      WoodMaterialInfo.volumePerLinearMeter(WoodMaterialType.trunkWood50x100);

  num? get totalBrickWallsMaterialVolume =>
      totalBrickWallsInSquareMeters! *
      FoundationStructureWeights.limeSandBrick130mmKgPerSqm /
      FoundationStructureWeights.limeSandBrick130mmKgPerCbm;

  num? get totalConcreteElementOrCastingWallsMaterialVolume =>
      totalConcreteElementOrCastingWallsInSquareMeters! *
      FrameBarWeights.concreteWallElement200mmThickConcreteKgPerSqm /
      FrameBarWeights.concreteWallElement200mmThickConcreteKgPerCbm;

  // Materiaalimaara yhteensa (tonnia)
  num? get totalWoodFramedWallsMaterialTons =>
      totalWoodFramedWallsMaterialVolume! *
      WoodMaterialInfo.densityKgPerCubicMeter() /
      1000;

  num? get totalBrickWallsMaterialTons =>
      totalBrickWallsMaterialVolume! *
      FoundationStructureWeights.limeSandBrick130mmKgPerSqm /
      1000;

  num? get totalConcreteElementOrCastingWallsMaterialTons =>
      totalConcreteElementOrCastingWallsMaterialVolume! *
      FrameBarWeights.concreteWallElement200mmThickConcreteKgPerSqm /
      1000;

  // Seinien pintarakenteen osuus % kaikista valiseinista (seinapinta-alasta)

  // Kaikki tilat yhteensa (m2)
  num? get totalChipboardArea =>
      (officeSpaces?.chipboard ?? 0) * (officeSpaces?.overallWallArea ?? 0) +
      (lobbiesAndOtherCommonAreas?.chipboard ?? 0) *
          (lobbiesAndOtherCommonAreas?.overallWallArea ?? 0) +
      (restroomsAndWashingFacilities?.chipboard ?? 0) *
          (restroomsAndWashingFacilities?.overallWallArea ?? 0) +
      (kitchens?.chipboard ?? 0) * (kitchens?.overallWallArea ?? 0) +
      (teachingAndTreatmentSpaces?.chipboard ?? 0) *
          (teachingAndTreatmentSpaces?.overallWallArea ?? 0) +
      (storageAndWorkspaces?.chipboard ?? 0) *
          (storageAndWorkspaces?.overallWallArea ?? 0) +
      (otherSpaces?.chipboard ?? 0) * (otherSpaces?.overallWallArea ?? 0);

  num? get totalCybrocArea =>
      (officeSpaces?.cybroc ?? 0) * (officeSpaces?.overallWallArea ?? 0) +
      (lobbiesAndOtherCommonAreas?.cybroc ?? 0) *
          (lobbiesAndOtherCommonAreas?.overallWallArea ?? 0) +
      (restroomsAndWashingFacilities?.cybroc ?? 0) *
          (restroomsAndWashingFacilities?.overallWallArea ?? 0) +
      (kitchens?.cybroc ?? 0) * (kitchens?.overallWallArea ?? 0) +
      (teachingAndTreatmentSpaces?.cybroc ?? 0) *
          (teachingAndTreatmentSpaces?.overallWallArea ?? 0) +
      (storageAndWorkspaces?.cybroc ?? 0) *
          (storageAndWorkspaces?.overallWallArea ?? 0) +
      (otherSpaces?.cybroc ?? 0) * (otherSpaces?.overallWallArea ?? 0);

  num? get totalBoardPanelArea =>
      (officeSpaces?.boardPanel ?? 0) * (officeSpaces?.overallWallArea ?? 0) +
      (lobbiesAndOtherCommonAreas?.boardPanel ?? 0) *
          (lobbiesAndOtherCommonAreas?.overallWallArea ?? 0) +
      (restroomsAndWashingFacilities?.boardPanel ?? 0) *
          (restroomsAndWashingFacilities?.overallWallArea ?? 0) +
      (kitchens?.boardPanel ?? 0) * (kitchens?.overallWallArea ?? 0) +
      (teachingAndTreatmentSpaces?.boardPanel ?? 0) *
          (teachingAndTreatmentSpaces?.overallWallArea ?? 0) +
      (storageAndWorkspaces?.boardPanel ?? 0) *
          (storageAndWorkspaces?.overallWallArea ?? 0) +
      (otherSpaces?.boardPanel ?? 0) * (otherSpaces?.overallWallArea ?? 0);

  num? get totalCeramicTileWallsArea =>
      (officeSpaces?.ceramicTileWalls ?? 0) *
          (officeSpaces?.overallWallArea ?? 0) +
      (lobbiesAndOtherCommonAreas?.ceramicTileWalls ?? 0) *
          (lobbiesAndOtherCommonAreas?.overallWallArea ?? 0) +
      (restroomsAndWashingFacilities?.ceramicTileWalls ?? 0) *
          (restroomsAndWashingFacilities?.overallWallArea ?? 0) +
      (kitchens?.ceramicTileWalls ?? 0) * (kitchens?.overallWallArea ?? 0) +
      (teachingAndTreatmentSpaces?.ceramicTileWalls ?? 0) *
          (teachingAndTreatmentSpaces?.overallWallArea ?? 0) +
      (storageAndWorkspaces?.ceramicTileWalls ?? 0) *
          (storageAndWorkspaces?.overallWallArea ?? 0) +
      (otherSpaces?.ceramicTileWalls ?? 0) *
          (otherSpaces?.overallWallArea ?? 0);

  num? get totalPaintedPlasteredBrickWallArea =>
      (officeSpaces?.paintedPlasteredBrickWall ?? 0) *
          (officeSpaces?.overallWallArea ?? 0) +
      (lobbiesAndOtherCommonAreas?.paintedPlasteredBrickWall ?? 0) *
          (lobbiesAndOtherCommonAreas?.overallWallArea ?? 0) +
      (restroomsAndWashingFacilities?.paintedPlasteredBrickWall ?? 0) *
          (restroomsAndWashingFacilities?.overallWallArea ?? 0) +
      (kitchens?.paintedPlasteredBrickWall ?? 0) *
          (kitchens?.overallWallArea ?? 0) +
      (teachingAndTreatmentSpaces?.paintedPlasteredBrickWall ?? 0) *
          (teachingAndTreatmentSpaces?.overallWallArea ?? 0) +
      (storageAndWorkspaces?.paintedPlasteredBrickWall ?? 0) *
          (storageAndWorkspaces?.overallWallArea ?? 0) +
      (otherSpaces?.paintedPlasteredBrickWall ?? 0) *
          (otherSpaces?.overallWallArea ?? 0);

  num? get totalPlasticCarpetArea =>
      (officeSpaces?.plasticCarpet ?? 0) *
          (officeSpaces?.overallWallArea ?? 0) +
      (lobbiesAndOtherCommonAreas?.plasticCarpet ?? 0) *
          (lobbiesAndOtherCommonAreas?.overallWallArea ?? 0) +
      (restroomsAndWashingFacilities?.plasticCarpet ?? 0) *
          (restroomsAndWashingFacilities?.overallWallArea ?? 0) +
      (kitchens?.plasticCarpet ?? 0) * (kitchens?.overallWallArea ?? 0) +
      (teachingAndTreatmentSpaces?.plasticCarpet ?? 0) *
          (teachingAndTreatmentSpaces?.overallWallArea ?? 0) +
      (storageAndWorkspaces?.plasticCarpet ?? 0) *
          (storageAndWorkspaces?.overallWallArea ?? 0) +
      (otherSpaces?.plasticCarpet ?? 0) * (otherSpaces?.overallWallArea ?? 0);

  num? get totalAreaInPercents => Utils.sumOrNull([
        totalChipboardArea,
        totalCybrocArea,
        totalBoardPanelArea,
        totalCeramicTileWallsArea,
        totalPaintedPlasteredBrickWallArea,
        totalPlasticCarpetArea
      ]);

// Materiaalimaara yhteensa (m3)
  num? get totalChipboardMaterialVolume =>
      totalChipboardArea! *
      UpperBaseStructureAndWaterRoofWeights.particleBoard15mmKgPerSqm /
      UpperBaseStructureAndWaterRoofWeights.particleBoard15mmKgPerCbm;

  num? get totalCybrocMaterialVolume =>
      totalCybrocArea! *
      UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerSqm /
      UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerCbm;

  num? get totalBoardPanelMaterialVolume =>
      totalBoardPanelArea! *
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125) /
      WoodMaterialInfo.densityKgPerCubicMeter();

  num? get totalCeramicTileWallsMaterialVolume =>
      totalCeramicTileWallsArea! *
      DividingWallWeights.ceramicTileKgPerSqm /
      DividingWallWeights.ceramicTileKgPerCbm;

  num? get totalPaintedPlasteredBrickWallMaterialVolume =>
      totalPaintedPlasteredBrickWallArea! *
      FoundationSlabWeights.acrylicCoatingKgPerSqm /
      FoundationSlabWeights.acrylicCoatingKgPerCbm;

  num? get totalPlasticCarpetMaterialVolume =>
      totalPlasticCarpetArea! *
      FloorStructureAndMaterialWeights.plasticMatKgPerSqm /
      FloorStructureAndMaterialWeights.plasticMatKgPerCbm;

// Materiaalimaara yhteensa (tonnia)
  num? get totalChipboardMaterialTons =>
      totalChipboardArea! *
      UpperBaseStructureAndWaterRoofWeights.particleBoard15mmKgPerSqm /
      1000;

  num? get totalCybrocMaterialTons =>
      totalCybrocArea! *
      UpperBaseStructureAndWaterRoofWeights.hardDiskKgPerSqm /
      1000;

  num? get totalBoardPanelMaterialTons =>
      totalBoardPanelArea! *
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125) /
      1000;

  num? get totalCeramicTileWallsMaterialTons =>
      totalCeramicTileWallsArea! *
      DividingWallWeights.ceramicTileKgPerSqm /
      1000;

  num? get totalPaintedPlasteredBrickWallMaterialTons =>
      totalPaintedPlasteredBrickWallArea! *
      FoundationSlabWeights.acrylicCoatingKgPerSqm /
      1000;

  num? get totalPlasticCarpetMaterialTons =>
      totalPlasticCarpetArea! *
      FloorStructureAndMaterialWeights.plasticMatKgPerSqm /
      1000;
}
