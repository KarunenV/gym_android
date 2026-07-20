import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'repositories/memory_workout_repository.dart';

void main() {
  runApp(const GymTrackerApp());
}

class GymTrackerApp extends StatelessWidget {
  const GymTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = MemoryWorkoutRepository();

    return MaterialApp(
      title: 'Gym Tracker',
      debugShowCheckedModeBanner: false,
      home: HomePage(repository: repository),
    );
  }
}