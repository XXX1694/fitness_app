import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextBlock extends StatelessWidget {
  const TextBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/tamos_icon.svg',
          height: 120,
        ),
      ],
    );
  }
}

//RichText(
//   text: TextSpan(
//     children: [
//       TextSpan(
//         text: translation(context).app_name_1,
//         style: Theme.of(context).textTheme.displayLarge,
//       ),
//       TextSpan(
//         text: translation(context).app_name_2,
//         style: Theme.of(context)
//             .textTheme
//             .displayLarge!
//             .copyWith(color: kPrimaryColor),
//       ),
//     ],
//   ),
// ),
// Text(
//   translation(context).log_in_to_continue,
//   style: Theme.of(context).textTheme.titleMedium,
// ),