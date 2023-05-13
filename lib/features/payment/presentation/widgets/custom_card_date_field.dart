import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class CustomCardDateField extends StatelessWidget {
  const CustomCardDateField(
      {super.key, required this.txt, required this.controller});

  final String txt;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final MaskedTextController controller2 =
        MaskedTextController(mask: '00/00');
    return Container(
      height: 54,
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
          controller: controller2,
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
          onChanged: (value) {
            controller.text = controller2.text;
          },
          keyboardType: TextInputType.name,
        ),
      ),
    );
  }
}
