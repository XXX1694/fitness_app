import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/custom_radio_button.dart';

class ClientAgreement extends StatelessWidget {
  const ClientAgreement({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRadioButton(controller: controller),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: translation(context).i_agree,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: defaultTextColor100,
                      ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: translation(context).agreement,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: kPrimaryColor,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushNamed('/rules');
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
