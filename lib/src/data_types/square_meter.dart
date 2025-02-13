import 'package:equatable/equatable.dart';

final class SquareMeter extends Equatable {
  final num area;

  const SquareMeter(this.area);

  const SquareMeter.fromSquare(num length) : this(length * length);

  const SquareMeter.fromRectangle(num length, double width)
      : this(length * width);

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
