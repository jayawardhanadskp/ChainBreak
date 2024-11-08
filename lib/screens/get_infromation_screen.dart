import 'package:flutter/material.dart';

class GetInformationScreen extends StatefulWidget {
  const GetInformationScreen({super.key});

  @override
  State<GetInformationScreen> createState() => _GetInformationScreenState();
}

class _GetInformationScreenState extends State<GetInformationScreen> {
  final List<String> smokingTimes = [
    'After meal', 
    'When stressed', 
    'Morning', 
    'Free time', 
    'With coffee', 
  ];

  int cigarettesPerDay = 0;
  int cigarettesInPack = 0;
  int yearsSmoked = 0;
  double pricePerPack = 0.0;
  List<String> selectedTimes = [];

  Widget _buildNumberInput(String label, int value, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () => onChanged(value - 1 >= 0 ? value - 1 : 0),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () => onChanged(value + 1),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Personalize Your Quit Plan', 
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tell us a bit about your smoking habits to get started .We’ll use this information to track your progress and show you how much money you’re saving',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                _buildNumberInput(
                  'Cigarettes smoked per day', 
                  cigarettesPerDay,
                  (value) => setState(() => cigarettesPerDay = value),
                ),
                const SizedBox(height: 20),
                _buildNumberInput(
                  'Cigarettes in a pack', 
                  cigarettesInPack,
                  (value) => setState(() => cigarettesInPack = value),
                ),
                const SizedBox(height: 20),
                _buildNumberInput(
                  'Years of smoking', // 
                  yearsSmoked,
                  (value) => setState(() => yearsSmoked = value),
                ),
                const SizedBox(height: 20),
                _buildNumberInput(
                  'Price per pack', // 
                  pricePerPack.toInt(),
                  (value) => setState(() => pricePerPack = value.toDouble()),
                ),
                const SizedBox(height: 30),
                const Text(
                  'What time you’re Smoking?', 
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: smokingTimes.map((time) {
                    return FilterChip(
                      label: Text(time),
                      selected: selectedTimes.contains(time),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedTimes.add(time);
                          } else {
                            selectedTimes.remove(time);
                          }
                        });
                      },
                      backgroundColor: Colors.grey[200],
                      selectedColor: Colors.blue[100],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the start action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Let\'s Start', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
