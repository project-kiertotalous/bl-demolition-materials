import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/demolition_material_assessment/recyclable_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recyclable_components_and_furniture.freezed.dart';

/// KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET
@freezed
class RecyclableComponentsAndFurniture with _$RecyclableComponentsAndFurniture {
  RecyclableComponentsAndFurniture._();

  factory RecyclableComponentsAndFurniture({
    TotalIntermediateFloors? totalIntermediateFloors,
    TotalRoofs? totalRoofs,
    TotalBuildingFrame? totalBuildingFrame,
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
    num? electricalCabinetsAndMetersUnitPrice,
    num? roofExhaustFansUnitPrice,
  }) = _RecyclableComponentsAndFurniture;

  // Betonipalkit, runko
  late final concreteFrameBeams = RecyclableItem(
      volume:
          (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
              ? totalBuildingFrame?.concreteVerticalColumnsPart.concreteVolume
              : null,
      tons: (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
          ? totalBuildingFrame?.concreteVerticalColumnsPart.concreteTons
          : null,
      unitPrice: concreteFrameBeamsUnitPrice);

  // Betoniset ontelolaatat
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

  // Betoniset kattopalkit
  late final concreteRoofBeams = RecyclableItem(
      volume: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.concreteVolume
          : 0,
      tons: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.concreteTons
          : 0,
      unitPrice: concreteRoofBeamsUnitPrice);

  // Betoniset seinäelementit
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

  // Liimapalkit
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

  // Puupalkit (kantavat lattiapalkit)
  late final floorSupportWoodenBeams = RecyclableItem(
      volume: totalBuildingFrame?.glulamBeamsPart.woodVolume,
      tons: totalBuildingFrame?.glulamBeamsPart.woodTons,
      unitPrice: floorSupportWoodenBeamsUnitPrice);

  // Teräspalkit, runkopalkit
  late final steelFrameBeams = RecyclableItem(
      tons: totalBuildingFrame?.steelVerticalColumnsPart.steelTons,
      unitPrice: steelFrameBeamsUnitPrice);

  // Sadevesikourut ja rännit (m)
  late final rainGuttersAndDownspouts = RecyclableItem(); // TODO

  // Palotikkaat ja kulkusillat (m)
  late final fireLaddersAndWalkways = RecyclableItem(); // TODO

  // Puiset kattoristikot
  late final woodenRoofTrusses = RecyclableItem(); // TODO

  // Teräksiset kattoristikot
  late final steelRoofTrusses = RecyclableItem(); // TODO

  // Teräsverkko aita (m)
  late final steelChainLinkFence = RecyclableItem(); // TODO

  // Alumiiniverkko aita (m)
  late final aluminumChainLinkFence = RecyclableItem(); // TODO

  // Puuovet ja kuitulevyovet
  late final woodAndFiberboardDoors = RecyclableItem(); // TODO

  // Alumiiniovet
  late final aluminumDoors = RecyclableItem(); // TODO

  // Teräsovet (ulko ja palo-ovet)
  late final exteriorAndFireExitSteelDoors = RecyclableItem(); // TODO

  // Kaapit ja kalusteet, puu tai levy (keittiö ja sosiaalitilat)
  late final woodenOrBoardCabinetsAndFurniture = RecyclableItem(); // TODO

  // Teräksiset pukukaapit
  late final steelLockerCabinets = RecyclableItem(); // TODO

  // Puuiset ikkunat
  late final woodenWindows = RecyclableItem(); // TODO

  // WC-istuin, posliini
  late final porcelainToilets = RecyclableItem(); // TODO

  // Pesuallas, posliini
  late final porcelainSinks = RecyclableItem(); // TODO

  // Teräsaltaat ja pöydät (ruostumaton)
  late final stainlessSteelSinksAndTables = RecyclableItem(); // TODO

  // Saunankiukaat
  late final saunaStoves = RecyclableItem(); // TODO

  // Sähköliedet
  late final electricStoves = RecyclableItem(); // TODO

  // Suurtalous sähköliedet
  late final industrialElectricStoves = RecyclableItem(); // TODO

  // Jääkaapit
  late final refrigerators = RecyclableItem(); // TODO

  // Kylmiökaapit
  late final coldRoomCabinets = RecyclableItem(); // TODO

  // Lämpöpatterit, sähkö
  late final electricRadiators = RecyclableItem(); // TODO

  // Vesivaraajat, pienet
  late final smallElectricalAccumulators = RecyclableItem(); // TODO

  // Vesivaraajat, suuret
  late final largeElectricalAccumulators = RecyclableItem(); // TODO

  // Sähkömoottorit ja kiertovesipumput
  late final electricMotorsAndCirculationPumps = RecyclableItem(); // TODO

  // Ilmanvaihtokoneet
  late final ventilationUnits = RecyclableItem(); // TODO

  // Sähkökaapit ja mittarit
  late final electricalCabinetsAndMeters = RecyclableItem(); // TODO

  // Huippuimurit
  late final roofExhaustFans = RecyclableItem(); // TODO

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
        electricalCabinetsAndMeters,
        roofExhaustFans,
      ];

  num? get totalVolume =>
      all.fold<num>(0, (acc, element) => acc + (element.volume ?? 0));

  num? get totalTons =>
      all.fold<num>(0, (acc, element) => acc + (element.tons ?? 0));

  num? get totalBatchPrice =>
      all.fold<num>(0, (acc, element) => acc + (element.batchPrice ?? 0));
}
