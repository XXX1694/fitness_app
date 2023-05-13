import 'dart:convert';
import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/features/profile/data/models/profile.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class ProfileRepository {
  getProfileData() async {
    // get data from phone storage
    final storage = await _storage;
    final id = storage.getInt(clientKey);
    final token = storage.getString(tokenKey);

    // create url
    String finalUrl = '${mainUrl}api/mobile/clients/$id/profile/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.get(
        uri,
        headers: {'Authorization': 'Token $token'},
      );

      if (res.statusCode == 200) {
        final body = utf8.decode(res.bodyBytes);
        final data = json.decode(body);
        return Profile.fromJson(data);
      }
    }
  }
}
