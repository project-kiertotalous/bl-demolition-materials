import 'package:equatable/equatable.dart';

final class CubicMeter extends Equatable {
  final num volume;

  CubicMeter(this.volume);

  factory CubicMeter.fromCube(num length, num width, num height) =>
      CubicMeter(length * width * height);

  CubicMeter operator +(CubicMeter other) {
    return CubicMeter(volume + other.volume);
  }

  CubicMeter operator -(CubicMeter other) {
    return CubicMeter(volume - other.volume);
  }

  CubicMeter operator /(CubicMeter other) {
    return CubicMeter(volume / other.volume);
  }

  CubicMeter operator *(CubicMeter other) {
    return CubicMeter(volume * other.volume);
  }

  @override
  String toString() {
    return '${volume} m³';
  }

  @override
  List<Object> get props => [volume];
}
