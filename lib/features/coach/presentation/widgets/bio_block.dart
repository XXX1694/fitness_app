import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/coach/data/models/coach_info.dart';
import 'package:flutter/material.dart';

class BioBlock extends StatelessWidget {
  const BioBlock({super.key, required this.coach});
  final CoachInfoModel coach;
  @override
  Widget build(BuildContext context) {
    final bio = coach.bio.toString();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
          child: Text(
            'BIO',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: defaultTextColor60),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
          child: Text(
            bio,
            overflow: TextOverflow.clip,
            maxLines: null,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  letterSpacing: -0.38,
                ),
          ),
        ),
      ],
    );
  }
}
