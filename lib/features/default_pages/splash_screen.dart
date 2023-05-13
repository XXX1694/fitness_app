import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/login/presentation/bloc/auth_bloc.dart';
import 'package:tamos_family_club/utils/bottom_sheet.dart';
import 'package:tamos_family_club/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

late AuthBloc bloc;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bloc = BlocProvider.of<AuthBloc>(context);
    bloc.add(GetUserStatus());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
          child: SafeArea(
              child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: translation(context).app_name_1,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 72,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  TextSpan(
                    text: translation(context).app_name_2,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: kPrimaryColor,
                          fontSize: 72,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
      listener: (context, state) {
        if (state is UserOnline) {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        } else if (state is UserLogError) {
          showCustomBottomSheet(
            context,
            Center(
              child: Text(state.message),
            ),
          );
        } else if (state is ConnectionError) {
          showCustomSnackBar(context, 'No internet connection');
        } else if (state is UserOffline) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
