import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionListPage extends StatelessWidget {
  const SectionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        previousPageTitle: translation(context).back,
        middle: Text(translation(context).settings),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
          child: ListView.builder(
            itemBuilder: (context, index) => CupertinoButton(
              padding: const EdgeInsets.only(top: 20),
              onPressed: () {},
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Секция ${index + 1}',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
