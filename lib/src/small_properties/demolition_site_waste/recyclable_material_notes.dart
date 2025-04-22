import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'recyclable_material_notes.freezed.dart';
part 'recyclable_material_notes.g.dart';

/// betoni, tiilet, laatat ja keramiikka
@freezed
abstract class RecyclableMaterialNotes with _$RecyclableMaterialNotes {
  RecyclableMaterialNotes._();

  factory RecyclableMaterialNotes(
      {String? cleanSoilNotes,
      String? asphaltWasteNotes,
      String? cleanConcreteNotes,
      String? steelNotes,
      String? wallAndRoofTilesNotes,
      String? cleanUsableWoodNotes,
      String? combustibleWoodWasteNotes,
      String? windProtectionBoardNotes,
      String? glassAndMineralWoolNotes,
      String? gypsumBoardsNotes,
      String? chipboardNotes,
      String? energyWasteNotes,
      String? glassNotes,
      String? aluminiumNotes,
      String? rebarAndSteelScrapNotes,
      String? stainlessSteelNotes,
      String? copperNotes,
      String? concreteBlocksNotes}) = _RecyclableMaterialNotes;

  factory RecyclableMaterialNotes.fromJson(Map<String, dynamic> json) =>
      _$RecyclableMaterialNotesFromJson(json);
}
