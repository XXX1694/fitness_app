import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:tamos_family_club/features/change_password/presentation/widgets/confirm_pass.dart';
import 'package:tamos_family_club/features/change_password/presentation/widgets/new_pass.dart';
import 'package:tamos_family_club/features/change_password/presentation/widgets/current_pass.dart';
import 'package:tamos_family_club/utils/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

late TextEditingController _oldPassController;
late TextEditingController _new1PassController;
late TextEditingController _new2PassController;
late ChangePasswordBloc bloc;

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  void initState() {
    bloc = BlocProvider.of<ChangePasswordBloc>(context);
    _oldPassController = TextEditingController();
    _new1PassController = TextEditingController();
    _new2PassController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) => Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          previousPageTitle: translation(context).back,
          middle: Text(translation(context).change_password),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
            child: Column(
              children: [
                const SizedBox(height: 20),
                CurrentPass(controller: _oldPassController),
                const SizedBox(height: 20),
                NewPass1(controller: _new1PassController),
                const SizedBox(height: 20),
                NewPass2(controller: _new2PassController),
                const Spacer(),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    bloc.add(
                      ChangePassword(
                          currentPass: _oldPassController.text,
                          newPass: _new1PassController.text),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: kPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: defaultTextColor100.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    height: 54,
                    width: double.infinity,
                    child: Center(
                      child: state is PasswordChanging
                          ? const CircularProgressIndicator()
                          : Text(
                              translation(context).confirm,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      listener: (context, state) {
        if (state is ConnectionError) {
          showCustomSnackBar(context, translation(context).connection_error);
        } else if (state is PasswordChanged) {
          showCustomSnackBar(context, translation(context).success);
          Navigator.pop(context);
        } else if (state is PasswordChangeError) {
          showCustomSnackBar(context, state.message);
        } else {}
      },
    );
  }
}
