import 'package:tamos_family_club/features/home/presentation/widgets/interesting_block.dart';
import 'package:tamos_family_club/features/home/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:tamos_family_club/features/news/presentation/pages/news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(height: 16),
            TopBar(),
            SizedBox(height: 20),
            InterestingBlock(),
            SizedBox(height: 20),
            NewsBlock(),
          ],
        ),
      ),
    );
  }
}
