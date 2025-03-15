import 'package:bl_demolition_materials/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'waste_cost_item.freezed.dart';

/// A separate item in 'Purkujätteet ja kustannukset'
@freezed
class WasteCostItem with _$WasteCostItem {
  const WasteCostItem._();

  const factory WasteCostItem({
    num? volume,
    num? tons,
    num? demolitionCost,
  }) = _WasteCostItem;

  num? get totalMaterialCost => Utils.multiplyOrNull([tons, demolitionCost]);
}
