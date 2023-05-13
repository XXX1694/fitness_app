import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionInfo extends StatefulWidget {
  const SubscriptionInfo({super.key});

  @override
  State<SubscriptionInfo> createState() => _SubscriptionInfoState();
}

late ProfileBloc bloc;

class _SubscriptionInfoState extends State<SubscriptionInfo> {
  @override
  void initState() {
    bloc = BlocProvider.of<ProfileBloc>(context);
    bloc.add(GetProfileInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translation(context).your_coach,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 13),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileGettingError) {
                    return const Text('None');
                  } else if (state is ProfileInfoGetting) {
                    return const CircularProgressIndicator();
                  } else if (state is ProfileInfoGot) {
                    return Text(
                      state.profile.coach ?? 'None',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: kPrimaryColor),
                    );
                  } else {
                    return Text(
                      'None',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: kPrimaryColor),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 48),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translation(context).your_sub,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 13),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileGettingError) {
                    return const Text('None');
                  } else if (state is ProfileInfoGetting) {
                    return const CircularProgressIndicator();
                  } else if (state is ProfileInfoGot) {
                    return Text(
                      state.profile.subscription ?? 'None',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: kPrimaryColor),
                    );
                  } else {
                    return Text(
                      'None',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: kPrimaryColor),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
