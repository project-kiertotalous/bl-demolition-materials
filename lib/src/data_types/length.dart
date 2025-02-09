import 'package:equatable/equatable.dart';

mixin LengthOperators on Length {
  Length operator +(Length other) {
    return fromValue(rawValue + other.rawValue);
  }

  Length operator -(Length other) {
    return fromValue(rawValue - other.rawValue);
  }

  Length operator /(Length other) {
    final result = rawValue / other.rawValue;

    if (result == double.infinity) {
      throw ArgumentError('Cannot divide with 0.');
    }

    return fromValue(result);
  }

  Length operator *(Length other) {
    return fromValue(rawValue * other.rawValue);
  }
}

sealed class Length extends Equatable {
  final double rawValue;

  Length(this.rawValue);

  Length fromValue(double value) {
    throw UnsupportedError(
        'Cannot directly instantiate length. Use sub-classes.');
  }

  @override
  List<Object?> get props => [rawValue];
}

final class Meter extends Length with LengthOperators {
  Meter(double value) : super(value);

  @override
  Meter fromValue(double value) => Meter(value);

  Millimeter toMillimeters() => Millimeter(rawValue * 1000);

  RunningMeter toRunningMeters() => RunningMeter(rawValue);

  @override
  String toString() => '${rawValue}m';
}

final class Millimeter extends Length {
  Millimeter(double value) : super(value);

  @override
  Millimeter fromValue(double value) => Millimeter(value);

  RunningMeter toRunningMeters() => RunningMeter(rawValue / 1000);

  Meter toMeters() => Meter(rawValue / 1000);

  @override
  String toString() => '${rawValue}mm';
}

final class RunningMeter extends Length {
  RunningMeter(double value) : super(value);

  @override
  RunningMeter fromValue(double value) => RunningMeter(value);

  Millimeter toMillimeters() => Millimeter(rawValue * 1000);

  Meter toMeters() => Meter(rawValue);

  @override
  String toString() => '${rawValue}jm';
}