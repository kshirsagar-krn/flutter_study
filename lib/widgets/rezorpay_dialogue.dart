import 'dart:developer';
import 'package:fake_store/controllers/rezorpay_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/custom_button.dart';
import '../utils/theme.dart';
import 'pymt _suss_dialogue.dart';

class RezOnlinePayment {
  dialogue(context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const RezorpayOnlinePayment(),
          );
        });
  }
}

class RezorpayOnlinePayment extends StatefulWidget {
  const RezorpayOnlinePayment({super.key});

  @override
  State<RezorpayOnlinePayment> createState() => _RezorpayOnlinePaymentState();
}

class _RezorpayOnlinePaymentState extends State<RezorpayOnlinePayment> {
  RezorpayController rezorpayController = Get.put(RezorpayController());
  TextEditingController _paymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.currency_rupee,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Add your payment",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                    "Estimate your payment plan for your next purchase. A service fee may be applied",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 11,
                      height: 1.3,
                      fontWeight: FontWeight.w300,
                    ),
                children: [
                  TextSpan(
                    text: "- View FAQ".toUpperCase(),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 11,
                          height: 1.3,
                          color: Colors.green.shade800,
                        ),
                  ),
                ]),
          ),
          //

          Center(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: IntrinsicWidth(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _paymentController,
                        textDirection: TextDirection.ltr,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                        decoration: const InputDecoration(
                          hintText: '0',
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            size: 24,
                            weight: 800,
                            color: primaryText,
                          ),
                          prefixIconConstraints:
                              BoxConstraints(minWidth: 0, minHeight: 0),
                          hintStyle: TextStyle(fontSize: 30),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 100+
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
       
                      setState(() {
                        // other calculation
                        double price = double.parse(
                            _paymentController.text.isEmpty
                                ? "0"
                                : _paymentController.text);
                        double demoPrice = <double>[100, 200, 300, 500][i];
                        _paymentController.text =
                            (price + demoPrice).toString();
                      });
                    },
                    child: Container(
                      // margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      child: Text(["100+", "200+", "300+", "500+"][i]),
                    ),
                  ),
                ),
              const SizedBox(
                width: 10,
              ),
              //
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onClick: () {
              double payAmount = double.parse(_paymentController.text);
              rezorpayController.onPay(payment: double.parse( _paymentController.text));
            },
            buttonText: 'Payment Now',
            textFontSize: 13,
            bckColor: primaryText,
            width: double.infinity,
            buttonType: ButtonType.fillButton,
            buttonRadius: 4,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onClick: (

                ) {
              // cancel payment getway
              Navigator.pop(context);
            },
            buttonText: 'Do it later',
            textFontSize: 13,
            bckColor: primaryText,
            width: double.infinity,
            buttonType: ButtonType.onlyText,
            buttonRadius: 4,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
