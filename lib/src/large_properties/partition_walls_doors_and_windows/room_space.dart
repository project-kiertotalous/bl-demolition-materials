import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'partition_walls_demolition_materials.dart';

part 'room_space.freezed.dart';

// Toimisto, aula, luokka, asumis, yms. tavanomaiset huonetilat
// Sisaltaa jokaiselle huoneelle olevat solut ja huoneen sisaiset laskettavat arvot

@freezed
class RoomSpace with _$RoomSpace {
  const RoomSpace._();

  const factory RoomSpace({
    num? woodFramedWallsLinearMeters,
    num? brickWallsLinearMeters,
    num? concreteElementOrCastingWallsLinearMeters,
    num? parOfWholeWallAreaInPercents,
    num? chipboard,
    num? cybroc,
    num? boardPanel,
    num? ceramicTileWalls,
    num? paintedPlasteredBrickWall,
    num? plasticCarpet,
  }) = _RoomSpace;

  num? get overallWallLengthLinearMeters => Utils.sumOrNull([
        woodFramedWallsLinearMeters,
        brickWallsLinearMeters,
        concreteElementOrCastingWallsLinearMeters
      ]);

  num? get overallWallArea {
    final internalWallFramesAndSurfaceMaterial =
        InternalWallFramesAndSurfaceMaterial();
    return overallWallLengthLinearMeters! *
        internalWallFramesAndSurfaceMaterial.averageHeightOfInternalWalls!;
  }

  // seinien pintarakenteen osuus kaikista valiseinista (seinapinta-alasta)
  num? get partOfAllPartitionWallsInPercents {
    final internalWallFramesAndSurfaceMaterial =
        InternalWallFramesAndSurfaceMaterial();
    return overallWallArea! / internalWallFramesAndSurfaceMaterial.totalArea!;
  }

  num? get overallPartitionWallsStructuresInPercents => Utils.sumOrNull([
        chipboard,
        cybroc,
        boardPanel,
        ceramicTileWalls,
        paintedPlasteredBrickWall,
        plasticCarpet
      ]);
}
