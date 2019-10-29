import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'app/injection/injector.dart';

void main() {
  Injector.configureFlavor(
      Flavor.PROD); // Select flavor build (PROD / DEBUG / MOCK)
  runApp(new MaterialApp(home: new CookingApp()));
}
