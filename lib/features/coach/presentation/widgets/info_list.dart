import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/coach/data/models/coach_info.dart';
import 'package:flutter/material.dart';

class InfoList extends StatelessWidget {
  const InfoList({super.key, required this.coach});
  final CoachInfoModel coach;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                translation(context).club,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: defaultTextColor100),
              ),
              const Spacer(),
              Text(
                coach.club_name.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                translation(context).time,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: defaultTextColor100),
              ),
              const Spacer(),
              Text(
                coach.work_time.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                translation(context).weekdays,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: defaultTextColor100),
              ),
              const Spacer(),
              Text(
                'Mon, Wed, Fri',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                translation(context).type,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: defaultTextColor100),
              ),
              const Spacer(),
              Text(
                'Group',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                translation(context).price,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: defaultTextColor100),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    coach.trainer_subscription_price.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: kPrimaryColor),
                  ),
                  Text(
                    'KZT',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: kPrimaryColor),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
        ],
      ),
    );
  }
}
