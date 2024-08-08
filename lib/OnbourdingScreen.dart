import 'package:chanzel_app/home.dart';
import 'package:chanzel_app/login_cubit.dart';
import 'package:chanzel_app/sigup_cubit.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

import 'package:shared_preferences/shared_preferences.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPageContent() {
    return [
      _buildPage(
        imagePath: 'assets/dress.jpg',
        title: 'Your Own Style',
        description: 'Smart, gorgeous & fashionable collection makes you cool.',
      ),
      _buildPage(
        imagePath: 'assets/skirt.jpg',
        title: 'Discover Trends',
        description: 'We are here to provide a variety of the best fashion.',
      ),
      _buildPage(
        imagePath: 'assets/pants.jpeg',
        title: 'Latest Outfit',
        description: 'Express yourself through the art of fashion.',
      ),
    ];
  }

  Widget _buildPage({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 200.0),
          SizedBox(height: 20.0),
          Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Text(
            description,
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, (int index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          height: 8.0,
          width: _currentPage == index ? 24.0 : 16.0,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.brown : Colors.grey,
            borderRadius: BorderRadius.circular(12.0),
          ),
        );
      }),
    );
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => EmailPage(
              controller2: SigupCubit(), 
              controller: LoginCubit(),
            )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _buildPageContent(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: _buildIndicator(),
          ),
          Positioned(
            bottom: 50.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.animateToPage(
                    _currentPage + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  _completeOnboarding();
                }
              },
              child: Icon(Icons.arrow_forward),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
