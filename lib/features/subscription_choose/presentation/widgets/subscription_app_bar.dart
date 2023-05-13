import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionAppBar extends StatelessWidget {
  const SubscriptionAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: deviceHeight * 0.10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                        size: 23,
                      ),
                      Text(
                        translation(context).back,
                        style: const TextStyle(
                          fontFamily: 'Articulat',
                          color: kPrimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Articulat',
                      color: defaultTextColor100,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CupertinoButton(
                  child: Text(
                    translation(context).skip,
                    style: const TextStyle(
                      fontFamily: 'Articulat',
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.41,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/main');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
