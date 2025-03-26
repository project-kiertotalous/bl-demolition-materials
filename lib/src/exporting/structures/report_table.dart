import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'report_table.freezed.dart';

@freezed
abstract class ReportTable with _$ReportTable {
  const ReportTable._();

  const factory ReportTable({required List<ReportTableRow> rows}) =
      _ReportTable;

  bool get hasBorders {
    if (rows.isEmpty) {
      return false;
    }

    return rows.any((row) => row.borders);
  }
}
