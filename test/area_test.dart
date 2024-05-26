import 'dart:math';

import 'package:appdev_2/area.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appdev_2/main.dart';


void main(){
  test('Area should be 3.14 in case radius is 1', () {
    Exception e = Exception('Radius cannot be negative');
    Exception g = Exception('Radius is too large');
    Area area = Area();
    double bigNumber = -1;
    double result = area.circle(bigNumber);

    expect(() => area.circle(-1), throwsA(isInstanceOf<Exception>));
  });
}