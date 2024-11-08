import 'package:chain_break/services/shared_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressProvider with ChangeNotifier, WidgetsBindingObserver {
  int _startTime = DateTime.now().millisecondsSinceEpoch;
  double _progress = 0.0;

  double get progress => _progress;

  ProgressProvider() {
    _loadProgress();
    WidgetsBinding.instance.addObserver(this); // Observe app lifecycle
  }

  // Method to load progress from SharedPreferences
  Future<void> _loadProgress() async {
    final data = await StorageService.loadProgress();
    _startTime = data['startTime'];
    _progress = data['progress'];
    print(data['progress']);
    notifyListeners(); // Notify listeners when progress is loaded
  }

  // Method to update progress
  void updateProgress() {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final elapsedTime = currentTime - _startTime;

    // Calculate the progress as a percentage of the 24 hours
    _progress =
        (elapsedTime / (24 * 60 * 60 * 1000)); // 24 hours in milliseconds
    if (_progress > 1.0) {
      _progress = 1.0; // Clamp to a max of 100%
      _startTime = currentTime; // Reset the timer after 24 hours
    }

    // Save the progress and start time to SharedPreferences
    StorageService.saveProgress(_startTime, _progress);
    
    notifyListeners(); // Notify listeners to update UI
  }

  // Override the didChangeAppLifecycleState method to handle app backgrounding
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App has been backgrounded, save progress
      StorageService.saveProgress(_startTime, _progress);
    } else if (state == AppLifecycleState.resumed) {
      // App has resumed, load progress (or recalculate if necessary)
      _loadProgress();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Clean up observer
    super.dispose();
  }
}
