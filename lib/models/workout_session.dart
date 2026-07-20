import 'package:gym_android/models/workout_set.dart';

class WorkoutSession {

  final String id;

  final String exerciseId;

  final String profileId;

  final DateTime date;

  final List<WorkoutSet> sets;

  WorkoutSession({required this.id, required this.exerciseId, required this.profileId, required this.date, required this.sets});

}