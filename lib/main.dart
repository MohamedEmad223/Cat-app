import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/pet_app.dart';

void main() {
  initDependency();
  runApp(const PetApp());
}
