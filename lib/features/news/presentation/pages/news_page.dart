import 'package:flutter/material.dart';

class NewsBlock extends StatelessWidget {
  const NewsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('News'),
        const SizedBox(height: 12),
        SingleChildScrollView(
          child: ListView.builder(
            itemBuilder: (context, index) => Container(),
          ),
        )
      ],
    );
  }
}
