import 'package:tamos_family_club/features/subscription_choose/data/models/subscription.dart';
import 'package:flutter/material.dart';

class CarouselElement extends StatelessWidget {
  const CarouselElement({super.key, required this.data});
  final Subscription data;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final elementHeight = deviceHeight * 0.67;
    final elementWidth = deviceWidth * 0.77;
    String subscriptionTitle = data.title;
    String subscriptionDescription = data.description;
    int price = data.price;
    // List<String> details = [
    //   'Mobile application',
    //   'Termination at any time',
    //   '2 guest visits as a gift',
    // ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: elementHeight,
      width: elementWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 36),
          Text(
            subscriptionTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8),
          Text(
            subscriptionDescription,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [],
              // List.generate(
              //   details.length,
              //   (index) => Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 8),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           SvgPicture.asset(
              //             'assets/icons/check_icon.svg',
              //             height: 15,
              //             width: 15,
              //           ),
              //           const SizedBox(width: 10),
              //           Expanded(
              //             child: Text(
              //               details[index],
              //               style: Theme.of(context).textTheme.bodyLarge,
              //             ),
              //           ),
              //         ]),
              //   ),
              // ),
            ),
          ),
          // child: ListView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   scrollDirection: Axis.vertical,
          //   itemCount: details.length,
          //   itemBuilder: (context, index) => Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 8),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         SvgPicture.asset(
          //           'assets/icons/check_icon.svg',
          //           height: 15,
          //           width: 15,
          //         ),
          //         const SizedBox(width: 10),
          //         Expanded(
          //           child: Text(
          //             details[index],
          //             style: Theme.of(context).textTheme.bodyText1,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          const Divider(height: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                price.toString(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Text(' '),
              Text(
                'tg',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
