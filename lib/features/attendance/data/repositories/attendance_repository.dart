import 'package:tamos_family_club/common/constants.dart';
import 'package:tamos_family_club/features/attendance/data/models/attendance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];

class AttendanceRepository {
  final _storage =
      SharedPreferences.getInstance(); // connecting with mobile storage

  clubEnter() async {
    //taking url of attandence api
    String finalUrl = '${mainUrl}api/attendances/';
    Uri? uri = Uri.tryParse(finalUrl);

    final storage = await _storage;
    final token = storage.getString(tokenKey);
    // print('user_id: $userId');
    // print('token: $token');
    if (uri != null) {
      var res = await http.post(
        uri,
        headers: {'Authorization': 'Token $token'},
        body: {},
      );

      if (res.statusCode == 201) {
        // status code 201 ---- Created
        if (kDebugMode) {
          print('Attendance enter: Success');
          print(res.body);
        }
        final data = json.decode(res.body);
        storage.setInt(attendanceKey, data['id']);
        return true;
      } else {
        if (kDebugMode) {
          print(res.body);
        }
        return false;
      }
    } else {}
  }

  getAttendance() async {
    String finalUrl = '${mainUrl}api/attendances/';
    Uri? uri = Uri.tryParse(finalUrl);

    final storage = await _storage;
    final token = storage.getString(tokenKey);

    if (uri != null) {
      var res = await http.get(
        uri,
        headers: {'Authorization': 'Token $token'},
      );
      List<dynamic> data = json.decode(res.body);
      List<Attendance> model = [];
      for (int i = 0; i < data.length; i++) {
        model.add(Attendance.fromJson(data[i]));
      }

      return model;
    } else {}
  }

  clubExit() async {
    final storage = await _storage;
    final aId = storage.getInt(attendanceKey);
    final token = storage.getString(tokenKey);

    String finalUrl = '${mainUrl}api/attendances/$aId/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      await http.put(
        uri,
        headers: {'Authorization': 'Token $token'},
      );
      return true;
    } else {}
  }
}
