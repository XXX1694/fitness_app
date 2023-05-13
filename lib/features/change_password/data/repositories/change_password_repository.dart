import 'package:tamos_family_club/common/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class ChangePasswordRepository {
  changePassword(String oldPass, String newPass) async {
    final storage = await _storage;
    final token = storage.getString(tokenKey);
    // creating url

    String finalUrl = '${mainUrl}users/change-password/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.put(
        uri,
        headers: {'Authorization': 'Token $token'},
        body: {
          'old_password': oldPass,
          'new_password': newPass,
        },
      );

      if (res.statusCode == 200) {
        // status code 200 ---- OK
        if (kDebugMode) {
          print('Change password: Success');
          print('Change password: $oldPass -> $newPass');
        }
        return true;
      } else {
        if (kDebugMode) {
          print('Change password: Error');
          print(res.body);
        }
        return false;
      }
    }
  }
}
