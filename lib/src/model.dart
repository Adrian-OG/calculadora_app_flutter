import 'package:flutter/material.dart';

class Calculadora {
  double _a;
  double _b;

  Calculadora(this._a, this._b);

  double get geta {
    return _a;
  }

  set seta(double a) {
    this._a = a;
  }

  double get getb {
    return _b;
  }

  set setb(double b) {
    this._b = b;
  }
}
