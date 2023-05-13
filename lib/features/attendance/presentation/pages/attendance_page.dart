import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/attendance/data/models/attendance.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_event.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

late AttendanceBloc bloc;
late ScrollController scrollController;
List<Attendance> response = [];

class _AttendancePageState extends State<AttendancePage> {
  @override
  void initState() {
    bloc = BlocProvider.of<AttendanceBloc>(context);
    bloc.add(AttendanceGet());
    scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        if (state is AttendanceGetting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AttendanceGot) {
          return Scaffold(
            appBar: CupertinoNavigationBar(
              backgroundColor: Colors.white,
              previousPageTitle: translation(context).back,
              middle: Text(translation(context).attendance),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: state.length,
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                    margin: index == 0
                        ? const EdgeInsets.symmetric(vertical: 20.0)
                        : const EdgeInsets.only(bottom: 20.0),
                    height: 118,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: defaultTextColor100.withOpacity(0.02),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 32,
                          decoration: BoxDecoration(
                            color:
                                state.response[state.length - index - 1].in_gym
                                    ? trueColor
                                    : falseColor,
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Text(
                              translation(context).attendance,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: 16),
                            ),
                            Text(
                              'Almaty',
                              style: TextStyle(
                                fontFamily: 'Articulat',
                                color: defaultTextColor100,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'Club name: ',
                                  style: TextStyle(
                                    fontFamily: 'Articulat',
                                    color: defaultTextColor100,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  state.response[state.length - 1 - index].id
                                      .toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Articulat',
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Enter time: ',
                                  style: TextStyle(
                                    fontFamily: 'Articulat',
                                    color: defaultTextColor100,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  state.response[state.length - 1 - index]
                                      .arrival_time
                                      .toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Articulat',
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Exit time: ',
                                  style: TextStyle(
                                    fontFamily: 'Articulat',
                                    color: defaultTextColor100,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  state.response[state.length - 1 - index]
                                      .leaving_time
                                      .toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Articulat',
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              state.response[state.length - 1 - index].date,
                              style: TextStyle(
                                fontFamily: 'Articulat',
                                fontSize: 12,
                                color: defaultTextColor60,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('No data'),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
