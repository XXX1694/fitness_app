import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.widget,
      required this.onPressed,
      required this.active});
  final Widget widget;
  final VoidCallback? onPressed;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: active ? kPrimaryColor : kPrimaryColor.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
              color: defaultTextColor100.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        height: 54,
        width: double.infinity,
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}

class DisableMainButton extends StatelessWidget {
  const DisableMainButton({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kPrimaryColor.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
              color: defaultTextColor100.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        height: 54,
        width: double.infinity,
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
