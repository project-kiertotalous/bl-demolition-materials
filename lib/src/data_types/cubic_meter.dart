import 'package:equatable/equatable.dart';

final class CubicMeter extends Equatable {
  final double volume;

  CubicMeter(this.volume);

  factory CubicMeter.fromCube(double length, double width, double height) =>
      CubicMeter(length * width * height);

  CubicMeter operator +(CubicMeter other) {
    return CubicMeter(volume + other.volume);
  }

  CubicMeter operator -(CubicMeter other) {
    return CubicMeter(volume - other.volume);
  }

  CubicMeter operator /(CubicMeter other) {
    if (other.volume == 0) {
      throw ArgumentError('Cannot divide by zero area.');
    }

    return CubicMeter(volume / other.volume);
  }

  CubicMeter operator *(CubicMeter other) {
    return CubicMeter(volume * other.volume);
  }

  @override
  String toString() {
    return '${volume}m³';
  }

  @override
  List<Object> get props => [volume];
}
