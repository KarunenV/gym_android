import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'repositories/mock/mock_workout_repository.dart';
import 'repositories/mock/mock_profile_repository.dart';

void main() {
  runApp(const GymTrackerApp());
}

class GymTrackerApp extends StatelessWidget {
  const GymTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = MockMemoryWorkoutRepository();
    final profileRepository = MockMemoryProfileRepository();

    return MaterialApp(
      title: 'Gym Tracker',
      debugShowCheckedModeBanner: false,
      home: HomePage(exercisesRepository: repository, profileRepository: profileRepository),
    );
  }
}