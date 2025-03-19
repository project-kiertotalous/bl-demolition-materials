import 'package:freezed_annotation/freezed_annotation.dart';

part 'metals_and_alloys.freezed.dart';

/// metallit, niiden seokset (lejeeringit) mukaan luettuina
@freezed
abstract class MetalsAndAlloys with _$MetalsAndAlloys {
  const factory MetalsAndAlloys() = _MetalsAndAlloys;
}
