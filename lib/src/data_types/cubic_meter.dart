import 'package:equatable/equatable.dart';

final class CubicMeter extends Equatable {
  final num volume;

  const CubicMeter(this.volume);

  const CubicMeter.fromCube(num length, num width, num height)
      : this(length * width * height);

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
