/// Gives hints to the report exporting util. Hints are a workaround around the
/// fact that we need to work with tables. Hints can be used for giving, well,
/// hints to the exporter.
///
/// For example, the 'title' hint tells the pdf exporting method to render the
/// table in a special way.
enum Hint { title, ghost, slim, none }
