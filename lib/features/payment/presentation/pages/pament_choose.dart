import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/features/payment/presentation/pages/add_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentChoosePage extends StatelessWidget {
  const PaymentChoosePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        previousPageTitle: translation(context).back,
        middle: Text(translation(context).payment_method),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding_horiontal),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddCardPage(),
                  ));
                },
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        const Color(0XFF6A94C1),
                        Colors.white.withOpacity(0),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: defaultTextColor100.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 20, 0),
                          child: Image.asset(
                            'assets/icons/visa.png',
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              'Card number',
                              style: TextStyle(
                                fontFamily: 'Articulat',
                                letterSpacing: 0.38,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: defaultTextColor100,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'no data',
                              style: TextStyle(
                                fontFamily: 'Articulat',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: defaultTextColor100,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Expiration date',
                                      style: TextStyle(
                                        fontFamily: 'Articulat',
                                        letterSpacing: 0.38,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: defaultTextColor100,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'no data',
                                      style: TextStyle(
                                        fontFamily: 'Articulat',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: defaultTextColor100,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 53),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CVV',
                                      style: TextStyle(
                                        fontFamily: 'Articulat',
                                        letterSpacing: 0.38,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: defaultTextColor100,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'no data',
                                      style: TextStyle(
                                        fontFamily: 'Articulat',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: defaultTextColor100,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pushNamed(context, '/payment/choose/cash/loading');
                },
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        const Color(0XFF52D265),
                        Colors.white.withOpacity(0),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: defaultTextColor100.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 24, 16, 0),
                          child: SvgPicture.asset(
                            'assets/icons/cash.svg',
                            height: 21,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
