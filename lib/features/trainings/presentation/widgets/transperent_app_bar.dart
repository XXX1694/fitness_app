import 'package:tamos_family_club/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransperentAppBar extends StatelessWidget {
  const TransperentAppBar({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
      child: Row(
        children: [
          GestureDetector(
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              height: 23,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                txt,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.41,
                  fontFamily: 'Articulat',
                ),
              ),
            ),
          ),
          GestureDetector(
            child: SvgPicture.asset(
              'assets/icons/info.svg',
              height: 25,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
