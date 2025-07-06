import 'package:doctor_app/features/onbording/ui/widgets/onbording_screen_body.dart';
import 'package:flutter/material.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnbordingScreenBody()),
    );
  }
}
