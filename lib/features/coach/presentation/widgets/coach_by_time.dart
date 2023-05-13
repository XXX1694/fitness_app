import 'package:tamos_family_club/features/coach/presentation/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';

class CoachByTime extends StatelessWidget {
  const CoachByTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomDatePicker(),
      ],
    );
  }
}
