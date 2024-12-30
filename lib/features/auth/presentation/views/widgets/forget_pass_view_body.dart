import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owli_aleazm/features/auth/presentation/views/verification_code_view.dart';
import 'title_and_description.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'form_item.dart';

class ForgetPassViewBody extends StatefulWidget {
  const ForgetPassViewBody({super.key});

  @override
  _ForgetPassViewBodyState createState() => _ForgetPassViewBodyState();
}

class _ForgetPassViewBodyState extends State<ForgetPassViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendOTPAndNavigate() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يرجى إدخال البريد الإلكتروني")),
      );
      return;
    }

    try {
      // إرسال رابط إعادة التعيين
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("تم إرسال رمز التحقق إلى بريدك الإلكتروني")),
      );

      // الانتقال إلى شاشة OTP
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return VerificationCodeView(email: email); // تمرير البريد إلى شاشة OTP
      }));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("حدث خطأ: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TitleAndDescription(
              title: "نسيت كلمة المرور؟",
              description:
                  "أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك، وسنرسل لك رمز التأكيد",
            ),
            const SizedBox(height: 25),
            FormItem(
              text: "البريد الالكتروني",
              keyboardType: TextInputType.emailAddress,
              hint: "ادخل بريدك الالكتروني",
              controller: _emailController,
            ),
            const SizedBox(height: 25),
            CustomButton(
              onTap: _sendOTPAndNavigate,
              text: "ارسال",
            ),
          ],
        ),
      ),
    );
  }
}
