import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:chain_break/services/shared_preference_service.dart';

class ProgressProvider with ChangeNotifier, WidgetsBindingObserver {
  int _startTime =
      DateTime.now().millisecondsSinceEpoch; // Start time of the progress
  double _progress = 0.0; // Progress as a percentage (0.0 to 1.0)
  Timer? _timer;

  int _elapsedDays = 0; // Days elapsed
  int _elapsedHours = 0; // Hours elapsed within the current day
  int _elapsedMinutes = 0; // Minutes elapsed within the current hour
  int _elapsedSeconds = 0;

  double get progress => _progress;
  int get elapsedDays => _elapsedDays;
  int get elapsedHours => _elapsedHours;
  int get elapsedMinutes => _elapsedMinutes;
  int get elapsedSeconds => _elapsedSeconds;

  ProgressProvider() {
    _loadProgress(); // Load progress from shared preferences
    WidgetsBinding.instance.addObserver(this);
    _startTimer(); // Start updating progress in real-time
  }

  // Load progress from SharedPreferences
  Future<void> _loadProgress() async {
    final data = await StorageService.loadProgress();
    _startTime = data['startTime'];
    _progress = data['progress'];
    _updateElapsedTime(); // Calculate the elapsed days, hours, and minutes
    notifyListeners();
  }

  // Method to start the timer that updates progress every second
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateProgress();
    });
  }

  // Method to update the progress and elapsed time
  void updateProgress() {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final elapsedTime = currentTime - _startTime; // Calculate time passed

    // Update progress as a percentage of 24 hours
    _progress = (elapsedTime / (24 * 60 * 60 * 1000));
    if (_progress > 1.0) {
      _progress = 1.0; // Cap the progress at 100% after 24 hours
      _startTime = currentTime; // Reset start time after a full day
    }

    // Update elapsed time (days, hours, minutes)
    _updateElapsedTime();

    // Save progress to SharedPreferences
    StorageService.saveProgress(_startTime, _progress);
    notifyListeners(); // Notify listeners to update UI
  }

  // Calculate elapsed days, hours, and minutes from the start time
  void _updateElapsedTime() {
    final elapsedTime = DateTime.now().millisecondsSinceEpoch - _startTime;

    // Calculate the number of full days
    _elapsedDays = (elapsedTime ~/ (24 * 60 * 60 * 1000));

    // Calculate the remaining hours within the current day
    _elapsedHours = (elapsedTime ~/ (60 * 60 * 1000)) % 24;

    // Calculate the remaining minutes within the current hour
    _elapsedMinutes = (elapsedTime ~/ (60 * 1000)) % 60;

    _elapsedSeconds = (elapsedTime ~/ 1000 % 60);
  }

  // Handle app lifecycle state changes (e.g., saving progress when the app is paused)
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is paused, save progress
      StorageService.saveProgress(_startTime, _progress);
    } else if (state == AppLifecycleState.resumed) {
      // App is resumed, reload progress
      _loadProgress();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
