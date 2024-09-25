import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/snakbar_helper.dart';
import 'package:stacked/stacked.dart';
import "package:http/http.dart" as http;

import '../../../app/app.locator.dart';
import '../../../services/sharedpref_service.dart';
import '../../common/apihelpers/apihelper.dart';

class PlansViewModel extends BaseViewModel {
  final sharedpref = locator<SharedprefService>();

  String plan = "0";
  String price = "";
  String nbook = "";

  Future<void> changeplan(BuildContext context) async {
    if (plan == "0") {
      show_snackbar(context, "Select a Plan");
    } else {
      bool c = await makePayment(price);
      if (!c) {
        show_snackbar(context, "Unsuccessful");
      } else {
        displayprogress(context);
        Map adata = await ApiHelper.getwallet("0000-0000000");
        await ApiHelper.updatewallet(
            "0000-0000000",
            adata['rest']['notpay'],
            adata['rest']['paid'],
            "${int.parse(adata['rest']['topup']) + int.parse(price)}",
            adata['rest']['cbill'],
            context);
        await ApiHelper.planupdate(sharedpref.readString("phone"), plan, nbook);
        await ApiHelper.countsupdate(sharedpref.readString("phone"), "0");
        hideprogress(context);
        show_snackbar(context, "Added Sucessfully");
        Navigator.pop(context);
      }
    }
  }

  Map<String, dynamic>? paymentIntent;
  createPaymentIntent(String amnount) async {
    try {
      Map<String, dynamic> body = {
        'amount': (int.parse(amnount) * 100).toString(),
        'currency': 'USD',
      };
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51PAzxA07Ok4Rl8ZFS7PWTA1zIgg8Y86p2VX0UR8OjEgARGjBYEzEWGELxFyMvn9wWta4yk8L8qvhu0wHGF3kNUto00xpGmEUBt',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return json.decode(response.body);
    } catch (e) {
      print("failing : $e");
    }
  }

  Future<bool> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      return true;
    } catch (e) {
      print("fail : $e");
      return false;
    }
  }

  Future<bool> makePayment(String amnount) async {
    try {
      paymentIntent = await createPaymentIntent(amnount);
      var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: 'US',
        currencyCode: 'USD',
        testEnv: true,
      );
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: "Sabir",
          googlePay: gpay,
        ),
      );
      bool c = await displayPaymentSheet();
      return c;
    } catch (e) {
      print("failed : $e");
      return false;
    }
  }
}
