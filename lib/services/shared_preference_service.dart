import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Keys for SharedPreferences
  static const String _startTimeKey = 'start_time';
  static const String _progressKey = 'progress';

  // Load the saved start time and progress
  static Future<Map<String, dynamic>> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    int startTime =
        prefs.getInt(_startTimeKey) ?? DateTime.now().millisecondsSinceEpoch;
    double progress = prefs.getDouble(_progressKey) ?? 0.0;

    return {'startTime': startTime, 'progress': progress};
  }

  // Save the start time and progress
  static Future<void> saveProgress(int startTime, double progress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_startTimeKey, startTime);
    await prefs.setDouble(_progressKey, progress);
    print('data saved');
  }
}
