// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/snakbar_helper.dart';

import 'firebsaeuploadhelper.dart';

//const url = 'http://10.0.2.2:3000/';
const url = 'https://bottlenose-incandescent-amount.glitch.me/';
const registrationlink = "${url}register";
const loginlink = "${url}login";
const findservantlink = "${url}findservant";
const findonelink = "${url}findone";
const updateoflink = "${url}updateof";
const alluserslink = "${url}allusers";
const deleteuserlink = "${url}deleteuser";
const planupdatelink = "${url}planupdate";
const countslink = "${url}counts";

// photographer
const registerservicelink = "${url}registerservice";
const getservicelink = "${url}getservice";
const getserviceslink = "${url}getservices";
const updatedgrapherlink = "${url}updatedservice";
const deleteservicelink = "${url}deleteservice";
const getoneservicelink = "${url}getoneservice";

// wallet
const registerwalletlink = "${url}registerwallet";
const getwalletlink = "${url}getwallet";
const updatewalletlink = "${url}updatewallet";
const updatewallettopuplink = "${url}updatewallettopup";

// bookings
const registerbookinglink = "${url}registerbooking";
const allbookingbyuidlink = "${url}allbookingbyuid";
const allbookingbysidlink = "${url}allbookingbysid";
const allbookinglink = "${url}allbooking";
const bookingupdatestatuslink = "${url}bookingupdatestatus";

// chat
const registerchatlink = "${url}registerchat";
const allchatbyidlink = "${url}allchatbyid";
const addchatlink = "${url}addchat";
const allchatbydidlink = "${url}allchatbydid";

// rating
const registerratinglink = "${url}registerrating";
const allratingbydidlink = "${url}allratingbydid";

// admin
const alladminlink = "${url}alladmin";
const admincomlink = "${url}admincom";
const adminplanlink = "${url}adminplan";

class ApiHelper {
  //admin
  static Future<List> alladmin() async {
    try {
      var response = await http.post(Uri.parse(alladminlink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> admincom(
      String id, String g, String c, String s, String b) async {
    try {
      var response = await http.post(Uri.parse(admincomlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
            "g": g,
            "c": c,
            "s": s,
            "b": b,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> adminplan(
      String id, String basic, String pre, String plat
      , String basicd, String pred, String platd) async {
    try {
      var response = await http.post(Uri.parse(adminplanlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
            "basic": basic,
            "pre": pre,
            "plat": plat,
            "basicd": basicd,
            "pred": pred,
            "platd": platd,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      return false;
    }
  }

  // rating
  static Future<Map> registerrating(
      String uid, String did, String ratings, String review) async {
    try {
      var response = await http.post(Uri.parse(registerratinglink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "did": did,
            "rating": ratings,
            "review": review,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } catch (e) {
      return {};
    }
  }

  static Future<List> allratingbydid(String did) async {
    try {
      var response = await http.post(Uri.parse(allratingbydidlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"did": did}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  // chat
  static Future<Map> registerchat(String uid, String did) async {
    try {
      var response = await http.post(Uri.parse(registerchatlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "did": did,
            "c": [],
            "date": DateTime.now().toString(),
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } catch (e) {
      return {};
    }
  }

  static Future<Map> allchatbyid(String id) async {
    try {
      var response = await http.post(Uri.parse(allchatbyidlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      print(data['data']);
      return data['data'];
    } catch (e) {
      return {};
    }
  }

  static Future<List> allchatbydid(String did) async {
    try {
      var response = await http.post(Uri.parse(allchatbydidlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"did": did}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      print(data['data']);
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> addchat(String id, Map dataa, String sendto) async {
    try {
      var response = await http.post(Uri.parse(addchatlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "data": dataa}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      // Map d = await findone(sendto);
      // await FirebaseHelper.sendnotificationto(
      //     d['deviceid'], "New Message", dataa['mess']);
      return data['status'] as bool;
    } catch (e) {
      return false;
    }
  }

  // service
  static Future<bool> registerservice(
      String number,
      String title,
      String des,
      String duration,
      String price,
      String frequency,
      String servantcat,
      BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registerservicelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": title,
            "des": des,
            "number": number,
            "frequency": frequency,
            "duration": duration,
            "price": price,
            "servantcat": servantcat,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['sucess']);
      return data['status'] as bool;
    } catch (e) {
      hideprogress(context);
      show_snackbar(context, 'tryagainlater');
      return false;
    }
  }

  static Future<List> getservice() async {
    try {
      var response = await http.post(Uri.parse(getservicelink),
          headers: {"Content-Type": "application/json"});
      return jsonDecode(utf8.decode(response.bodyBytes))['message'] as List;
    } catch (e) {
      return [];
    }
  }

  static Future<List> getservices(String number) async {
    try {
      var response = await http.post(Uri.parse(getserviceslink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'number': number}));
      return jsonDecode(utf8.decode(response.bodyBytes))['message'] as List;
    } catch (e) {
      return [];
    }
  }

  static Future<bool> updatedgrapher(
      String number,
      String title,
      String des,
      String duration,
      String price,
      String frequency,
      String servantcat,
      BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updatedgrapherlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": title,
            "des": des,
            "number": number,
            "frequency": frequency,
            "duration": duration,
            "price": price,
            "servantcat": servantcat,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['sucess']);
      return data['status'] as bool;
    } catch (e) {
      hideprogress(context);
      show_snackbar(context, 'tryagainlater');
      return false;
    }
  }

  static Future<bool> deleteservice(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deleteservicelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['sucess']);
      return data['status'] as bool;
    } catch (e) {
      hideprogress(context);
      show_snackbar(context, 'tryagainlater');
      return false;
    }
  }

  // auth
  static Future<bool> updateof(String number, String of) async {
    try {
      var response = await http.post(
        Uri.parse(updateoflink),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"number": number, "of": of}),
      );
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  static Future<bool> countsupdate(String number, String counts) async {
    try {
      var response = await http.post(
        Uri.parse(countslink),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"number": number, "counts": counts}),
      );
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  static Future<bool> planupdate(
      String number, String plans, String totalcounts) async {
    try {
      var response = await http.post(
        Uri.parse(planupdatelink),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {"number": number, "plans": plans, "totalcounts": totalcounts}),
      );
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  static Future<bool> registration(
      String name,
      String cnic,
      String number,
      String address,
      String age,
      String gender,
      String cat,
      String img,
      String pass,
      String deviceid,
      String fathername,
      String experience,
      String pvcname,
      String pvcnumber,
      String pvcdoc,
      String servantcat,
      String status,
      BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registrationlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": name,
            "cnic": cnic,
            "gender": gender,
            "number": number,
            "address": address,
            "age": age,
            "cat": cat,
            "img": img,
            "pass": pass,
            "deviceid": deviceid,
            "fathername": fathername,
            "experience": experience,
            "pvcname": pvcname,
            "pvcnumber": pvcnumber,
            "pvcdoc": pvcdoc,
            "servantcat": servantcat,
            "status": status,
            "plans": "0",
            "counts": "0",
            "totalcounts": '0'
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['sucess']);
      return data['status'] as bool;
    } catch (e) {
      hideprogress(context);
      show_snackbar(context, 'tryagainlater');
      return false;
    }
  }

  static Future<Map> login(
      String number, String pass, String deviceid, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(loginlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
              {"number": number, "pass": pass, "deviceid": deviceid}));
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      if (data['status']) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(data['token']);
        return decodedToken;
      } else {
        hideprogress(context);
        show_snackbar(context, data['message']);
        return {};
      }
    } catch (e) {
      hideprogress(context);
      show_snackbar(context, 'tryagainlater');
      return {};
    }
  }

  static Future<List> findservant(String servantcat) async {
    try {
      var response = await http.post(Uri.parse(findservantlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'cat': "servant", "servantcat": servantcat}));
      return jsonDecode(utf8.decode(response.bodyBytes))['data'] as List;
    } catch (e) {
      return [];
    }
  }

  static Future<Map> findone(String number) async {
    try {
      var response = await http.post(Uri.parse(findonelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"number": number}));
      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'] as Map;
      return data;
    } catch (e) {
      return {};
    }
  }

  static Future<List> allusers() async {
    try {
      var response = await http.post(Uri.parse(alluserslink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes))['user'];
      return data;
    } catch (e) {
      return [];
    }
  }

  // this is use to update user status
  static Future<bool> deleteuser(
      String id, String status, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deleteuserlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
            "status": status,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['sucess']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'tryagainlater');
      return false;
    }
  }

  static Future<Map> getoneservice(String id) async {
    try {
      var response = await http.post(Uri.parse(getoneservicelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'] as Map;
      return data;
    } catch (e) {
      return {};
    }
  }

  // wallets
  static Future<bool> registerwallet(
      String number, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registerwalletlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "number": number,
            "notpay": "0",
            "paid": "0",
            "topup": "0",
            "cbill": "0"
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      // show_snackbar(context, data['sucess']);
      return data['status'] as bool;
    } catch (e) {
      hideprogress(context);
      // show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<Map> getwallet(String number) async {
    try {
      var response = await http.post(Uri.parse(getwalletlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"number": number}));
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    } catch (e) {
      return {};
    }
  }

  static Future<bool> updatewallet(String number, String notpay, String paid,
      String topup, String cbill, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updatewalletlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "number": number,
            "notpay": notpay,
            "paid": paid,
            "topup": topup,
            "cbill": cbill
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updatewallettopup(
      String number, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updatewallettopuplink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"number": number}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      return false;
    }
  }

  // booking
  static Future<bool> registerbooking(String uid, String sid, String sverid,
      String notes, String lat, String lon, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registerbookinglink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "sid": sid,
            "sverid": sverid,
            "date": DateTime.now().toString(),
            "notes": notes,
            "status": "new",
            "lat": lat,
            "lon": lon
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> allbookingbyuid(String uid) async {
    try {
      var response = await http.post(Uri.parse(allbookingbyuidlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'uid': uid}));
      return jsonDecode(utf8.decode(response.bodyBytes))['data'] as List;
    } catch (e) {
      return [];
    }
  }

  static Future<List> allbookingbysid(String sid) async {
    try {
      var response = await http.post(Uri.parse(allbookingbysidlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'sid': sid}));
      return jsonDecode(utf8.decode(response.bodyBytes))['data'] as List;
    } catch (e) {
      return [];
    }
  }

  static Future<List> allbooking() async {
    try {
      var response = await http.post(Uri.parse(allbookinglink),
          headers: {"Content-Type": "application/json"});
      return jsonDecode(utf8.decode(response.bodyBytes))['data'] as List;
    } catch (e) {
      return [];
    }
  }

  static Future<bool> bookingupdatestatus(String id, String status) async {
    try {
      var response = await http.post(Uri.parse(bookingupdatestatuslink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "status": status}));
      return jsonDecode(utf8.decode(response.bodyBytes))['status'];
    } catch (e) {
      return false;
    }
  }
}
