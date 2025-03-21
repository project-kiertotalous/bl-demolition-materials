import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../material_info.dart';
import 'floor_structure.dart';

part 'floor_structures.freezed.dart';

@freezed
abstract class FloorStructures with _$FloorStructures {
  const FloorStructures._();

  const factory FloorStructures(
          {FloorStructure? officeSpaces,
          FloorStructure? lobbiesAndOtherCommonAreas,
          FloorStructure? restroomsAndWashingFacilities,
          FloorStructure? kitchens,
          FloorStructure? teachingAndTreatmentSpaces,
          FloorStructure? storageAndWorkspaces,
          FloorStructure? otherSpaces,
          @Default(false) bool surfaceMaterialCoatingContainsAsbestos}) =
      _FloorStructures;

  num? get totalArea => Utils.sumOrNull([
        officeSpaces?.totalArea,
        lobbiesAndOtherCommonAreas?.totalArea,
        restroomsAndWashingFacilities?.totalArea,
        kitchens?.totalArea,
        teachingAndTreatmentSpaces?.totalArea,
        storageAndWorkspaces?.totalArea,
        otherSpaces?.totalArea
      ]);

  num? get chipBoardMidsoleVolume {
    final allNulls = !Utils.anyNonNull([
      Utils.multiplyOrNull(
          [officeSpaces?.chipBoardMidsolePortion, officeSpaces?.totalArea]),
      Utils.multiplyOrNull([
        lobbiesAndOtherCommonAreas?.chipBoardMidsolePortion,
        lobbiesAndOtherCommonAreas?.totalArea
      ]),
      Utils.multiplyOrNull([
        restroomsAndWashingFacilities?.chipBoardMidsolePortion,
        restroomsAndWashingFacilities?.totalArea
      ]),
      Utils.multiplyOrNull(
          [kitchens?.chipBoardMidsolePortion, kitchens?.totalArea]),
      Utils.multiplyOrNull([
        teachingAndTreatmentSpaces?.chipBoardMidsolePortion,
        teachingAndTreatmentSpaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        storageAndWorkspaces?.chipBoardMidsolePortion,
        storageAndWorkspaces?.totalArea
      ]),
      Utils.multiplyOrNull(
          [otherSpaces?.chipBoardMidsolePortion, otherSpaces?.totalArea]),
    ]);

    if (allNulls) {
      return null;
    }

    return Utils.sumOrNull([
          Utils.multiplyOrZero(
              [officeSpaces?.chipBoardMidsolePortion, officeSpaces?.totalArea]),
          Utils.multiplyOrZero([
            lobbiesAndOtherCommonAreas?.chipBoardMidsolePortion,
            lobbiesAndOtherCommonAreas?.totalArea
          ]),
          Utils.multiplyOrZero([
            restroomsAndWashingFacilities?.chipBoardMidsolePortion,
            restroomsAndWashingFacilities?.totalArea
          ]),
          Utils.multiplyOrZero(
              [kitchens?.chipBoardMidsolePortion, kitchens?.totalArea]),
          Utils.multiplyOrZero([
            teachingAndTreatmentSpaces?.chipBoardMidsolePortion,
            teachingAndTreatmentSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            storageAndWorkspaces?.chipBoardMidsolePortion,
            storageAndWorkspaces?.totalArea
          ]),
          Utils.multiplyOrZero(
              [otherSpaces?.chipBoardMidsolePortion, otherSpaces?.totalArea]),
        ])! *
        UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerSqm /
        1000;
  }

  num? get gypsumBoardingMidsoleVolume {
    final allNulls = !Utils.anyNonNull([
      Utils.multiplyOrNull([
        officeSpaces?.gypsumBoardingMidsolePortion,
        officeSpaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        lobbiesAndOtherCommonAreas?.gypsumBoardingMidsolePortion,
        lobbiesAndOtherCommonAreas?.totalArea
      ]),
      Utils.multiplyOrNull([
        restroomsAndWashingFacilities?.gypsumBoardingMidsolePortion,
        restroomsAndWashingFacilities?.totalArea
      ]),
      Utils.multiplyOrNull(
          [kitchens?.gypsumBoardingMidsolePortion, kitchens?.totalArea]),
      Utils.multiplyOrNull([
        teachingAndTreatmentSpaces?.gypsumBoardingMidsolePortion,
        teachingAndTreatmentSpaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        storageAndWorkspaces?.gypsumBoardingMidsolePortion,
        storageAndWorkspaces?.totalArea
      ]),
      Utils.multiplyOrNull(
          [otherSpaces?.gypsumBoardingMidsolePortion, otherSpaces?.totalArea]),
    ]);

    if (allNulls) {
      return null;
    }

    return Utils.sumOrNull([
          Utils.multiplyOrZero([
            officeSpaces?.gypsumBoardingMidsolePortion,
            officeSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            lobbiesAndOtherCommonAreas?.gypsumBoardingMidsolePortion,
            lobbiesAndOtherCommonAreas?.totalArea
          ]),
          Utils.multiplyOrZero([
            restroomsAndWashingFacilities?.gypsumBoardingMidsolePortion,
            restroomsAndWashingFacilities?.totalArea
          ]),
          Utils.multiplyOrZero(
              [kitchens?.gypsumBoardingMidsolePortion, kitchens?.totalArea]),
          Utils.multiplyOrZero([
            teachingAndTreatmentSpaces?.gypsumBoardingMidsolePortion,
            teachingAndTreatmentSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            storageAndWorkspaces?.gypsumBoardingMidsolePortion,
            storageAndWorkspaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            otherSpaces?.gypsumBoardingMidsolePortion,
            otherSpaces?.totalArea
          ]),
        ])! *
        UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerSqm /
        1000;
  }

  num? get solidBoardingMidsoleVolume {
    final allNulls = !Utils.anyNonNull([
      Utils.multiplyOrNull(
          [officeSpaces?.solidBoardingMidsolePortion, officeSpaces?.totalArea]),
      Utils.multiplyOrNull([
        lobbiesAndOtherCommonAreas?.solidBoardingMidsolePortion,
        lobbiesAndOtherCommonAreas?.totalArea
      ]),
      Utils.multiplyOrNull([
        restroomsAndWashingFacilities?.solidBoardingMidsolePortion,
        restroomsAndWashingFacilities?.totalArea
      ]),
      Utils.multiplyOrNull(
          [kitchens?.solidBoardingMidsolePortion, kitchens?.totalArea]),
      Utils.multiplyOrNull([
        teachingAndTreatmentSpaces?.solidBoardingMidsolePortion,
        teachingAndTreatmentSpaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        storageAndWorkspaces?.solidBoardingMidsolePortion,
        storageAndWorkspaces?.totalArea
      ]),
      Utils.multiplyOrNull(
          [otherSpaces?.solidBoardingMidsolePortion, otherSpaces?.totalArea]),
    ]);

    if (allNulls) {
      return null;
    }

    return Utils.sumOrNull([
          Utils.multiplyOrZero([
            officeSpaces?.solidBoardingMidsolePortion,
            officeSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            lobbiesAndOtherCommonAreas?.solidBoardingMidsolePortion,
            lobbiesAndOtherCommonAreas?.totalArea
          ]),
          Utils.multiplyOrZero([
            restroomsAndWashingFacilities?.solidBoardingMidsolePortion,
            restroomsAndWashingFacilities?.totalArea
          ]),
          Utils.multiplyOrZero(
              [kitchens?.solidBoardingMidsolePortion, kitchens?.totalArea]),
          Utils.multiplyOrZero([
            teachingAndTreatmentSpaces?.solidBoardingMidsolePortion,
            teachingAndTreatmentSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            storageAndWorkspaces?.solidBoardingMidsolePortion,
            storageAndWorkspaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            otherSpaces?.solidBoardingMidsolePortion,
            otherSpaces?.totalArea
          ]),
        ])! *
        UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerSqm /
        1000;
  }

  num? get chipBoardMidsoleTons => chipBoardMidsoleVolume == null
      ? null
      : chipBoardMidsoleVolume! /
          1000 *
          UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerCbm;

  num? get gypsumBoardingMidsoleTons => gypsumBoardingMidsoleVolume == null
      ? null
      : gypsumBoardingMidsoleVolume! /
          1000 *
          UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerCbm;

  num? get solidBoardingMidsoleTons => solidBoardingMidsoleVolume == null
      ? null
      : solidBoardingMidsoleVolume! /
          1000 *
          UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerCbm;

  num? get floorPanelFloorVolume {
    final allNulls = !Utils.anyNonNull([
      Utils.multiplyOrNull(
          [officeSpaces?.floorPanelFloorPortion, officeSpaces?.totalArea]),
      Utils.multiplyOrNull([
        lobbiesAndOtherCommonAreas?.floorPanelFloorPortion,
        lobbiesAndOtherCommonAreas?.totalArea
      ]),
      Utils.multiplyOrNull([
        restroomsAndWashingFacilities?.floorPanelFloorPortion,
        restroomsAndWashingFacilities?.totalArea
      ]),
      Utils.multiplyOrNull(
          [kitchens?.floorPanelFloorPortion, kitchens?.totalArea]),
      Utils.multiplyOrNull([
        teachingAndTreatmentSpaces?.floorPanelFloorPortion,
        teachingAndTreatmentSpaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        storageAndWorkspaces?.floorPanelFloorPortion,
        storageAndWorkspaces?.totalArea
      ]),
      Utils.multiplyOrNull(
          [otherSpaces?.floorPanelFloorPortion, otherSpaces?.totalArea]),
    ]);

    if (allNulls) {
      return null;
    }

    return Utils.sumOrNull([
          Utils.multiplyOrZero(
              [officeSpaces?.floorPanelFloorPortion, officeSpaces?.totalArea]),
          Utils.multiplyOrZero([
            lobbiesAndOtherCommonAreas?.floorPanelFloorPortion,
            lobbiesAndOtherCommonAreas?.totalArea
          ]),
          Utils.multiplyOrZero([
            restroomsAndWashingFacilities?.floorPanelFloorPortion,
            restroomsAndWashingFacilities?.totalArea
          ]),
          Utils.multiplyOrZero(
              [kitchens?.floorPanelFloorPortion, kitchens?.totalArea]),
          Utils.multiplyOrZero([
            teachingAndTreatmentSpaces?.floorPanelFloorPortion,
            teachingAndTreatmentSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            storageAndWorkspaces?.floorPanelFloorPortion,
            storageAndWorkspaces?.totalArea
          ]),
          Utils.multiplyOrZero(
              [otherSpaces?.floorPanelFloorPortion, otherSpaces?.totalArea]),
        ])! *
        UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerSqm /
        1000;
  }

  num? get plasticCarpetOrPlasticTileFloorVolume {
    final allNulls = !Utils.anyNonNull([
      Utils.multiplyOrNull([
        officeSpaces?.plasticCarpetOrPlasticTileFloorPortion,
        officeSpaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        lobbiesAndOtherCommonAreas?.plasticCarpetOrPlasticTileFloorPortion,
        lobbiesAndOtherCommonAreas?.totalArea
      ]),
      Utils.multiplyOrNull([
        restroomsAndWashingFacilities?.plasticCarpetOrPlasticTileFloorPortion,
        restroomsAndWashingFacilities?.totalArea
      ]),
      Utils.multiplyOrNull([
        kitchens?.plasticCarpetOrPlasticTileFloorPortion,
        kitchens?.totalArea
      ]),
      Utils.multiplyOrNull([
        teachingAndTreatmentSpaces?.plasticCarpetOrPlasticTileFloorPortion,
        teachingAndTreatmentSpaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        storageAndWorkspaces?.plasticCarpetOrPlasticTileFloorPortion,
        storageAndWorkspaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        otherSpaces?.plasticCarpetOrPlasticTileFloorPortion,
        otherSpaces?.totalArea
      ]),
    ]);

    if (allNulls) {
      return null;
    }

    return Utils.sumOrNull([
          Utils.multiplyOrZero([
            officeSpaces?.plasticCarpetOrPlasticTileFloorPortion,
            officeSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            lobbiesAndOtherCommonAreas?.plasticCarpetOrPlasticTileFloorPortion,
            lobbiesAndOtherCommonAreas?.totalArea
          ]),
          Utils.multiplyOrZero([
            restroomsAndWashingFacilities
                ?.plasticCarpetOrPlasticTileFloorPortion,
            restroomsAndWashingFacilities?.totalArea
          ]),
          Utils.multiplyOrZero([
            kitchens?.plasticCarpetOrPlasticTileFloorPortion,
            kitchens?.totalArea
          ]),
          Utils.multiplyOrZero([
            teachingAndTreatmentSpaces?.plasticCarpetOrPlasticTileFloorPortion,
            teachingAndTreatmentSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            storageAndWorkspaces?.plasticCarpetOrPlasticTileFloorPortion,
            storageAndWorkspaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            otherSpaces?.plasticCarpetOrPlasticTileFloorPortion,
            otherSpaces?.totalArea
          ]),
        ])! *
        FloorStructureAndMaterialWeights.plasticMatKgPerSqm /
        1000;
  }

  num? get parquetFloorVolume {
    final allNulls = !Utils.anyNonNull([
      Utils.multiplyOrNull(
          [officeSpaces?.parquetFloorPortion, officeSpaces?.totalArea]),
      Utils.multiplyOrNull([
        lobbiesAndOtherCommonAreas?.parquetFloorPortion,
        lobbiesAndOtherCommonAreas?.totalArea
      ]),
      Utils.multiplyOrNull([
        restroomsAndWashingFacilities?.parquetFloorPortion,
        restroomsAndWashingFacilities?.totalArea
      ]),
      Utils.multiplyOrNull(
          [kitchens?.parquetFloorPortion, kitchens?.totalArea]),
      Utils.multiplyOrNull([
        teachingAndTreatmentSpaces?.parquetFloorPortion,
        teachingAndTreatmentSpaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        storageAndWorkspaces?.parquetFloorPortion,
        storageAndWorkspaces?.totalArea
      ]),
      Utils.multiplyOrNull(
          [otherSpaces?.parquetFloorPortion, otherSpaces?.totalArea]),
    ]);

    if (allNulls) {
      return null;
    }

    return Utils.sumOrNull([
          Utils.multiplyOrZero(
              [officeSpaces?.parquetFloorPortion, officeSpaces?.totalArea]),
          Utils.multiplyOrZero([
            lobbiesAndOtherCommonAreas?.parquetFloorPortion,
            lobbiesAndOtherCommonAreas?.totalArea
          ]),
          Utils.multiplyOrZero([
            restroomsAndWashingFacilities?.parquetFloorPortion,
            restroomsAndWashingFacilities?.totalArea
          ]),
          Utils.multiplyOrZero(
              [kitchens?.parquetFloorPortion, kitchens?.totalArea]),
          Utils.multiplyOrZero([
            teachingAndTreatmentSpaces?.parquetFloorPortion,
            teachingAndTreatmentSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            storageAndWorkspaces?.parquetFloorPortion,
            storageAndWorkspaces?.totalArea
          ]),
          Utils.multiplyOrZero(
              [otherSpaces?.parquetFloorPortion, otherSpaces?.totalArea]),
        ])! *
        FloorStructureAndMaterialWeights.parquetKgPerSqm /
        1000;
  }

  num? get ceramicTileFloorVolume {
    final allNulls = !Utils.anyNonNull([
      Utils.multiplyOrNull(
          [officeSpaces?.ceramicTileFloorPortion, officeSpaces?.totalArea]),
      Utils.multiplyOrNull([
        lobbiesAndOtherCommonAreas?.ceramicTileFloorPortion,
        lobbiesAndOtherCommonAreas?.totalArea
      ]),
      Utils.multiplyOrNull([
        restroomsAndWashingFacilities?.ceramicTileFloorPortion,
        restroomsAndWashingFacilities?.totalArea
      ]),
      Utils.multiplyOrNull(
          [kitchens?.ceramicTileFloorPortion, kitchens?.totalArea]),
      Utils.multiplyOrNull([
        teachingAndTreatmentSpaces?.ceramicTileFloorPortion,
        teachingAndTreatmentSpaces?.totalArea
      ]),
      Utils.multiplyOrNull([
        storageAndWorkspaces?.ceramicTileFloorPortion,
        storageAndWorkspaces?.totalArea
      ]),
      Utils.multiplyOrNull(
          [otherSpaces?.ceramicTileFloorPortion, otherSpaces?.totalArea]),
    ]);

    if (allNulls) {
      return null;
    }

    return Utils.sumOrNull([
          Utils.multiplyOrZero(
              [officeSpaces?.ceramicTileFloorPortion, officeSpaces?.totalArea]),
          Utils.multiplyOrZero([
            lobbiesAndOtherCommonAreas?.ceramicTileFloorPortion,
            lobbiesAndOtherCommonAreas?.totalArea
          ]),
          Utils.multiplyOrZero([
            restroomsAndWashingFacilities?.ceramicTileFloorPortion,
            restroomsAndWashingFacilities?.totalArea
          ]),
          Utils.multiplyOrZero(
              [kitchens?.ceramicTileFloorPortion, kitchens?.totalArea]),
          Utils.multiplyOrZero([
            teachingAndTreatmentSpaces?.ceramicTileFloorPortion,
            teachingAndTreatmentSpaces?.totalArea
          ]),
          Utils.multiplyOrZero([
            storageAndWorkspaces?.ceramicTileFloorPortion,
            storageAndWorkspaces?.totalArea
          ]),
          Utils.multiplyOrZero(
              [otherSpaces?.ceramicTileFloorPortion, otherSpaces?.totalArea]),
        ])! *
        FloorStructureAndMaterialWeights.ceramicTilesKgPerSqm /
        1000;
  }

  num? get floorPanelFloorTons => floorPanelFloorVolume == null
      ? null
      : floorPanelFloorVolume! /
          1000 *
          UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerCbm;

  num? get plasticCarpetOrPlasticTileFloorTons =>
      plasticCarpetOrPlasticTileFloorVolume == null
          ? null
          : plasticCarpetOrPlasticTileFloorVolume! /
              1000 *
              FloorStructureAndMaterialWeights.plasticMatKgPerCbm;

  num? get parquetFloorTons => parquetFloorVolume == null
      ? null
      : parquetFloorVolume! /
          1000 *
          FloorStructureAndMaterialWeights.parquetKgPerCbm;

  num? get ceramicTileFloorTons => ceramicTileFloorVolume == null
      ? null
      : ceramicTileFloorVolume! /
          1000 *
          FloorStructureAndMaterialWeights.ceramicTilesKgPerCbm;
}
