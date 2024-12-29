import 'package:flutter/material.dart';
import 'package:owli_aleazm/features/home/presentation/views/my_home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashTrueViewBody extends StatefulWidget {
  const SplashTrueViewBody({super.key});

  @override
  State<SplashTrueViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashTrueViewBody> {
  @override
  void initState() {
    _checkToken();
    super.initState();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('firebase_token');

    // الانتقال بناءً على وجود التوكن
    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashTrueViewBody()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomeView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      "assets/images/splash_img.png",
      fit: BoxFit.fill,
    );
  }

  // Navigator.push(
  //     context, MaterialPageRoute(builder: (context) => const OnboardingView())
  //     // GoRouter.of(context).push(AppRouter.kOnboardingView);

  //     );
}
