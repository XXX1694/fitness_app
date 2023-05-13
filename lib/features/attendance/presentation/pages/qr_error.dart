import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrError extends StatefulWidget {
  const QrError({super.key});

  @override
  State<QrError> createState() => _QrErrorState();
}

late AttendanceBloc bloc;

class _QrErrorState extends State<QrError> {
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
                'assets/icons/error_icon.svg',
                width: screenWidth * 0.375,
              ),
              const SizedBox(height: 20),
              Text(
                translation(context).error,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                translation(context).smt_went_wrong,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              MainButton(
                active: true,
                widget: Text(
                  translation(context).try_again,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/qr/enter',
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
