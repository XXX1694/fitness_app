import 'package:tamos_family_club/features/profile/presentation/widgets/profile_page_list.dart';
import 'package:tamos_family_club/features/profile/presentation/widgets/profile_top.dart';
import 'package:tamos_family_club/features/profile/presentation/widgets/subscription_info.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: const [
            SizedBox(height: 30),
            ProfileTop(),
            SizedBox(height: 30),
            SubscriptionInfo(),
            SizedBox(height: 48),
            SizedBox(
              height: 150,
              child: ProfilePageList(),
            ),
          ],
        ),
      ),
    );
  }
}
