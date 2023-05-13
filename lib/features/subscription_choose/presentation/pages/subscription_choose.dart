import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';
import 'package:tamos_family_club/features/contract_start/presentation/pages/contract_start_page.dart';
import 'package:tamos_family_club/features/subscription_choose/presentation/bloc/subscription_choose_bloc.dart';
import 'package:tamos_family_club/features/subscription_choose/presentation/widgets/subscription_corusel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionChoosePage extends StatefulWidget {
  const SubscriptionChoosePage({super.key});

  @override
  State<SubscriptionChoosePage> createState() => _SubscriptionChoosePageState();
}

late TextEditingController _subscriptionController;
late TextEditingController _subscriptionNameController;
late TextEditingController _subscriptionPriceController;
late SubscriptionChooseBloc bloc;

class _SubscriptionChoosePageState extends State<SubscriptionChoosePage> {
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SubscriptionChooseBloc>(context);
    _subscriptionController = TextEditingController();
    _subscriptionNameController = TextEditingController();
    _subscriptionPriceController = TextEditingController();
    _subscriptionController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscriptionChooseBloc, SubscriptionChooseState>(
      builder: (context, state) => Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          previousPageTitle: translation(context).back,
          middle: Text(translation(context).select_contract),
          trailing: CupertinoButton(
            padding: const EdgeInsets.all(0),
            child: Text(
              translation(context).skip,
              style: const TextStyle(
                fontFamily: 'Articulat',
                color: kPrimaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.41,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/main');
            },
          ),
        ),
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset:
            false, // to prevent from overflowing of keyboard
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  SubscriptionCarousel(
                    idController: _subscriptionController,
                    nameController: _subscriptionNameController,
                    priceController: _subscriptionPriceController,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: MainButton(
                      active: true,
                      widget: Text(
                        translation(context).choose,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      onPressed: () {
                        bloc.add(
                          SetSubscribtion(
                            subscriptionID:
                                int.parse(_subscriptionController.text),
                          ),
                        );
                        // Navigator.of(context).pushNamed('/contract_start');
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      listener: (context, state) {
        if (state is SubscriptionSet) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContractStartPage(
                subName: _subscriptionNameController.text,
                subPrice: _subscriptionPriceController.text,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _subscriptionController.dispose();
    _subscriptionNameController.dispose();
    _subscriptionPriceController.dispose();
    super.dispose();
  }
}
