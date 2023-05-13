import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: Colors.white,
      leading: CupertinoButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              CupertinoIcons.back,
              color: kPrimaryColor,
            ),
            Text(
              translation(context).back,
              style: const TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
      middle: Text(
        title,
        style: TextStyle(color: defaultTextColor100),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
