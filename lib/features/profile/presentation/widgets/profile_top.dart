import 'package:tamos_family_club/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTop extends StatefulWidget {
  const ProfileTop({super.key});

  @override
  State<ProfileTop> createState() => _ProfileTopState();
}

late ProfileBloc bloc;

class _ProfileTopState extends State<ProfileTop> {
  @override
  void initState() {
    bloc = BlocProvider.of<ProfileBloc>(context);
    bloc.add(GetProfileInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 12),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileGettingError) {
              return const Text('');
            } else if (state is ProfileInfoGetting) {
              return const CircularProgressIndicator();
            } else if (state is ProfileInfoGot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.profile.first_name ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    state.profile.last_name ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
        const Spacer(),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: SvgPicture.asset(
            'assets/icons/settings_icon.svg',
            height: 27,
            width: 27,
          ),
          onPressed: () => Navigator.of(context).pushNamed('/profile/settings'),
        ),
      ],
    );
  }
}
