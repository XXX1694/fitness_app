import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/choose/coach_choose/presentation/pages/coach_choose.dart';
import 'package:tamos_family_club/features/coach/presentation/widgets/coach_by_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoachPage extends StatefulWidget {
  const CoachPage({super.key});

  @override
  State<CoachPage> createState() => _CoachPageState();
}

int? sliding = 0;

class _CoachPageState extends State<CoachPage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: deviceHeight * 0.18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Rozybakiev Club',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 9),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl(
                    backgroundColor: kPrimaryColor.withOpacity(0.12),
                    children: {
                      0: Text(
                        translation(context).try_again,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 13),
                      ),
                      1: Text(
                        translation(context).coaches,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 13),
                      ),
                    },
                    onValueChanged: (int? value) => {
                      setState(
                        () {
                          sliding = value;
                        },
                      )
                    },
                    groupValue: sliding,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                sliding == 1 ? const CoachChooseBlock() : const CoachByTime(),
          ),
        ],
      ),
    );
  }
}
