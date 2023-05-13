import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

bool pressed = false;

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.controller.text == '1') {
            widget.controller.clear();
          } else {
            widget.controller.text = '1';
          }
          pressed = !pressed;
        });
      },
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: defaultTextColor100.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: pressed
              ? SvgPicture.asset(
                  'assets/icons/check_icon.svg',
                  height: 11,
                  color: kPrimaryColor,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
