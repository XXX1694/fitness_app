import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/trainings/presentation/pages/about_training.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GroupByTimeList extends StatelessWidget {
  const GroupByTimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        color: Color(0XFFFAFAFA),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: defaultTextColor100.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView.builder(
          itemBuilder: (context, index) => CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AboutTraingingPage(title: 'Секция ${index + 1}'),
                ),
              );
            },
            padding: const EdgeInsets.all(0),
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '11:00 - 11:55',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: defaultTextColor60,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zumba',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.38,
                                  wordSpacing: 20.4,
                                ),
                          ),
                          Text(
                            'Aru',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.38,
                                  color: defaultTextColor60,
                                  wordSpacing: 20.4,
                                ),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        '0/30',
                        style: TextStyle(
                          fontFamily: 'Articulat',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: trueColor,
                          letterSpacing: -0.38,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        height: 11,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
