import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storage1 = SharedPreferences.getInstance();
String lang = '';

var formatter = DateFormat('dd/MM/yyyy');
var txtStyle = TextStyle(
  fontFamily: 'Articulat',
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: defaultTextColor80,
  letterSpacing: 0,
);

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  void initState() {
    changeLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime(1950),
          maxTime: DateTime(2022, 12, 30),
          // onChanged: (date) {
          //   print('change $date');
          // },
          onConfirm: (date) {
            if (kDebugMode) {
              print('confirm $date');
            }
            setState(() {
              widget.controller.text =
                  DateFormat('yyyy-MM-dd').format(date).toString();
              txtStyle = TextStyle(
                fontFamily: 'Articulat',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: defaultTextColor100,
                letterSpacing: 0,
              );
            });
          },
          currentTime: DateTime.now(),
          locale: lang == 'ru' ? LocaleType.ru : LocaleType.en,
        );
      },
      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 15,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 12),
            Text(
              widget.controller.text.isNotEmpty
                  ? widget.controller.text
                  : translation(context).birth_date,
              style: txtStyle,
            ),
            const Spacer(),
            SvgPicture.asset('assets/icons/date_icon.svg', height: 24),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

void changeLang() async {
  final storage = await storage1;
  lang = storage.getString(LAGUAGE_CODE) ?? 'en';
}
