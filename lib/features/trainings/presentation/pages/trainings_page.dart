import 'package:tamos_family_club/features/coach/presentation/widgets/custom_date_picker.dart';
import 'package:tamos_family_club/features/trainings/presentation/widgets/group_list.dart';
import 'package:tamos_family_club/features/trainings/presentation/widgets/top_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrainingsPage extends StatefulWidget {
  const TrainingsPage({super.key});

  @override
  State<TrainingsPage> createState() => _TrainingsPageState();
}

class _TrainingsPageState extends State<TrainingsPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: const Color(0XFF222222),
      body: SafeArea(
        child: Column(
          children: const [
            TopPart(),
            CustomDatePicker(),
            SizedBox(height: 22),
            Expanded(child: GroupByTimeList()),
          ],
        ),
      ),
    );
  }
}
