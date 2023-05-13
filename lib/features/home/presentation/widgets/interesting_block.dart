import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterestingBlock extends StatelessWidget {
  const InterestingBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            translation(context).interesting,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: height * 0.42,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => AspectRatio(
              aspectRatio: 25 / 28,
              child: Container(
                height: height * 0.42,
                padding: const EdgeInsets.all(0),
                margin: index == 0
                    ? const EdgeInsets.fromLTRB(20, 0, 16, 0)
                    : const EdgeInsets.fromLTRB(0, 0, 16, 0),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/img/sale.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      // blurRadius: 15,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.pushNamed(context, '/promo');
                    },
                    child: Container(
                      height: 28,
                      width: 80,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          translation(context).buy,
                          style: const TextStyle(
                            fontFamily: 'Articulat',
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // child: Image.asset(
                //   'assets/img/img_1.png',
                //   fit: BoxFit.fill,
                //   height: double.infinity,
                //   width: double.infinity,
                // ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
