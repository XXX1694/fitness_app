import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';
import 'package:tamos_family_club/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/date_birth_field.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/email_field.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/first_name_field.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/last_name_field.dart';
import 'package:tamos_family_club/features/registration/presentation/widgets/phone_number_field.dart';
import 'package:tamos_family_club/utils/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/lodaing.dart';

class SecondRegistrationPage extends StatefulWidget {
  const SecondRegistrationPage({super.key});

  @override
  State<SecondRegistrationPage> createState() => _SecondRegistrationPageState();
}

late TextEditingController _firstNameController;
late TextEditingController _lastNameController;
late TextEditingController _birthDateController;

late TextEditingController _phoneNumberController;
late TextEditingController _emailController;
late RegistrationBloc bloc;

class _SecondRegistrationPageState extends State<SecondRegistrationPage> {
  bool contr1 = false;
  bool contr2 = false;
  bool contr3 = false;
  bool contr4 = false;
  bool contr5 = false;

  @override
  void initState() {
    bloc = BlocProvider.of<RegistrationBloc>(context);
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _birthDateController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _firstNameController.addListener(() {
      setState(() {
        contr1 = _firstNameController.text.isNotEmpty;
      });
    });
    _lastNameController.addListener(() {
      setState(() {
        contr2 = _lastNameController.text.isNotEmpty;
      });
    });
    _birthDateController.addListener(() {
      setState(() {
        contr3 = _birthDateController.text.isNotEmpty &&
            _birthDateController.text != translation(context).birth_date;
      });
    });
    _phoneNumberController.addListener(() {
      setState(() {
        contr4 = _phoneNumberController.text.isNotEmpty;
      });
    });
    _emailController.addListener(() {
      setState(() {
        contr5 = _emailController.text.isNotEmpty;
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
          middle: Text(
            translation(context).create_acc,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: defaultTextColor100),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: padding_horiontal),
            child: Column(
              children: [
                const SizedBox(height: 20),
                FirstNameField(controller: _firstNameController),
                const SizedBox(height: 20),
                LastNameField(controller: _lastNameController),
                const SizedBox(height: 20),
                CustomDatePicker(controller: _birthDateController),
                const SizedBox(height: 20),
                CustomPhoneFiled(controller: _phoneNumberController),
                const SizedBox(height: 20),
                EmailField(controller: _emailController),
                const Spacer(),
                MainButton(
                  widget: state is ProfileCreating
                      ? const Loading()
                      : Text(
                          translation(context).create,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                  onPressed: contr1 && contr2 && contr3 && contr4 && contr5
                      ? () {
                          bloc.add(
                            CreateProfile(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              birthDate: _birthDateController.text,
                              phoneNumber: _phoneNumberController.text,
                              email: _emailController.text,
                            ),
                          );
                        }
                      : null,
                  active: contr1 && contr2 && contr3 && contr4 && contr5,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      listener: (context, state) {
        if (state is ProfileCreated) {
          Navigator.of(context).pushNamed('/registration/choose');
        } else if (state is ProfileCreateError) {
          showCustomSnackBar(context, state.message);
        } else if (state is ConnectionError) {
          showCustomSnackBar(context, 'No internet connection');
        } else {}
      },
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
