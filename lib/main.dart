import 'package:chanzel_app/login_cubit.dart';
import 'package:chanzel_app/login_page.dart';
import 'package:chanzel_app/sigup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'CartManager.dart';
import 'OnbourdingScreen.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => CartManager(),
        child: MyApp(),
      ),
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
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.data == true) {
            // Show EmailPage instead of HomeScreen
            return EmailPage(
              controller2: SigupCubit(), 
              controller: LoginCubit(), 
            );
          } else {
            return OnboardingScreen();
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
