import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'table.freezed.dart';

@freezed
abstract class Table with _$Table {
  const factory Table({required List<Row> rows}) = _Table;
}
