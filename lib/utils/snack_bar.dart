import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String txt) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(0),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: defaultTextColor100.withOpacity(0.05),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ]),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              fontFamily: 'Articulat',
              color: defaultTextColor100,
            ),
          ),
        ),
      ),
    ),
  );
}
