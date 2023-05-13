import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';

class CurrentPass extends StatelessWidget {
  const CurrentPass({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: defaultTextColor100.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: defaultTextColor100,
            ),
        decoration: InputDecoration(
          hintText: translation(context).current_pass,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }
}
