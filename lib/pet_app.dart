import 'package:flutter/material.dart';
import 'package:pet_finder_app/feature/home/presentation/views/home_view.dart';

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}