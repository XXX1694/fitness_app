import 'package:tamos_family_club/common/language_constants.dart';
import 'package:tamos_family_club/common/widgets/main_button.dart';
import 'package:tamos_family_club/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:tamos_family_club/features/payment/presentation/widgets/payment_form.dart';
import 'package:tamos_family_club/utils/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  late TextEditingController _cardNumberController;
  late TextEditingController _cardHolderController;
  late TextEditingController _cardDateController;
  late TextEditingController _cardCvvController;
  late PaymentBloc bloc;
  @override
  void initState() {
    _cardNumberController = TextEditingController();
    _cardHolderController = TextEditingController();
    _cardDateController = TextEditingController();
    _cardCvvController = TextEditingController();
    bloc = BlocProvider.of<PaymentBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      builder: ((context, state) => Scaffold(
            appBar: CupertinoNavigationBar(
              backgroundColor: Colors.white,
              previousPageTitle: translation(context).back,
              middle: const Text('Add card'),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    PaymentForm(
                      cardCvvController: _cardCvvController,
                      cardDateController: _cardDateController,
                      cardHolderController: _cardHolderController,
                      cardNumberController: _cardNumberController,
                    ), // Card details form
                    const Spacer(),
                    MainButton(
                      active: true,
                      widget: Text(
                        translation(context).confirm,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      onPressed: () {
                        bloc.add(
                          SetCardInfo(
                            cardNumber: _cardNumberController.text.toString(),
                            cardHolder: _cardHolderController.text.toString(),
                            cardCvv: _cardCvvController.text.toString(),
                            cardDate: _cardDateController.text.toString(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          )),
      listener: (context, state) {
        if (state is CardCreateError) {
          showCustomBottomSheet(
            context,
            Center(
              child: Text(state.message),
            ),
          );
        } else if (state is CardCreated) {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        }
      },
    );
  }

  @override
  void dispose() {
    _cardCvvController.dispose();
    _cardNumberController.dispose();
    _cardDateController.dispose();
    _cardHolderController.dispose();
    super.dispose();
  }
}
