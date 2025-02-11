import 'package:equatable/equatable.dart';

final class Percentage extends Equatable {
  final num rawValue;

  static final PERCENT_100 = Percentage(100);

  Percentage(this.rawValue);

  Percentage.fromFraction(double fraction) : rawValue = fraction * 100;

  Percentage operator +(Percentage other) {
    return Percentage(rawValue + other.rawValue);
  }

  Percentage operator -(Percentage other) {
    return Percentage(rawValue - other.rawValue);
  }

  Percentage operator /(Percentage other) {
    return Percentage(rawValue / other.rawValue);
  }

  Percentage operator *(Percentage other) {
    return Percentage(rawValue * other.rawValue);
  }

  @override
  List<Object> get props => [rawValue];

  @override
  String toString() {
    return '$rawValue %';
  }
}
