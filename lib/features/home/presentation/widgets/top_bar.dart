import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

late ProfileBloc bloc;

class _TopBarState extends State<TopBar> {
  @override
  void initState() {
    bloc = BlocProvider.of<ProfileBloc>(context);
    bloc.add(GetProfileInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: padding_horiontal),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileGettingError) {
                  return Text(
                    "${translation(context).hello}, ",
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state is ProfileInfoGetting) {
                  return const CircularProgressIndicator();
                } else if (state is ProfileInfoGot) {
                  return RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${translation(context).hello}, ",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        TextSpan(
                          text: state.profile.first_name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: kPrimaryColor),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Text(
                    "${translation(context).hello}, ",
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
            const Spacer(),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(default_border_radius),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
