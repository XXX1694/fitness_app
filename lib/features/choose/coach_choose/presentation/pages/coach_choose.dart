import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/choose/coach_choose/presentation/bloc/coach_choose_bloc.dart';
import 'package:tamos_family_club/features/coach/presentation/pages/coach_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CoachChooseBlock extends StatefulWidget {
  const CoachChooseBlock({super.key});

  @override
  State<CoachChooseBlock> createState() => _CoachChooseBlockState();
}

late CoachChooseBloc bloc;

class _CoachChooseBlockState extends State<CoachChooseBlock> {
  @override
  void initState() {
    bloc = BlocProvider.of<CoachChooseBloc>(context);
    bloc.add(GetCoaches());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachChooseBloc, CoachChooseState>(
      builder: (context, state) {
        if (state is CoachesGot) {
          return ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: state.coachList.length,
            itemBuilder: (context, index) => CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoachInfo(
                      coachId: state.coachList[index].id ?? 0,
                    ),
                  ),
                );
              },
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset('assets/img/man.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.coachList[index].name!,
                        style: TextStyle(
                          fontFamily: 'Articulat',
                          color: defaultTextColor100,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            state.coachList[index].price.toString(),
                            style: TextStyle(
                              color: defaultTextColor60,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            ' KZT',
                            style: TextStyle(
                              fontFamily: 'Articulat',
                              color: defaultTextColor60,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 26,
                    width: 43,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/star.svg'),
                        const SizedBox(width: 2),
                        Text(
                          state.coachList[index].rating.toString(),
                          style: const TextStyle(
                            fontFamily: 'Articulat',
                            fontSize: 10,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          );
        } else if (state is CoachesGetting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CoachesGettingError) {
          return const Center(
            child: Text('Coach list is empty'),
            // child: Text('Error: ${state.message.toString()}'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
