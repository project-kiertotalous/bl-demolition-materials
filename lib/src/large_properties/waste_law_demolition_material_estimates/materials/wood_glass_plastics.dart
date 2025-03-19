import 'package:freezed_annotation/freezed_annotation.dart';

part 'wood_glass_plastics.freezed.dart';

/// puu, lasi ja muovit
@freezed
abstract class WoodGlassPlastics with _$WoodGlassPlastics {
  const factory WoodGlassPlastics() = _WoodGlassPlastics;
}
