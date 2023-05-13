import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';

class SignUpTransition extends StatelessWidget {
  const SignUpTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          translation(context).have_an_account,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Text(' '),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/registration/first');
          },
          child: Text(
            translation(context).sign_up,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
