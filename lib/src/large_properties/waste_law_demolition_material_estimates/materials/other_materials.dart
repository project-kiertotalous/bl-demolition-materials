import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_materials.freezed.dart';

/// muut rakentamisessa ja purkamisessa syntyvät jätteet
@freezed
abstract class OtherMaterials with _$OtherMaterials {
  const factory OtherMaterials() = _OtherMaterials;
}
