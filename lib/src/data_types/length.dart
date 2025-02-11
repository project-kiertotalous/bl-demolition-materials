import 'package:equatable/equatable.dart';

final class Length extends Equatable {
  final num millimeters;

  num get meters => millimeters / 1000;

  num get runningMeters => meters;

  Length._(this.millimeters);

  Length.fromMeters(num meters) : this._(meters * 1000);

  Length.fromRunningMeters(num runningMeters) : this._(runningMeters * 1000);

  Length.fromMillimeters(num millimeters) : this._(millimeters);

  @override
  List<Object?> get props => [millimeters];

  @override
  String toString() => '$millimeters mm';
}
