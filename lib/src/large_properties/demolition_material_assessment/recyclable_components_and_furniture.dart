import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/recyclable_item.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/fixtures_and_structures.dart';
import 'package:bl_demolition_materials/src/large_properties/hvac_electrical_and_other_equipment/machines_and_equipments.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/fixed_furniture.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/inner_doors.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/outer_doors.dart';
import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/windows.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';

part 'recyclable_components_and_furniture.freezed.dart';

/// KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET
@freezed
abstract class RecyclableComponentsAndFurniture
    with _$RecyclableComponentsAndFurniture {
  RecyclableComponentsAndFurniture._();

  factory RecyclableComponentsAndFurniture({
    TotalIntermediateFloors? totalIntermediateFloors,
    TotalRoofs? totalRoofs,
    TotalBuildingFrame? totalBuildingFrame,
    FixturesAndStructures? fixturesAndStructures,
    FixedFurniture? fixedFurniture,
    OuterDoors? outerDoors,
    InnerDoors? innerDoors,
    Windows? windows,
    MachinesAndEquipments? machinesAndEquipments,
    num? concreteFrameBeamsUnitPrice,
    num? concreteHollowSlabsUnitPrice,
    num? concreteRoofBeamsUnitPrice,
    num? concreteWallElementsUnitPrice,
    num? glulamBeamsUnitPrice,
    num? floorSupportWoodenBeamsUnitPrice,
    num? steelFrameBeamsUnitPrice,
    num? rainGuttersAndDownspoutsUnitPrice,
    num? fireLaddersAndWalkwaysUnitPrice,
    num? woodenRoofTrussesUnitPrice,
    num? steelRoofTrussesUnitPrice,
    num? steelChainLinkFenceUnitPrice,
    num? aluminumChainLinkFenceUnitPrice,
    num? woodAndFiberboardDoorsUnitPrice,
    num? aluminumDoorsUnitPrice,
    num? exteriorAndFireExitSteelDoorsUnitPrice,
    num? woodenOrBoardCabinetsAndFurnitureUnitPrice,
    num? steelLockerCabinetsUnitPrice,
    num? woodenWindowsUnitPrice,
    num? porcelainToiletsUnitPrice,
    num? porcelainSinksUnitPrice,
    num? stainlessSteelSinksAndTablesUnitPrice,
    num? saunaStovesUnitPrice,
    num? electricStovesUnitPrice,
    num? industrialElectricStovesUnitPrice,
    num? refrigeratorsUnitPrice,
    num? coldRoomCabinetsUnitPrice,
    num? electricRadiatorsUnitPrice,
    num? smallElectricalAccumulatorsUnitPrice,
    num? largeElectricalAccumulatorsUnitPrice,
    num? electricMotorsAndCirculationPumpsUnitPrice,
    num? ventilationUnitsUnitPrice,
    num? electricalDistributionCabinetsAndMetersUnitPrice,
    num? roofExhaustFansUnitPrice,
  }) = _RecyclableComponentsAndFurniture;

  /// Betonipalkit, runko
  late final concreteFrameBeams = RecyclableItem(
      volume:
          (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
              ? totalBuildingFrame?.concreteVerticalColumnsPart.concreteVolume
              : null,
      tons: (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
          ? totalBuildingFrame?.concreteVerticalColumnsPart.concreteTons
          : null,
      unitPrice: concreteFrameBeamsUnitPrice);

  /// Betoniset ontelolaatat
  late final concreteHollowSlabs = RecyclableItem(
      volume:
          (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
                  false)
              ? totalIntermediateFloors?.hollowCoreSlabConcreteVolume
              : 0,
      tons: (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
              false)
          ? totalIntermediateFloors?.hollowCoreSlabConcreteTons
          : 0,
      unitPrice: concreteHollowSlabsUnitPrice);

  /// Betoniset kattopalkit
  late final concreteRoofBeams = RecyclableItem(
      volume: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.concreteVolume
          : 0,
      tons: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.concreteTons
          : 0,
      unitPrice: concreteRoofBeamsUnitPrice);

  /// Betoniset seinäelementit
  late final concreteWallElements = RecyclableItem(
      volume:
          (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
              ? totalBuildingFrame
                  ?.concreteElementWallsWithoutFrameworkPart.concreteVolume
              : null,
      tons: (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
          ? totalBuildingFrame
              ?.concreteElementWallsWithoutFrameworkPart.concreteTons
          : null,
      unitPrice: concreteWallElementsUnitPrice);

  /// Liimapalkit
  late final glulamBeams = RecyclableItem(
      volume:
          (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
                  false)
              ? totalIntermediateFloors?.glulamBeamWoodVolume
              : 0,
      tons: (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
              false)
          ? totalIntermediateFloors?.glulamBeamWoodVolume
          : 0,
      unitPrice: glulamBeamsUnitPrice);

  /// Puupalkit (kantavat lattiapalkit)
  late final floorSupportWoodenBeams = RecyclableItem(
      volume: totalBuildingFrame?.glulamBeamsPart.woodVolume,
      tons: totalBuildingFrame?.glulamBeamsPart.woodTons,
      unitPrice: floorSupportWoodenBeamsUnitPrice);

  /// Teräspalkit, runkopalkit
  late final steelFrameBeams = RecyclableItem(
      tons: totalBuildingFrame?.steelVerticalColumnsPart.steelTons,
      unitPrice: steelFrameBeamsUnitPrice);

  /// Sadevesikourut ja rännit (m)
  late final rainGuttersAndDownspouts = RecyclableItem(
      size: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.rainGuttersAndDownSpouts?.meters
          : null,
      tons: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.rainGuttersAndDownSpouts?.tons
          : null,
      unitPrice: rainGuttersAndDownspoutsUnitPrice);

  /// Palotikkaat ja kulkusillat (m)
  late final fireLaddersAndWalkways = RecyclableItem(
      size: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.fireLaddersAndWalkways?.meters
          : null,
      tons: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.fireLaddersAndWalkways?.tons
          : null,
      unitPrice: fireLaddersAndWalkwaysUnitPrice);

  /// Puiset kattoristikot
  late final woodenRoofTrusses = RecyclableItem(
      volume: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.woodVolume
          : null,
      tons: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.woodTons
          : null,
      unitPrice: woodenRoofTrussesUnitPrice);

  /// Teräksiset kattoristikot
  late final steelRoofTrusses = RecyclableItem(
      tons: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.steelTons
          : null,
      unitPrice: steelRoofTrussesUnitPrice);

  /// Teräsverkko aita (m)
  late final steelChainLinkFence = RecyclableItem(
      size: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.steelChainLinkFences?.meters
          : null,
      tons: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.steelChainLinkFences?.tons
          : null,
      unitPrice: steelChainLinkFenceUnitPrice);

  /// Alumiiniverkko aita (m)
  late final aluminumChainLinkFence = RecyclableItem(
      size: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.aluminiumChainLinkFences?.meters
          : null,
      tons: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.aluminiumChainLinkFences?.tons
          : null,
      unitPrice: aluminumChainLinkFenceUnitPrice);

  /// Puuovet ja kuitulevyovet
  late final woodAndFiberboardDoors = RecyclableItem(
      size: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? outerDoors?.woodenDoors?.overallOuterDoors
            : null,
        (innerDoors?.areDoorsRecyclable ?? false)
            ? Utils.sumOrNull([
                innerDoors?.woodenDoors?.overallOuterDoors,
                innerDoors?.panelDoors?.overallOuterDoors
              ])
            : null,
      ]),
      volume: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? outerDoors?.totalWoodVolume
            : null,
        (innerDoors?.areDoorsRecyclable ?? false)
            ? innerDoors?.totalWoodVolume
            : null,
      ]),
      tons: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? outerDoors?.totalWoodTons
            : null,
        (innerDoors?.areDoorsRecyclable ?? false)
            ? innerDoors?.totalWoodTons
            : null,
      ]),
      unitPrice: woodAndFiberboardDoorsUnitPrice);

  /// Alumiiniovet
  late final aluminumDoors = RecyclableItem(
      size: (outerDoors?.areDoorsRecyclable ?? false)
          ? outerDoors?.aluminiumDoors?.overallOuterDoors
          : null,
      tons: (outerDoors?.areDoorsRecyclable ?? false)
          ? outerDoors?.totalAluminiumTons
          : null,
      unitPrice: aluminumDoorsUnitPrice);

  /// Teräsovet (ulko ja palo-ovet)
  late final exteriorAndFireExitSteelDoors = RecyclableItem(
      size: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? Utils.sumOrNull([
                outerDoors?.steelDoors?.overallOuterDoors,
                outerDoors?.accessAndLoadingDoors
              ])
            : null,
        innerDoors?.fireDoors?.overallOuterDoors
      ]),
      volume: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? Utils.sumOrNull(
                [outerDoors?.totalSteelTons, outerDoors?.totalGlassTons])
            : null,
        innerDoors?.totalSteelTons,
      ]),
      unitPrice: exteriorAndFireExitSteelDoorsUnitPrice);

  /// Kaapit ja kalusteet, puu tai levy (keittiö ja sosiaalitilat)
  late final woodenOrBoardCabinetsAndFurniture = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false) &&
              fixedFurniture?.clothingOrOtherClosetsWood! != null
          ? fixedFurniture!.clothingOrOtherClosetsWood! / 0.6
          : null,
      volume: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.ceramicVolume
          : null,
      tons: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.chipboardTons
          : null,
      unitPrice: woodenOrBoardCabinetsAndFurnitureUnitPrice);

  /// Teräksiset pukukaapit
  late final steelLockerCabinets = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false) &&
              fixedFurniture?.steelLockerCabinets! != null
          ? fixedFurniture!.steelLockerCabinets! / 0.6
          : null,
      tons: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.steelTons
          : null,
      unitPrice: steelLockerCabinetsUnitPrice);

  /// Puuiset ikkunat
  late final woodenWindows = RecyclableItem(
      size:
          (windows?.areWindowsRecyclable ?? false) ? windows?.windowsPcs : null,
      // TODO: To me this does not make much sense. Probably a mistake in the spec.
      // Keeping this as is for now.
      volume: (windows?.areWindowsRecyclable ?? false)
          ? outerDoors?.totalWoodVolume
          : null,
      tons: (windows?.areWindowsRecyclable ?? false)
          ? windows?.totalWoodTons
          : null,
      unitPrice: woodenWindowsUnitPrice);

  /// WC-istuin, posliini
  late final porcelainToilets = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.porcelainToilets
          : null,
      unitPrice: porcelainToiletsUnitPrice);

  /// Pesuallas, posliini
  late final porcelainSinks = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.porcelainSinks
          : null,
      unitPrice: porcelainSinksUnitPrice);

  /// Teräsaltaat ja pöydät (ruostumaton)
  late final stainlessSteelSinksAndTables = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.steelTables
          : null,
      unitPrice: stainlessSteelSinksAndTablesUnitPrice);

  /// Saunankiukaat
  late final saunaStoves = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.saunaStoves
          : null,
      unitPrice: saunaStovesUnitPrice);

  /// Sähköliedet
  late final electricStoves = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.electricStoves
          : null,
      unitPrice: electricStovesUnitPrice);

  /// Suurtalous sähköliedet
  late final industrialElectricStoves = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.industrialElectricStoves
          : null,
      unitPrice: industrialElectricStovesUnitPrice);

  /// Jääkaapit
  late final refrigerators = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.refrigerators
          : null,
      unitPrice: refrigeratorsUnitPrice);

  /// Kylmiökaapit
  late final coldRoomCabinets = RecyclableItem(
      size: (fixedFurniture?.areFurnituresRecyclable ?? false)
          ? fixedFurniture?.coldRoomCabinets
          : null,
      unitPrice: coldRoomCabinetsUnitPrice);

  /// Lämpöpatterit, sähkö
  late final electricRadiators = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricRadiators?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricRadiators?.tons
          : null,
      unitPrice: electricRadiatorsUnitPrice);

  /// Vesivaraajat, pienet
  late final smallElectricalAccumulators = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.smallElectricalAccumulators?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.smallElectricalAccumulators?.tons
          : null,
      unitPrice: smallElectricalAccumulatorsUnitPrice);

  /// Vesivaraajat, suuret
  late final largeElectricalAccumulators = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.largeElectricalAccumulators?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.largeElectricalAccumulators?.tons
          : null,
      unitPrice: largeElectricalAccumulatorsUnitPrice);

  /// Sähkömoottorit ja kiertovesipumput
  late final electricMotorsAndCirculationPumps = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricMotorsAndCirculationPumps?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricMotorsAndCirculationPumps?.tons
          : null,
      unitPrice: electricMotorsAndCirculationPumpsUnitPrice);

  /// Ilmanvaihtokoneet
  late final ventilationUnits = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.ventilationUnits?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.ventilationUnits?.tons
          : null,
      unitPrice: ventilationUnitsUnitPrice);

  /// Sähkökaapit ja mittarit
  late final electricalDistributionCabinetsAndMeters = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments
              ?.electricalDistributionCabinetsAndMeters?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricalDistributionCabinetsAndMeters?.tons
          : null,
      unitPrice: electricalDistributionCabinetsAndMetersUnitPrice);

  /// Huippuimurit
  late final roofExhaustFans = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.roofExhaustFans?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.roofExhaustFans?.tons
          : null,
      unitPrice: roofExhaustFansUnitPrice);

  List<RecyclableItem> get all => [
        concreteFrameBeams,
        concreteHollowSlabs,
        concreteRoofBeams,
        concreteWallElements,
        glulamBeams,
        floorSupportWoodenBeams,
        steelFrameBeams,
        rainGuttersAndDownspouts,
        fireLaddersAndWalkways,
        woodenRoofTrusses,
        steelRoofTrusses,
        steelChainLinkFence,
        aluminumChainLinkFence,
        woodAndFiberboardDoors,
        aluminumDoors,
        exteriorAndFireExitSteelDoors,
        woodenOrBoardCabinetsAndFurniture,
        steelLockerCabinets,
        woodenWindows,
        porcelainToilets,
        porcelainSinks,
        stainlessSteelSinksAndTables,
        saunaStoves,
        electricStoves,
        industrialElectricStoves,
        refrigerators,
        coldRoomCabinets,
        electricRadiators,
        smallElectricalAccumulators,
        largeElectricalAccumulators,
        electricMotorsAndCirculationPumps,
        ventilationUnits,
        electricalDistributionCabinetsAndMeters,
        roofExhaustFans,
      ];

  num? get totalVolume =>
      all.fold<num>(0, (acc, element) => acc + (element.volume ?? 0));

  num? get totalTons =>
      all.fold<num>(0, (acc, element) => acc + (element.tons ?? 0));

  num? get totalBatchPrice =>
      all.fold<num>(0, (acc, element) => acc + (element.batchPrice ?? 0));
}
