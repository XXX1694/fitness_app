import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/common/widgets/lodaing.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';
import 'package:tamos_family_club/features/login/presentation/bloc/auth_bloc.dart';
import 'package:tamos_family_club/features/login/presentation/widgets/forgot_password.dart';
import 'package:tamos_family_club/features/login/presentation/widgets/login_field.dart';
import 'package:tamos_family_club/features/login/presentation/widgets/password_field.dart';
import 'package:tamos_family_club/features/login/presentation/widgets/sign_up_transition.dart';
import 'package:tamos_family_club/features/login/presentation/widgets/text_block.dart';
import 'package:tamos_family_club/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

late TextEditingController _loginController;
late TextEditingController _passwordController;
late AuthBloc bloc;

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    bloc = BlocProvider.of<AuthBloc>(context);
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    bloc.add(GetUserStatus());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: false,
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                const TextBlock(),
                const Spacer(flex: 2),
                LoginField(controller: _loginController),
                const SizedBox(height: 16),
                PasswordField(controller: _passwordController),
                const SizedBox(height: 8),
                const ForgotPassword(),
                const Spacer(flex: 3),
                MainButton(
                  active: true,
                  widget: state is UserLoading
                      ? const Loading()
                      : Text(
                          translation(context).enter,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                  onPressed: () {
                    bloc.add(
                      LogIn(
                        username: _loginController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                const SignUpTransition(),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
      listener: (context, state) {
        if (state is UserOnline) {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        } else if (state is ConnectionError) {
          showCustomSnackBar(context, translation(context).connection_error);
        } else if (state is UserLogError) {
          showCustomSnackBar(context, translation(context).auth_error);
        }
      },
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
