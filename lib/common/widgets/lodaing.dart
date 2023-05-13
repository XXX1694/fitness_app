import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(5.0),
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        color: Colors.white,
      ),
    );
  }
}
