import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Rozybakiev Club',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Spacer(),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.pushNamed(context, '/sections');
            },
            child: SvgPicture.asset(
              'assets/icons/list_icon.svg',
              // ignore: deprecated_member_use
              color: kPrimaryColor,
              height: 14,
            ),
          ),
        ],
      ),
    );
  }
}
