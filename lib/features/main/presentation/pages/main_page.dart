// ignore_for_file: deprecated_member_use
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/coach_list/presentation/pages/coach_list.dart';
import 'package:tamos_family_club/features/home/presentation/pages/home_page.dart';
import 'package:tamos_family_club/features/profile/presentation/pages/profile_page.dart';
import 'package:tamos_family_club/features/trainings/presentation/pages/trainings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       backgroundColor: Colors.white,
//       tabBar: CupertinoTabBar(
//         backgroundColor: Colors.white,
//         activeColor: kPrimaryColor,
//         items: [
//           BottomNavigationBarItem(
//             label: translation(context).home,
//             icon: SvgPicture.asset(
//               'assets/icons/menu/home_outline.svg',
//               color: defaultTextColor80,
//             ),
//             activeIcon: SvgPicture.asset(
//               'assets/icons/menu/home_fill.svg',
//               color: kPrimaryColor,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: translation(context).timetable,
//             icon: SvgPicture.asset(
//               'assets/icons/menu/calendar_outline.svg',
//               color: defaultTextColor80,
//             ),
//             activeIcon: SvgPicture.asset(
//               'assets/icons/menu/calendar_fill.svg',
//               color: kPrimaryColor,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: translation(context).coach,
//             icon: SvgPicture.asset(
//               'assets/icons/menu/gym_outline.svg',
//               color: defaultTextColor80,
//             ),
//             activeIcon: SvgPicture.asset(
//               'assets/icons/menu/gym_fill.svg',
//               color: kPrimaryColor,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: translation(context).profile,
//             icon: SvgPicture.asset(
//               'assets/icons/menu/user_outline.svg',
//               color: defaultTextColor80,
//             ),
//             activeIcon: SvgPicture.asset(
//               'assets/icons/menu/user_fill.svg',
//               color: kPrimaryColor,
//             ),
//           ),
//         ],
//       ),
//       tabBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return const HomePage();
//           case 1:
//             return const TrainingsPage();
//           case 2:
//             return const CoachListPage();
//           case 3:
//             return const ProfilePage();
//           default:
//             return const HomePage();
//         }
//       },
//     );
//   }
// }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 0;
  final List screens = [
    const HomePage(),
    const TrainingsPage(),
    const CoachListPage(),
    const ProfilePage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentPage),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/qr/enter');
        },
        backgroundColor: Colors.white,
        splashColor: Colors.white,
        foregroundColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        elevation: 0,
        child: SvgPicture.asset('assets/icons/qr.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        // height: 76,
        child: SizedBox(
          height: 48,
          child: Column(
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = screens[0];
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            currentTab == 0
                                ? 'assets/icons/menu/home_fill.svg'
                                : 'assets/icons/menu/home_outline.svg',
                            color: currentTab == 0
                                ? kPrimaryColor
                                : defaultTextColor80,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            translation(context).home,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: currentTab == 0
                                  ? kPrimaryColor
                                  : defaultTextColor80,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = screens[1];
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            currentTab == 1
                                ? 'assets/icons/menu/calendar_fill.svg'
                                : 'assets/icons/menu/calendar_outline.svg',
                            color: currentTab == 1
                                ? kPrimaryColor
                                : defaultTextColor80,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            translation(context).timetable,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: currentTab == 1
                                  ? kPrimaryColor
                                  : defaultTextColor80,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 4),
                  // const SizedBox(width: 24),
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = screens[2];
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            currentTab == 2
                                ? 'assets/icons/menu/gym_fill.svg'
                                : 'assets/icons/menu/gym_outline.svg',
                            color: currentTab == 2
                                ? kPrimaryColor
                                : defaultTextColor80,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            translation(context).coach,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: currentTab == 2
                                  ? kPrimaryColor
                                  : defaultTextColor80,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentPage = screens[3];
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            currentTab == 3
                                ? 'assets/icons/menu/user_fill.svg'
                                : 'assets/icons/menu/user_outline.svg',
                            color: currentTab == 3
                                ? kPrimaryColor
                                : defaultTextColor80,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            translation(context).profile,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: currentTab == 3
                                  ? kPrimaryColor
                                  : defaultTextColor80,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
