import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/coach/presentation/bloc/coach_bloc.dart';
import 'package:tamos_family_club/features/coach/presentation/widgets/bio_block.dart';
import 'package:tamos_family_club/features/coach/presentation/widgets/info_list.dart';
import 'package:tamos_family_club/features/coach/presentation/widgets/top_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoachInfo extends StatefulWidget {
  const CoachInfo({super.key, required this.coachId});
  final int coachId;

  @override
  State<CoachInfo> createState() => _CoachInfoState();
}

late CoachInfoBloc bloc;

class _CoachInfoState extends State<CoachInfo> {
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CoachInfoBloc>(context);
    bloc.add(GetCoachInfo(coahcId: widget.coachId));
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return BlocBuilder<CoachInfoBloc, CoachInfoState>(
      builder: (context, state) {
        if (state is CoachInfoGot) {
          return Scaffold(
            backgroundColor: const Color(0XFFFAFAFA),
            appBar: CupertinoNavigationBar(
              backgroundColor: Colors.white,
              previousPageTitle: translation(context).back,
              middle: Text(translation(context).coach),
              trailing: CupertinoButton(
                onPressed: () {},
                padding: const EdgeInsets.all(0),
                child: Text(
                  translation(context).choose,
                  style: const TextStyle(
                    fontFamily: 'Articulat',
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopInfo(coach: state.coach),
                    const SizedBox(height: 20),
                    InfoList(coach: state.coach),
                    const SizedBox(height: 24),
                    BioBlock(coach: state.coach),
                  ],
                ),
              ),
            ),
          );
        } else if (state is CoachInfoGettingError) {
          return Scaffold(
            body: Center(
              child: Text('Coach info get error: ${state.message}'),
            ),
          );
        } else if (state is CoachInfoGetting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
