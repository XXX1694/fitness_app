import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';
import 'package:tamos_family_club/features/trainings/presentation/widgets/training_main_info.dart';
import 'package:tamos_family_club/features/trainings/presentation/widgets/transperent_app_bar.dart';
import 'package:flutter/material.dart';

class AboutTraingingPage extends StatelessWidget {
  const AboutTraingingPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/img/bg_img.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black12,
          ),
          SafeArea(
            child: Column(
              children: [
                TransperentAppBar(txt: title),
                const Spacer(flex: 180),
                const TrainingMainInfo(),
                const Spacer(flex: 100),
                const SizedBox(height: 32),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: padding_horiontal),
                  child: MainButton(
                    active: true,
                    widget: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
