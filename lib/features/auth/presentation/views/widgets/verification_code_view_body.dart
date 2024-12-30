import 'package:flutter/material.dart';
import 'package:owli_aleazm/features/auth/presentation/views/sign_in_sign_up_view.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/styels.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'title_and_description.dart';

class VerificationCodeViewBody extends StatelessWidget {
  const VerificationCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TitleAndDescription(
              title: "رمز التحقق",
              description: "أدخل الرمز الذي أرسلناه إلى رقمك 012345*****",
            ),
            const SizedBox(height: 25),
            // const PinInputSection(),
            // Container(
            //   height: h * 0.15,
            //   width: w * 0.9,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(image: AssetImage('assets/images/password1.webp'))
            //   ),

            // ),
            const SizedBox(height: 35),
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/password1.webp'),
              ),
            ),
            const SizedBox(height: 200),
            CustomButton(
              onTap: () {
                // showAlertDialog(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignInSignUpView();
                }));
              },
              text: "أذهب ادخل الرمز الجديد",
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'لم تستلم الرمز؟',
                  style: Styles.textStyle16,
                ),
                Text(
                  ' إعادة ارسال',
                  style: Styles.textStyle16.copyWith(
                    color: AppColor.kPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
