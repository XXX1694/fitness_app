import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/common/theme/light_theme.dart';
import 'package:tamos_family_club/common/widgets/promo_page.dart';
import 'package:tamos_family_club/features/attendance/data/repositories/attendance_repository.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_bloc.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_state.dart';
import 'package:tamos_family_club/features/attendance/presentation/pages/attendance_page.dart';
import 'package:tamos_family_club/features/attendance/presentation/pages/qr_scaner_enter.dart';
import 'package:tamos_family_club/features/change_password/data/repositories/change_password_repository.dart';
import 'package:tamos_family_club/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:tamos_family_club/features/change_password/presentation/pages/change_password.dart';
import 'package:tamos_family_club/features/choose/subscription_type/presentation/pages/sub_type_choose.dart';
import 'package:tamos_family_club/features/coach/data/repositories/coach_repository.dart';
import 'package:tamos_family_club/features/coach/presentation/bloc/coach_bloc.dart';
import 'package:tamos_family_club/features/default_pages/choose.dart';
import 'package:tamos_family_club/features/choose/club_choose/data/repositories/club_repository.dart';
import 'package:tamos_family_club/features/choose/club_choose/presentation/bloc/club_choose_bloc.dart';
import 'package:tamos_family_club/features/choose/coach_choose/data/repositories/coah_repository.dart';
import 'package:tamos_family_club/features/choose/coach_choose/presentation/bloc/coach_choose_bloc.dart';
import 'package:tamos_family_club/features/contract_start/presentation/widgets/agreement_page.dart';
import 'package:tamos_family_club/features/contract_start/presentation/widgets/rules_page.dart';
import 'package:tamos_family_club/features/default_pages/loading_page.dart';
import 'package:tamos_family_club/features/default_pages/not_working.dart';
import 'package:tamos_family_club/features/login/data/repositories/user_auth_repository.dart';
import 'package:tamos_family_club/features/login/presentation/bloc/auth_bloc.dart';
import 'package:tamos_family_club/features/main/presentation/pages/main_page.dart';
import 'package:tamos_family_club/features/payment/data/repositories/payment_repository.dart';
import 'package:tamos_family_club/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:tamos_family_club/features/profile/data/repositories/profile_repository.dart';
import 'package:tamos_family_club/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:tamos_family_club/features/registration/data/repositories/registration_repository.dart';
import 'package:tamos_family_club/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:tamos_family_club/features/registration/presentation/pages/first_registration.dart';
import 'package:tamos_family_club/features/registration/presentation/pages/second_registration.dart';
import 'package:tamos_family_club/features/settings/presentation/pages/settings_page.dart';
import 'package:tamos_family_club/features/subscription_choose/data/repositories/subscription_repository.dart';
import 'package:tamos_family_club/features/subscription_choose/presentation/bloc/subscription_choose_bloc.dart';
import 'package:tamos_family_club/features/subscription_choose/presentation/pages/subscription_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/login/presentation/pages/login_page.dart';
import 'features/trainings/presentation/pages/section_list.dart';

// For building models: flutter pub run build_runner build --delete-conflicting-outputs
// For changing app icon: flutter pub run flutter_launcher_icons:main
// For apk: flutter build apk --split-per-abi

void main() async {
  await dotenv.load(fileName: '.env');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    // getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            repo: UserAuthRepository(),
            userState: const AuthState(),
          ),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(
            repo: RegistrationRepository(),
            registrationState: const RegistrationState(),
          ),
        ),
        BlocProvider(
          create: (context) => ClubChooseBloc(
            repo: ClubRepository(),
            clubsState: const ClubChooseState(),
          ),
        ),
        BlocProvider(
          create: (context) => CoachChooseBloc(
            repo: CoachRepository(),
            clubsState: const CoachChooseState(),
          ),
        ),
        BlocProvider(
          create: (context) => SubscriptionChooseBloc(
            repo: SubscriptionRepository(),
            subscriptionState: const SubscriptionChooseState(),
          ),
        ),
        BlocProvider(
          create: (context) => PaymentBloc(
            repo: PaymentRepository(),
            paymentState: const PaymentState(),
          ),
        ),
        BlocProvider(
          create: (context) => AttendanceBloc(
            repo: AttendanceRepository(),
            attendanceState: AttendanceState(),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            repo: ProfileRepository(),
            profileState: const ProfileState(),
          ),
        ),
        BlocProvider(
          create: (context) => CoachInfoBloc(
            repo: CoachInfoRepository(),
            coachState: const CoachInfoState(),
          ),
        ),
        BlocProvider(
          create: (context) => ChangePasswordBloc(
            repo: ChangePasswordRepository(),
            passwordState: const ChangePasswordState(),
          ),
        ),
      ],
      child: MaterialApp(
        color: kPrimaryColor,
        locale: _locale,
        theme: lightTheme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Tamos Fitness Family',
        debugShowCheckedModeBanner: false, // debug banner remove: false
        routes: {
          '/': (context) => const LoginPage(),
          // '/': (context) => const SecondRegistrationPage(),
          '/main': (context) => const MainPage(),
          '/not_working': (context) => const NotWorkingPage(),
          '/registration/first': (context) => const FirstRegistrationPage(),
          '/registration/second': (context) => const SecondRegistrationPage(),
          '/registration/choose': (context) => const ChoosePage(),
          '/choose': (context) => const ChoosePage(),
          '/registration/subscription': (context) =>
              const SubscriptionChoosePage(),
          '/rules': (context) => const RulesPage(),
          '/agreement': (context) => const AgreementPage(),
          '/qr/enter': (context) => const QrScannerEnter(),
          '/profile/attendance': (context) => const AttendancePage(),
          '/profile/support': (context) => const NotWorkingPage(),
          '/profile/settings': (context) => const SettingsPage(),
          '/payment/choose/cash/loading': (context) => const LoadingPage(),
          '/profile/change_password': (context) => const ChangePasswordPage(),
          '/promo': (context) => const PromoPage(),
          '/sections': (context) => const SectionListPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
