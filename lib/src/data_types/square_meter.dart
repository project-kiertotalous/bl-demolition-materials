import 'package:equatable/equatable.dart';

final class SquareMeter extends Equatable {
  final double area;

  SquareMeter(this.area);

  factory SquareMeter.fromSquare(double length) => SquareMeter(length * length);

  factory SquareMeter.fromRectangle(double length, double width) =>
      SquareMeter(length * width);

  SquareMeter operator +(SquareMeter other) {
    return SquareMeter(area + other.area);
  }

  SquareMeter operator -(SquareMeter other) {
    return SquareMeter(area - other.area);
  }

  SquareMeter operator /(SquareMeter other) {
    if (other.area == 0) {
      throw ArgumentError('Cannot divide by zero area.');
    }

    return SquareMeter(area / other.area);
  }

  SquareMeter operator *(SquareMeter other) {
    return SquareMeter(area * other.area);
  }

  @override
  String toString() {
    return '${area}m²';
  }

  @override
  List<Object> get props => [area];
}
