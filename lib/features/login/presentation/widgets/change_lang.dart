// ignore_for_file: use_build_context_synchronously
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLang extends StatefulWidget {
  const ChangeLang({super.key});

  @override
  State<ChangeLang> createState() => _ChangeLangState();
}

late TextEditingController currentLang;

class _ChangeLangState extends State<ChangeLang> {
  @override
  void initState() {
    currentLang = TextEditingController();
    checkLang(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () async {
        if (currentLang.text == 'English') {
          await setLocale(RUSSIAN);
          MyApp.setLocale(context, const Locale(RUSSIAN));
          setState(() {
            currentLang.text = 'Русский';
          });
        } else {
          await setLocale(ENGLISH);
          MyApp.setLocale(context, const Locale(ENGLISH));
          setState(() {
            currentLang.text = 'English';
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        height: 32,
        width: 88,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: defaultTextColor100.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/global.svg',
                // ignore: deprecated_member_use
                color: kPrimaryColor,
              ),
              const SizedBox(width: 4),
              Text(
                currentLang.text,
                style: const TextStyle(
                  fontFamily: 'Articulat',
                  fontSize: 15,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    currentLang.dispose();
    super.dispose();
  }
}

final storage = SharedPreferences.getInstance();

void checkLang(BuildContext context) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _storage = await storage;
  final lang = _storage.getString(LAGUAGE_CODE);

  if (lang == 'en') {
    currentLang.text = 'English';
    await setLocale(ENGLISH);
    MyApp.setLocale(context, const Locale('en'));
  } else if (lang == 'ru') {
    currentLang.text = 'Русский';
    await setLocale(RUSSIAN);
    MyApp.setLocale(context, const Locale('ru'));
  } else {
    currentLang.text = 'Error';
  }
}
