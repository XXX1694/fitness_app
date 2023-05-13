import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/attendance_bloc.dart';

class QrSuccess extends StatefulWidget {
  const QrSuccess({super.key});

  @override
  State<QrSuccess> createState() => _QrSuccessState();
}

late AttendanceBloc bloc;

class _QrSuccessState extends State<QrSuccess> {
  @override
  void initState() {
    bloc = BlocProvider.of<AttendanceBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/success_icon.svg',
                width: screenWidth * 0.375,
              ),
              const SizedBox(height: 20),
              Text(
                translation(context).success,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                translation(context).txt,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              MainButton(
                active: true,
                widget: Text(
                  translation(context).continue_text,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                onPressed: () {
                  bloc.add(AttendanceDone());
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/main',
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
