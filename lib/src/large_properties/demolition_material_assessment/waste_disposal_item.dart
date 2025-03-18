import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'waste_disposal_item.freezed.dart';

@freezed
abstract class WasteDisposalItem with _$WasteDisposalItem {
  const WasteDisposalItem._();

  const factory WasteDisposalItem(
      {num? volume,
      num? tons,
      num? demolitionOrProcessingCost}) = _WasteDisposalItem;

  num? get batchPrice =>
      Utils.multiplyOrNull([tons, demolitionOrProcessingCost]);
}
