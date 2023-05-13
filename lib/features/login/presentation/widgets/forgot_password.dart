import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Text(
          translation(context).forgot_password,
          style: TextStyle(
            fontFamily: 'Articulat',
            color: defaultTextColor60,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
