import 'package:flutter/material.dart';

void chaingeLang(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        child: child,
      );
    },
  );
}
