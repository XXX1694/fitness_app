import 'package:tamos_family_club/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrainingMainInfo extends StatelessWidget {
  const TrainingMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '6 august',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            '12:00-12:55',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/profile_disable.svg',
                height: 26,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                'Aru',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 28,
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}
