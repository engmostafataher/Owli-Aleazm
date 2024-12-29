import 'package:flutter/material.dart';
import 'widgets/splash_true_view_body.dart';

class SplashTrueView extends StatelessWidget {
  const SplashTrueView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SplashTrueViewBody(),
      ),
    );
  }
}
