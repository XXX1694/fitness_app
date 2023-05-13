import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/coach/data/models/coach_info.dart';
import 'package:flutter/material.dart';

class TopInfo extends StatelessWidget {
  const TopInfo({super.key, required this.coach});
  final CoachInfoModel coach;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.asset('assets/img/man.png'),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          coach.first_name.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 24,
                              ),
                        ),
                        const Text(' '),
                        Text(
                          coach.last_name.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 24,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      '@inst',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Trainer, Nutritionist',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: defaultTextColor60,
                          ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 23),
            Row(
              children: [
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      'Rating',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      coach.rating.toString(),
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 24,
                              ),
                    ),
                  ],
                ),
                const SizedBox(width: 33),
                Column(
                  children: [
                    Text(
                      'Comments',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      coach.comments_amount.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
