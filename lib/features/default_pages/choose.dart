import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/features/choose/club_choose/presentation/pages/club_choose.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

int? sliding = 0;

class _ChoosePageState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        previousPageTitle: translation(context).back,
        middle: Text(translation(context).choose),
      ),
      body: const SafeArea(
        child: ClubChooseBlock(),
      ),
    );
  }
}
