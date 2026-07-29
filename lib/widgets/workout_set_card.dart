import 'package:flutter/material.dart';
import '../models/workout_set.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutSet workoutSet;

  const WorkoutCard({
    super.key,
    required this.workoutSet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workout Set',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text('Reps: ${workoutSet.reps}'),
            Text('Weight: ${workoutSet.weight} kg'),
          ],
        ),
      ),
    );
  }
}