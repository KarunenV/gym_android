import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../models/workout_set.dart';

class WorkoutEntryPage extends StatefulWidget {
  final Exercise exercise;

  const WorkoutEntryPage({
    super.key,
    required this.exercise,
  });

  @override
  State<WorkoutEntryPage> createState() => _WorkoutEntryPageState();  
}

class _WorkoutEntryPageState extends State<WorkoutEntryPage> {
  final List<WorkoutSet> previousWorkout = [
  WorkoutSet(reps: 10, weight: 30),
  WorkoutSet(reps: 10, weight: 35),
  WorkoutSet(reps: 8, weight: 40),
];

  late List<WorkoutSet> currentWorkout;

  @override
  void initState() {
    super.initState();
    currentWorkout = List<WorkoutSet>.from(previousWorkout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Entry - ${widget.exercise.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Previous Workout',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            ...previousWorkout.map((set) => Text('Reps: ${set.reps}, Weight: ${set.weight} kg')),
            const SizedBox(height: 24),
            Text(
              'Current Workout',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            ...currentWorkout.map((set) => Text('Reps: ${set.reps}, Weight: ${set.weight} kg')),
          ],
        ),
      ),
    );
  }
}