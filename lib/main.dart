import 'package:chanzel_app/OnbourdingScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'home.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      home: FutureBuilder<bool>(
        future: _isOnboardingComplete(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: const Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.data == true) {
            return HomeScreen();
          } else {
            return const OnboardingScreen();
          }
        },
      ),
      useInheritedMediaQuery: true,
    );
  }

  Future<bool> _isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_complete') ?? false;
  }
}
