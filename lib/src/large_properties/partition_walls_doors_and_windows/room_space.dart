import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';
import 'partition_walls_demolition_materials.dart';

part 'room_space.freezed.dart';
part 'room_space.g.dart';

/// Toimisto, aula, luokka, asumis, yms. tavanomaiset huonetilat
/// Sisältää jokaiselle huoneelle olevat solut ja huoneen sisaiset laskettavat arvot
@freezed
abstract class RoomSpace with _$RoomSpace {
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

  factory RoomSpace.fromJson(Map<String, dynamic> json) =>
      _$RoomSpaceFromJson(json);

  num? get overallWallLengthLinearMeters => Utils.sumOrNull([
        woodFramedWallsLinearMeters,
        brickWallsLinearMeters,
        concreteElementOrCastingWallsLinearMeters
      ]);

  num? get overallWallArea {
    final internalWallFramesAndSurfaceMaterial =
        InternalWallFramesAndSurfaceMaterial();
    return Utils.multiplyOrNull([
      overallWallLengthLinearMeters,
      internalWallFramesAndSurfaceMaterial.averageHeightOfInternalWalls
    ]);
  }

  /// Seinien pintarakenteen osuus kaikista väliseinistä (seinäpinta-alasta)
  num? get partOfAllPartitionWallsInPercents {
    final internalWallFramesAndSurfaceMaterial =
        InternalWallFramesAndSurfaceMaterial();
    if (Utils.anyNull(
        [overallWallArea, internalWallFramesAndSurfaceMaterial.totalArea])) {
      return null;
    }
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
