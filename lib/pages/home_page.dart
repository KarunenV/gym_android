import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: const Center(child: HomeBody()),
    );

  }
}

  class HomeBody extends StatefulWidget {
    const HomeBody({super.key});

    @override
    State<HomeBody> createState() => _HomeBodyState();
  }

  class _HomeBodyState extends State<HomeBody> {


  bool isKarunen = true;
  bool isAlice = false; 

  @override
  Widget build(BuildContext context) {
    final bool hasSelection = isKarunen || isAlice;
    final today = DateTime.now().toLocal();
    final dateText = '${today.day}/${today.month}/${today.year}';

    final workoutCards = [
      _buildWorkoutCard(
        icon: Icons.arrow_upward,
        label: 'Upper',
        subtitle: _buildSubtitle(
          isKarunen: isKarunen,
          isAlice: isAlice,
          dateText: dateText,
        ),
        color: hasSelection
            ? Colors.blue.shade100
            : Colors.grey.shade300,
      ),
      _buildWorkoutCard(
        icon: Icons.arrow_downward,
        label: 'Lower',
        subtitle: _buildSubtitle(
          isKarunen: isKarunen,
          isAlice: isAlice,
          dateText: dateText,
        ),
        color: hasSelection
            ? Colors.green.shade100
            : Colors.grey.shade300,
      ),
      _buildWorkoutCard(
        icon: Icons.directions_run,
        label: 'Cardio',
        subtitle: _buildSubtitle(
          isKarunen: isKarunen ,
          isAlice: isAlice,
          dateText: dateText,
        ),
        color: hasSelection
            ? Colors.orange.shade100
            : Colors.grey.shade300,
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

  String _buildSubtitle({
    required bool isKarunen,
    required bool isAlice,
    required String dateText
  }) {
    if (isKarunen && isAlice) {
      return 'Karunen Last workout: $dateText\n\nAlice Last workout: $dateText';
    }

    if (isKarunen) {
      return 'Karunen Last workout: $dateText';
    }

    if (isAlice) {
      return 'Alice Last workout: $dateText';
    }

    return 'No trainee selected';
  }

  Widget _buildWorkoutCard({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
