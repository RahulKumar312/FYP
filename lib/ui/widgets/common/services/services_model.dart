import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:geolocator/geolocator.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/snakbar_helper.dart';
import 'package:stacked/stacked.dart';
import "package:http/http.dart" as http;
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelpers/apihelper.dart';

class ServicesModel extends BaseViewModel {
  final sharedpref = locator<SharedprefService>();
  final navigationService = locator<NavigationService>();

  TextEditingController search = TextEditingController();
  TextEditingController notes = TextEditingController();

  Future<void> book(BuildContext context, String number, String sverid,
      int price, String type) async {
    Map d = await ApiHelper.findone(sharedpref.readString("phone").toString());

    List admin = await ApiHelper.alladmin();
    Map ad = admin[0];
    String amt = "";
    if (type == "gardner") {
      amt = ad['g'];
    } else if (type == "cook") {
      amt = ad['c'];
    } else if (type == "sweaper") {
      amt = ad['s'];
    } else {
      amt = ad['b'];
    }

    if (d['plans'] == "0") {
      show_snackbar(context, "Add a subscription Plan To Get discount");
      abook(context, price, amt, number, sverid,
          (price + int.parse(amt)).toString());
    } else if (int.parse(d['counts']) >= int.parse(d['totalcounts'])) {
      show_snackbar(context, "Please renew your plan");
    } else {
      await ApiHelper.countsupdate(sharedpref.readString("phone"),
          (int.parse(d['counts']) + 1).toString());
      int dis = 0;
      if (d['plans'] == "0") {
        dis = int.parse(ad['basicd']);
      } else if (d['plans'] == "1") {
        dis = int.parse(ad['pred']);
      } else {
        dis = int.parse(ad['platd']);
      }
      int a = int.parse(amt);
      if (dis<a && dis<price){
        price = price - dis;
        a = a - dis;
      }
      abook(
          context, price, a.toString(), number, sverid, (price + a).toString());
    }
  }

  Future<void> abook(BuildContext context, int price, String amt, String number,
      String sverid, String pprice) async {
    print(pprice);
    bool c = await makePayment(pprice);
    // bool c = true;
    if (!c) {
      show_snackbar(context, "Unsuccessful");
    } else {
      displayprogress(context);
      Map wdata = await ApiHelper.getwallet(sharedpref.readString('phone'));
      if (wdata['status']) {
        Map rdata = await ApiHelper.getwallet(number);
        bool ru = await ApiHelper.updatewallet(
            number,
            rdata['rest']['notpay'],
            rdata['rest']['paid'],
            "${int.parse(rdata['rest']['topup']) + price}",
            price.toString(),
            context);
        if (ru) {
          wdata = await ApiHelper.getwallet(sharedpref.readString('phone'));
          bool uw = await ApiHelper.updatewallet(
              sharedpref.readString('phone'),
              wdata['rest']['notpay'],
              "${int.parse(wdata['rest']['paid']) + price}",
              wdata['rest']['topup'],
              price.toString(),
              context);
          if (uw) {
            Position p = await location();
            Map adata = await ApiHelper.getwallet("0000-0000000");
            await ApiHelper.updatewallet(
                "0000-0000000",
                adata['rest']['notpay'],
                adata['rest']['paid'],
                "${int.parse(adata['rest']['topup']) + int.parse(amt)}",
                adata['rest']['cbill'],
                context);
            bool result = await ApiHelper.registerbooking(
                sharedpref.readString('phone'),
                number,
                sverid,
                notes.text,
                p.latitude.toString(),
                p.longitude.toString(),
                context);
            if (result) {
              navigationService.back();
              navigationService.back();
            }
          }
        }
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

  Future<Position> location() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
