import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/features/choose/coach_choose/presentation/pages/coach_choose.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoachListPage extends StatelessWidget {
  const CoachListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        previousPageTitle: translation(context).back,
        middle: Text(translation(context).coach),
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: padding_horiontal),
          child: CoachChooseBlock()),
    );
  }
}
