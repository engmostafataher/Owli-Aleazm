import 'package:flutter/material.dart';
import 'package:owli_aleazm/features/auth/presentation/views/sign_in_sign_up_view.dart';
import 'package:owli_aleazm/features/home/presentation/views/my_home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    checkToken();

    super.initState();
  }

  Future<void> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    await Future.delayed(Duration(seconds: 3),(){
  if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomeView()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInSignUpView()),
      );
    }
    });
  
  }
  //   Future<void> _checkAndStoreToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // الحصول على التوكن من Firebase
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     String? token = await user.getIdToken();

  //     if (token != null && token.isNotEmpty) {
  //       // تخزين التوكن
  //       await prefs.setString('firebase_token', token);
  //       print("Token stored: $token");

  //       // الانتقال إلى الصفحة المناسبة
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const MyHomeView()),
  //       );
  //       return;
  //     }
  //   }

  //   // إذا لم يكن هناك توكن، الانتقال إلى صفحة Onboarding
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => const OnboardingView()),
  //   );
  // }

//   Future<void> saveToken(String token) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('firebase_token', token);
// }
// Future<void> storeFirebaseToken() async {
//   User? user = FirebaseAuth.instance.currentUser;

//   if (user != null) {
//     // الحصول على التوكن
//     String? token = await user.getIdToken();

//     if (token != null) {
//       // تخزين التوكن
//       await saveToken(token);
//       print("Token stored: $token");
//     }
//   }
// }
  //  Future<void> _checkToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('firebase_token');

  //   // الانتقال بناءً على وجود التوكن
  //   if (token != null && token.isNotEmpty) {
  //     Navigator.pushReplacement(
  //       context,MaterialPageRoute(builder: (context) => const OnboardingView()),

  //     );
  //   } else {
  //     Navigator.pushReplacement(
  //       context,

  //       MaterialPageRoute(builder: (context) => const MyHomeView()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      "assets/images/splash_img.png",
      fit: BoxFit.fill,
    );
  }

  // void navigateToOnboarding()  {

  //   Future.delayed(const Duration(seconds: 3), () {

  //   });

  // Navigator.push(
  //     context, MaterialPageRoute(builder: (context) => const OnboardingView())
  //     // GoRouter.of(context).push(AppRouter.kOnboardingView);

  //     )
}
