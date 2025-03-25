import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'report.freezed.dart';

@freezed
class Report with _$Report {
  const factory Report({required List<Table> tables}) = _Report;
}
