import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomPhoneFiled extends StatefulWidget {
  const CustomPhoneFiled({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<CustomPhoneFiled> createState() => _CustomPhoneFiledState();
}

class _CustomPhoneFiledState extends State<CustomPhoneFiled> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: widget.controller,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: defaultTextColor100,
                ),
            decoration: InputDecoration(
              hintText: '+7(XXX) XXX-XX-XX',
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

            // focusNode: _loginFocus,
            // autofocus: true,
            // onFieldSubmitted: ((_) {
            //   _fieldFocusChange(
            //     context,
            //     _loginFocus,
            //     _passFocus,
            //   );
            // }),
            // controller: _usernameController,
            keyboardType: TextInputType.phone,
            inputFormatters: [maskFormatter],
          ),
        ),
      ),
    );
  }
}

var maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
