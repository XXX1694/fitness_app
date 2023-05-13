import 'dart:convert';
import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/features/subscription_choose/data/models/subscription.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class SubscriptionRepository {
  getSubscription() async {
    // get data from storage
    final storage = await _storage;
    final token = storage.getString(tokenKey);
    final clubId = storage.getInt(clubKey);

    // create url
    String finalUrl = '${mainUrl}api/branch/$clubId/subscriptions/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.get(
        uri,
        headers: {'Authorization': 'Token $token'},
      );
      if (res.statusCode == 200) {
        // status code 200 ---- OK
        final data = json.decode(res.body);

        List<Subscription> clubList = [];
        for (int i = 0; i < data.length; i++) {
          Subscription seri = Subscription.fromJson(data[i]);
          clubList.add(seri);
        }
        if (kDebugMode) {
          print('Get Subscription: Successfully completed');
        }
        return clubList;
      }
    }
  }

  setSubscribtion(int subscriptionId) async {
    // get data from storage
    final storage = await _storage;
    final token = storage.getString(tokenKey);
    final clientId = storage.getInt(clientKey);

    // create url
    String finalUrl = '${mainUrl}api/clients/$clientId/change_subscription/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.put(uri,
          headers: {'Authorization': 'Token $token'},
          body: {'subscription': subscriptionId.toString()});
      if (res.statusCode == 200) {
        // status code 200 ---- OK
        if (kDebugMode) {
          print('Set Subscription: Successfully completed');
        }
      }
    }
  }
}
