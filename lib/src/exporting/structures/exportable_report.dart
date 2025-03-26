import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'exportable_report.freezed.dart';

/// A wrapper class used for building reports. As of writing, building reports
/// is done only by building tables. The API is crude, offering limited capabilities.
/// However, it acts as a bridge that allows easily exporting to both excel
/// and pdf files. In the future, more capabilities may be added.
///
/// See exporting_utils.dart for the build process. While the aim is for the
/// excel and pdf files to have feature-parity, there may be discrepancies.
/// Especially pdf files are hindered by the fact that exportable reports are
/// built only with tables.
@freezed
class ExportableReport with _$ExportableReport {
  const factory ExportableReport({required List<ReportTable> tables}) =
      _ExportableReport;
}
