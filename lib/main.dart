import 'package:chain_break/firebase_options.dart';
import 'package:chain_break/providers/auth_provider.dart';
import 'package:chain_break/providers/bottom_navigationbar_provider.dart';
import 'package:chain_break/providers/process_provider.dart';
import 'package:chain_break/screens/authentication/onboard_screen.dart';
import 'package:chain_break/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProgressProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavigationBarProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chain Break App',
      theme: lightTheme,
      home: const OnboardScreen(),
    );
  }
}
