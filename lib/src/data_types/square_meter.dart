import 'package:equatable/equatable.dart';

final class SquareMeter extends Equatable {
  final num area;

  SquareMeter(this.area);

  factory SquareMeter.fromSquare(num length) => SquareMeter(length * length);

  factory SquareMeter.fromRectangle(num length, double width) =>
      SquareMeter(length * width);

  SquareMeter operator +(SquareMeter other) {
    return SquareMeter(area + other.area);
  }

  SquareMeter operator -(SquareMeter other) {
    return SquareMeter(area - other.area);
  }

  SquareMeter operator /(SquareMeter other) {
    return SquareMeter(area / other.area);
  }

  SquareMeter operator *(SquareMeter other) {
    return SquareMeter(area * other.area);
  }

  @override
  String toString() {
    return '${area} m²';
  }

  @override
  List<Object> get props => [area];
}
