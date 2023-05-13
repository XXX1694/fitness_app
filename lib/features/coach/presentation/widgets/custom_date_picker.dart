import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:tamos_family_club/utils/date_utils.dart' as date_util;

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: DateTime.now().day.toDouble() * 40.0,
    keepScrollOffset: true,
  );
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  var active = DateTime.now().day.toInt() - 1;

  @override
  void initState() {
    super.initState();
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort(((a, b) => a.day.compareTo(b.day)));
    currentMonthList = currentMonthList.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 104,
      child: ListView.builder(
        itemBuilder: ((context, index) {
          return capsuleView(index);
        }),
        controller: scrollController,
        itemCount: currentMonthList.length,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }

  Widget capsuleView(int index) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          active = index;
        });
      }),
      child: Container(
        height: 62,
        width: 39,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: active == index ? kPrimaryColor : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 4),
            Text(
              date_util.DateUtils.weekdays[currentMonthList[index].weekday - 1],
              style: index == active
                  ? Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      )
                  : Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                      ),
            ),
            const SizedBox(height: 7),
            Container(
              width: 30,
              height: 27,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: index == active
                      ? defaultTextColor100
                      : Colors.transparent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    currentMonthList[index].day.toString(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.41),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            index == currentDateTime.day.toInt() - 1
                ? Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color:
                          index == active ? Colors.transparent : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                : Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
