// OCP: Open-Closed Principle
// Software entities should be open for extension but closed for modification.

/// Bad Implementation
///```dart
///class Shape {
///  String type;
///
///  Shape(this.type);
///}
///
///class AreaCalculator {
///  double? calculateArea(Shape shape) {
///    if (shape.type == 'circle') {
///      // calculate area of circle
///    } else if (shape.type == 'square') {
///      // calculate area of square
///    }
///
///    return null;
///  }
///}
///```
/// Good Implementation
abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() => 3.14 * radius * radius;
}

class Square extends Shape {
  double side;

  Square(this.side);

  @override
  double calculateArea() => side * side;
}

class AreaCalculator {
  double calculateArea(Shape shape) => shape.calculateArea();
}
