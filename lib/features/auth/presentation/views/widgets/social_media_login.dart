import 'package:flutter/material.dart';
import 'package:owli_aleazm/features/auth/presentation/views/widgets/google_auth.dart';
import 'package:owli_aleazm/features/home/presentation/views/my_home_view.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';

class SocialMediaLogin extends StatefulWidget {
  const SocialMediaLogin({super.key});

  @override
  State<SocialMediaLogin> createState() => _SocialMediaLoginState();
}

class _SocialMediaLoginState extends State<SocialMediaLogin> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "خيارات تسجيل الدخول الأخرى",
          style: Styles.textStyle14.copyWith(
            color: AppColor.kBlackColor,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //   onTap: () {},
            //   child: const SocialMediaLoginItem(
            //     icon: Icons.apple_outlined,
            //     size: 30,
            //   ),
            // ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                await FirebasaServices().signInWithGoogle();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyHomeView()));
                setState(() {
                  isLoading = false;
                });
              },
              child: const SocialMediaLoginItem(
                icon: Icons.g_mobiledata,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            // InkWell(
            //   onTap: () {},
            //   child: const SocialMediaLoginItem(
            //     icon: Icons.facebook_outlined,
            //     size: 30,
            //   ),
            // ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

class SocialMediaLoginItem extends StatelessWidget {
  const SocialMediaLoginItem({
    super.key,
    this.icon,
    this.size,
  });

  final IconData? icon;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColor.kGrayTextColor.withOpacity(.5),
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}
