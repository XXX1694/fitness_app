import 'dart:convert';
import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/features/coach/data/models/coach_info.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class CoachInfoRepository {
  getCoachInfo(int coachId) async {
    final storage = await _storage;
    final token = storage.getString(tokenKey);

    // create url
    String finalUrl = '${mainUrl}api/mobile/trainers/$coachId/detail/';
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
        CoachInfoModel coachInfo;
        coachInfo = CoachInfoModel.fromJson(data);
        return coachInfo;
      }
    }
  }

  // getCoach(int coachId) async {
  //   final storage = await _storage;
  //   final token = storage.getString(tokenKey);
  //   final client = storage.getString(clientKey);

  //   // create url
  //   String finalUrl = 'clients/$client/change_trainer/';
  //   Uri? uri = Uri.tryParse(finalUrl);

  //   if (uri != null) {
  //     var res = await http.put(
  //       uri,
  //       headers: {'Authorization': 'Token $token'},
  //       body: {'trainer': }
  //     );
  //     if (res.statusCode == 200) {
  //       // status code 200 ---- OK
  //       final body = utf8.decode(res.bodyBytes);
  //       final data = json.decode(body);
  //       CoachInfoModel coachInfo;
  //       coachInfo = CoachInfoModel.fromJson(data);
  //       return coachInfo;
  //     }
  //   }
  // }
}
