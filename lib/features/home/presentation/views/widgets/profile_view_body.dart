import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:owli_aleazm/features/auth/presentation/views/sign_in_sign_up_view.dart';
import 'package:owli_aleazm/features/auth/presentation/views/widgets/google_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'Build_profile_view_header.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  FirebasaServices firebasaServices = FirebasaServices();
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInSignUpView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BuildHeader(),
          const SizedBox(height: 40),
          // Container(
          //   decoration: BoxDecoration(
          //     border: Border.all(width: 1),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   margin:  const EdgeInsets.symmetric(horizontal: 10),
          //   padding: const EdgeInsets.all(20),
          //   alignment: Alignment.topRight,
          //   child: Text('الايمل : ${FirebaseAuth.instance.currentUser!.email}')),
          Container(margin: const EdgeInsets.all(20), child: const Divider()),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 160),
            child: CustomButton(
              onTap: () async {
                await FirebasaServices().signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInSignUpView()));
                logout(context);
              },
              text: "تسجيل الخروج",
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
