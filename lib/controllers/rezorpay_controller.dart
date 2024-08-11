import 'dart:developer';
import 'package:fake_store/data/model/response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../widgets/pymt _suss_dialogue.dart';

class RezorpayController extends GetxController {
  late Razorpay _razorpay;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    log("Success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log("payment failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    log("message");
  }

  //checkout
  onPay({double? payment})  {
    var options = {
      'key': 'rzp_test_4JAFO6rrSmwQpM', // payment key
      'amount': payment?.toStringAsFixed(3),
      'name': 'Fake Store',
      'description': 'Fake Store is type of template just for studies',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      log("$e ----------Payment error");
    }
  }
}
