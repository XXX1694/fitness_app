import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    final items = [
      translation(context).sex,
      translation(context).male,
      translation(context).female,
    ];
    String selectedItem = items[0];
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: defaultTextColor100,
                  ),
              // icon: SvgPicture.asset(
              //   'assets/icons/arrow_under_icon.svg',
              //   height: 6,
              // ),
              isExpanded: true,
              value: selectedItem,
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: item == translation(context).sex
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: defaultTextColor80)
                              : Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: defaultTextColor100),
                        ),
                      ))
                  .toList(),
              onChanged: ((item) {
                setState(() {
                  selectedItem = item.toString();
                });
                widget.controller.text = selectedItem;
              }),
            ),
          ),
        ),
      ),
    );
  }
}
