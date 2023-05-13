import 'package:tamos_family_club/common/language_constants.dart';
import 'package:flutter/material.dart';

class ProfilePageList extends StatelessWidget {
  const ProfilePageList({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = [
      {
        'txt': translation(context).attendance,
        'nav': '/profile/attendance',
      },
      {
        'txt': translation(context).support,
        'nav': '/profile/support',
      }
    ];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _data.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(_data[index]['nav']!),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _data[index]['txt']!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
