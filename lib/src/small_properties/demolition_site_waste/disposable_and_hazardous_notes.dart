import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'disposable_and_hazardous_notes.freezed.dart';
part 'disposable_and_hazardous_notes.g.dart';

/// betoni, tiilet, laatat ja keramiikka
@freezed
abstract class DisposableAndHazardousNotes with _$DisposableAndHazardousNotes {
  DisposableAndHazardousNotes._();

  factory DisposableAndHazardousNotes(
          {String? ceramicTilePorcelainAndGlassAndInsulationWoolNotes,
          String? nonRecyclableBrickWasteNotes,
          String? nonRecyclablePlasterBoardNotes,
          String? contaminatedSoilNotes,
          String? concreteContainingAsbestosNotes,
          String? mineriteOrFeltContainingAsbestosNotes,
          String? concreteContainingPcbPaintingNotes}) =
      _DisposableAndHazardousNotes;

  factory DisposableAndHazardousNotes.fromJson(Map<String, dynamic> json) =>
      _$DisposableAndHazardousNotesFromJson(json);
}
