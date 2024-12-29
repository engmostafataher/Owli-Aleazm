import 'package:flutter/material.dart';

class CustomButtonHdaya extends StatelessWidget {
  const CustomButtonHdaya({super.key, this.text, this.onPressed});
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    double width(context) => MediaQuery.of(context).size.width;
    double height(context) => MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width(context),
        height: height(context) * .06,
        decoration: BoxDecoration(
            color: Color(0xFFA86B33), borderRadius: BorderRadius.circular(40)),
        child: Text(
          text!,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
