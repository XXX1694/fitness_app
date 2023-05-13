import 'package:carousel_slider/carousel_slider.dart';
import 'package:tamos_family_club/features/subscription_choose/presentation/bloc/subscription_choose_bloc.dart';
import 'package:tamos_family_club/features/subscription_choose/presentation/widgets/carousel_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionCarousel extends StatefulWidget {
  const SubscriptionCarousel({
    super.key,
    required this.idController,
    required this.nameController,
    required this.priceController,
  });
  final TextEditingController idController;
  final TextEditingController nameController;
  final TextEditingController priceController;
  @override
  State<SubscriptionCarousel> createState() => _SubscriptionCarouselState();
}

late SubscriptionChooseBloc bloc;

class _SubscriptionCarouselState extends State<SubscriptionCarousel> {
  @override
  void initState() {
    bloc = BlocProvider.of<SubscriptionChooseBloc>(context);
    bloc.add(GetSubscription());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final elementHeight = deviceHeight * 0.67;
    return BlocBuilder<SubscriptionChooseBloc, SubscriptionChooseState>(
      builder: (context, state) {
        if (state is SubscriptionGot) {
          return CarouselSlider.builder(
            itemCount: state.subList.length,
            itemBuilder: (context, index, realIndex) => CarouselElement(
              data: state.subList[index],
            ),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                widget.idController.text = index.toString();
                widget.nameController.text =
                    state.subList[index].title.toString();
                widget.priceController.text =
                    state.subList[index].price.toString();
              },
              height: elementHeight,
            ),
          );
        } else if (state is SubscriptionGetting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SubscriptionGetError) {
          return const Center(
            child: Text('error'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
