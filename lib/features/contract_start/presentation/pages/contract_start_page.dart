import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';
import 'package:tamos_family_club/features/contract_start/presentation/widgets/custom_date_picker.dart';
import 'package:tamos_family_club/features/payment/presentation/pages/pament_choose.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContractStartPage extends StatefulWidget {
  const ContractStartPage(
      {super.key, required this.subName, required this.subPrice});

  final String subName;
  final String subPrice;

  @override
  State<ContractStartPage> createState() => _ContractStartPageState();
}

late TextEditingController _contractController;

class _ContractStartPageState extends State<ContractStartPage> {
  @override
  void initState() {
    _contractController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        previousPageTitle: translation(context).back,
        middle: Text(translation(context).contract_start),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: padding_horiontal),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomDatePicker(controller: _contractController),
                  const SizedBox(height: 20),
                  const Spacer(),
                  MainButton(
                    active: true,
                    widget: Text(
                      translation(context).confirm,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PaymentChoosePage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _contractController.dispose();
    super.dispose();
  }
}
