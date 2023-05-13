import 'package:flutter/material.dart';
import 'package:tamos_family_club/common/constants.dart';

class LeftBlock extends StatelessWidget {
  const LeftBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
      child: Row(
        children: const [
          Text('Total 11 left'),
        ],
      ),
    );
  }
}
