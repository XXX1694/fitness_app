import 'package:flutter/material.dart';
import 'package:tamos_family_club/common/widgets/custom_app_bar.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';

import '../constants.dart';
import '../language_constants.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: translation(context).promo),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
          child: Column(
            children: [
              const Spacer(),
              MainButton(
                active: true,
                widget: const Text(''),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
