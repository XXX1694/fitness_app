import 'dart:convert';
import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/features/choose/club_choose/data/models/club.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class ClubRepository {
  getClubList() async {
    // get data from storage
    final storage = await _storage;
    final token = storage.getString(tokenKey);

    // create url
    String finalUrl = '${mainUrl}api/branches/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.get(
        uri,
        headers: {'Authorization': 'Token $token'},
      );
      if (res.statusCode == 200) {
        // status code 200 ---- OK
        final body = utf8.decode(res.bodyBytes);
        final data = json.decode(body);
        List<Club> clubList = [];
        for (int i = 0; i < data.length; i++) {
          Club seri = Club.fromJson(data[i]);
          clubList.add(seri);
        }

        if (kDebugMode) {
          print('Get Branch: Successfully completed');
        }
        return clubList;
      }
    }
  }

  setClub(int clubId) async {
    final storage = await _storage;
    storage.setInt(clubKey, clubId);
    if (kDebugMode) {
      print('Set Branch: Brunch id saved: $clubId');
    }
  }
}
