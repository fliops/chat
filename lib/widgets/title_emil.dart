import 'package:email/widgets/constants.dart';
import 'package:flutter/material.dart';

class TitleEmail extends StatelessWidget {
  TitleEmail({
    super.key,
    required this.titleEmail,
  });
  String titleEmail;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleEmail,
      style: const TextStyle(
        color: kPrimarycolor,
        fontSize: 19,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        height: 0,
      ),
    );
  }
}
