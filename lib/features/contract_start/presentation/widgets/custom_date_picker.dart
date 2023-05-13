import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

var formatter = DateFormat('dd/MM/yyyy');
var txtStyle = TextStyle(
  fontFamily: 'Articulat',
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: defaultTextColor80,
  letterSpacing: 0,
);

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    widget.controller.text = formatter.format(DateTime.now()).toString();
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime.now(),
          maxTime: DateTime(2025, 12, 30),
          // onChanged: (date) {
          //   print('change $date');
          // },
          onConfirm: (date) {
            if (kDebugMode) {
              print('confirm $date');
            }
            setState(() {
              widget.controller.text = formatter.format(date).toString();
              txtStyle = TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: defaultTextColor100,
                letterSpacing: 0,
                fontFamily: 'Articulat',
              );
            });
          },
          currentTime: DateTime.now(),
          locale: LocaleType.en,
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
              widget.controller.text,
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
