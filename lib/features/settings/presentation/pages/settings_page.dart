// ignore_for_file: use_build_context_synchronously

import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/login/presentation/bloc/auth_bloc.dart';
import 'package:tamos_family_club/features/payment/presentation/pages/pament_choose.dart';
import 'package:tamos_family_club/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

late AuthBloc bloc;

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    bloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) => Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          previousPageTitle: translation(context).back,
          middle: Text(translation(context).settings),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PaymentChoosePage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).payment_method,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: defaultTextColor60,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/not_working');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).edit_profile,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: defaultTextColor60,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    changeLang(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).switch_language,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: defaultTextColor60,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).change_subscription,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: defaultTextColor60,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile/change_password');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).change_password,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: defaultTextColor60,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    bloc.add(LogOut());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translation(context).exit,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: defaultTextColor60,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
      listener: (context, state) {
        if (state is UserOffline) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/not_working', (route) => false);
        }
      },
    );
  }
}

final storage = SharedPreferences.getInstance();

void changeLang(BuildContext context) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _storage = await storage;
  final lang = _storage.getString(LAGUAGE_CODE);

  if (lang == 'en') {
    await setLocale(RUSSIAN);
    MyApp.setLocale(context, const Locale('ru'));
  } else {
    await setLocale(ENGLISH);
    MyApp.setLocale(context, const Locale('en'));
  }
}
