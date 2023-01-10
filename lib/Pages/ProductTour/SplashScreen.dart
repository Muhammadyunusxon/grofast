import 'package:flutter/material.dart';
import 'package:grofast/Pages/ProductTour/Onboarding.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const TourPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const TourPage()),
        );
      },
      child: Image.asset(
        'images/tour/Welcome Screen.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
