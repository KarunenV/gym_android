import 'package:flutter/material.dart';
import 'package:gym_android/widgets/workout_card.dart';
import '../models/workout_group.dart';
import '../repositories/memory_workout_repository.dart';
import '../pages/exercise_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.repository});

  final MemoryWorkoutRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            const Icon(Icons.fitness_center, color: Colors.white),
            const SizedBox(width: 8),
            const Text('Gym Tracker'),
          ],
        ),
      ),
      body: Center(child: HomeBody(repository: repository)),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.repository});

  final MemoryWorkoutRepository repository;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool isKarunen = true;
  bool isAlice = false;

  @override
  Widget build(BuildContext context) {

    final workoutCards = [
      WorkoutCard(
        isKarunen: isKarunen,
        isAlice: isAlice,
        workoutGroup: WorkoutGroup.upper,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseListPage(
                workoutGroup: WorkoutGroup.upper,
                repository: widget.repository,
              ),
            ),
          );
        },
      ),
      WorkoutCard(
        isKarunen: isKarunen,
        isAlice: isAlice,
        workoutGroup: WorkoutGroup.lower,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseListPage(
                workoutGroup: WorkoutGroup.lower,
                repository: widget.repository,
              ),
            ),
          );
        },
      ),
      WorkoutCard(
        isKarunen: isKarunen,
        isAlice: isAlice,
        workoutGroup: WorkoutGroup.cardio,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseListPage(
                workoutGroup: WorkoutGroup.cardio,
                repository: widget.repository,
              ),
            ),
          );
        },
      ),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who is training today?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Karunen'),
                    value: isKarunen,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    onChanged: (bool? value) {
                      setState(() {
                        isKarunen = value ?? false;
                      });
                    },
                  ),
                  const Divider(height: 1),
                  CheckboxListTile(
                    title: const Text('Alice'),
                    value: isAlice,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    onChanged: (bool? value) {
                      setState(() {
                        isAlice = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Choose your workout',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    for (final card in workoutCards)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          width: double.infinity,
                          child: card,
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}
