import 'package:bl_demolition_materials/src/reports/structures/styles/line_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'table.freezed.dart';

@freezed
abstract class Table with _$Table {
  const Table._();

  const factory Table({required List<Row> rows}) = _Table;

  bool get hasBorders {
    if (rows.isEmpty) {
      return false;
    }

    return rows
        .any((row) => row.borderStyle.any((style) => style == LineStyle.solid));
  }
}
