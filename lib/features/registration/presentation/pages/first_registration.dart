import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';
import 'package:tamos_family_club/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/client_agreement.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/login_field.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/password_field.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/repeat_password_field.dart';
import 'package:tamos_family_club/utils/snack_bar.dart';
import 'package:tamos_family_club/utils/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/lodaing.dart';

class FirstRegistrationPage extends StatefulWidget {
  const FirstRegistrationPage({super.key});

  @override
  State<FirstRegistrationPage> createState() => _FirstRegistrationPageState();
}

late TextEditingController _loginController;
late TextEditingController _passwordController;
late TextEditingController _repeatPasswordController;
late TextEditingController _isClientAgree;
late RegistrationBloc bloc;

class _FirstRegistrationPageState extends State<FirstRegistrationPage> {
  bool contr1 = false;
  bool contr2 = false;
  bool contr3 = false;
  bool contr4 = false;
  @override
  void initState() {
    bloc = BlocProvider.of<RegistrationBloc>(context);
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    _isClientAgree = TextEditingController();
    _loginController.addListener(() {
      setState(() {
        contr1 = _loginController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        contr2 = _passwordController.text.isNotEmpty;
      });
    });
    _repeatPasswordController.addListener(() {
      setState(() {
        contr3 = _repeatPasswordController.text.isNotEmpty;
      });
    });
    _repeatPasswordController.addListener(() {
      setState(() {
        contr3 = _repeatPasswordController.text.isNotEmpty;
      });
    });
    _isClientAgree.addListener(() {
      setState(() {
        contr4 = _isClientAgree.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      builder: (context, state) => Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          previousPageTitle: translation(context).back,
          middle: Text(
            translation(context).create_acc,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: defaultTextColor100),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: padding_horiontal),
            child: Column(
              children: [
                const SizedBox(height: 20),
                LoginField(controller: _loginController),
                const SizedBox(height: 20),
                PasswordField(controller: _passwordController),
                const SizedBox(height: 20),
                RepeatPasswordField(controller: _repeatPasswordController),
                const SizedBox(height: 20),
                ClientAgreement(controller: _isClientAgree),
                const Spacer(),
                MainButton(
                  active: contr1 && contr2 && contr3 && contr4,
                  widget: state is UserCreating
                      ? const Loading()
                      : Text(
                          translation(context).create,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                  onPressed: contr1 && contr2 && contr3 && contr4
                      ? () {
                          final valid = Validation().checkPassword(
                            _passwordController.text,
                            _repeatPasswordController.text,
                          );
                          if (_loginController.text == '') {
                            showCustomSnackBar(
                                context, 'Login field is required');
                          } else if (_passwordController.text == '') {
                            showCustomSnackBar(
                                context, 'Password field is required');
                          } else if (_repeatPasswordController.text == '') {
                            showCustomSnackBar(
                                context, 'Password field is required');
                          } else if (_repeatPasswordController.text !=
                              _passwordController.text) {
                            showCustomSnackBar(
                                context, 'Password are not same');
                          } else if (valid == false) {
                            showCustomSnackBar(context,
                                'Password should contain upper,lower,digit and Special character ');
                          } else {
                            bloc.add(
                              CreateUser(
                                username: _loginController.text,
                                password: _passwordController.text,
                              ),
                            );
                          }
                        }
                      : null,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      listener: (context, state) {
        if (state is UserCreated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/registration/second', (route) => false);
        } else if (state is UserCreateError) {
          showCustomSnackBar(context, state.message);
        } else if (state is ConnectionError) {
          showCustomSnackBar(context, 'No internet connection');
        } else {}
      },
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }
}
