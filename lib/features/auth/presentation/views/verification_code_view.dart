import 'package:flutter/material.dart';

import 'widgets/verification_code_view_body.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: VerificationCodeViewBody(),
        ),
      ),
    );
  }
}
