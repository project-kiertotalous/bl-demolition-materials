import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';

part 'small_properties_recyclable_item.freezed.dart';

@freezed
abstract class SmallPropertiesRecyclableItem
    with _$SmallPropertiesRecyclableItem {
  const SmallPropertiesRecyclableItem._();

  const factory SmallPropertiesRecyclableItem({
    num? size,
    num? volume,
    num? tons,
    num? unitPrice,
  }) = _SmallPropertiesRecyclableItem;

  num? get batchPrice => Utils.sumOrNull([unitPrice, tons]);
}
