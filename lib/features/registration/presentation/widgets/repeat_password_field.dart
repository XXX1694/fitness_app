import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';

class RepeatPasswordField extends StatefulWidget {
  const RepeatPasswordField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<RepeatPasswordField> createState() => _RepeatPasswordFieldState();
}

class _RepeatPasswordFieldState extends State<RepeatPasswordField> {
  bool _obscureText = true;
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
        obscureText: _obscureText,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              _obscureText = !_obscureText;
            }),
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: defaultTextColor60,
            ),
          ),
          hintText: translation(context).repeat_password,
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
        controller: widget.controller,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }
}
