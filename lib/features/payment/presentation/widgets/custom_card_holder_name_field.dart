import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomCardholderNameField extends StatelessWidget {
  const CustomCardholderNameField(
      {super.key, required this.txt, required this.controller});

  final String txt;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Center(
        child: TextFormField(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: defaultTextColor100,
              ),
          decoration: InputDecoration(
            hintText: txt,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
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
          keyboardType: TextInputType.name,
        ),
      ),
    );
  }
}
