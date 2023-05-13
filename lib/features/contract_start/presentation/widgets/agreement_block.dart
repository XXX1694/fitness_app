// import 'package:tamos_family_club/common/language_constants.dart';
// import 'package:tamos_family_club/common/theme/colors.dart';
// import 'package:tamos_family_club/features/contract_start/presentation/widgets/custom_radio_button.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class AgreementBlock extends StatelessWidget {
//   const AgreementBlock({super.key, required this.controller});
//   final TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomRadioButton(controller: controller),
//             const SizedBox(width: 12),
//             Expanded(
//               child: RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: translation(context).i_confirm,
//                       style: Theme.of(context).textTheme.labelMedium?.copyWith(
//                             letterSpacing: -0.38,
//                             color: defaultTextColor100,
//                           ),
//                     ),
//                     const TextSpan(text: ' '),
//                     TextSpan(
//                       text: translation(context).rules,
//                       style: Theme.of(context).textTheme.labelMedium?.copyWith(
//                             letterSpacing: -0.38,
//                             color: kPrimaryColor,
//                           ),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           Navigator.of(context).pushNamed('/rules');
//                         },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const CustomRadioButton(),
//             const SizedBox(width: 12),
//             Expanded(
//               child: RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: translation(context).i_agree,
//                       style: TextStyle(
//                         fontFamily: 'Articulat',
//                         letterSpacing: -0.38,
//                         fontSize: 13,
//                         color: defaultTextColor100,
//                       ),
//                     ),
//                     const TextSpan(text: ' '),
//                     TextSpan(
//                       text: translation(context).agreement,
//                       style: const TextStyle(
//                         fontFamily: 'Articulat',
//                         letterSpacing: -0.38,
//                         fontSize: 13,
//                         color: kPrimaryColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           Navigator.of(context).pushNamed('/agreement');
//                         },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
