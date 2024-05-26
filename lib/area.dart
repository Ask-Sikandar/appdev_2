import 'dart:math';

class Area{
  double circle(double radius) {
    Exception e = Exception('Radius cannot be negative');
    Exception g = Exception('Radius is too large');

    // Error handling for negative values
    if (radius < 0) {
      throw Exception("Radius cannot be negative");
    }

    // Error handling for very big numbers
    if (radius > 1e9) {
      throw g;
    }

    return radius * radius * 3.14159265359;
  }

  double rectangle(double length, double width){
    return length * width;
  }
}

extension NumSquare on num {
  num get square => this * this;
}