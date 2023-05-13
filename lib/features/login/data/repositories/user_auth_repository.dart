import 'dart:convert';
import 'package:tamos_family_club/common/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class UserAuthRepository {
  userLogIn(String username, String password) async {
    // get data from storage
    final storage = await _storage;

    // create url
    String finalUrl = '${mainUrl}auth/token/login/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.post(
        uri,
        headers: {},
        body: {
          'username': username,
          'password': password,
        },
      );
      if (res.statusCode == 200) {
        // status code 200 ---- OK
        final data = json.decode(res.body);
        storage.setString(tokenKey, data['auth_token']);
        if (kDebugMode) {
          print(
              'User Auth: User with token - ${data['auth_token']} successfully log in');
        }
        return true;
      } else {
        if (kDebugMode) {
          print('User Auth: User auth faild');
        }
        return false;
      }
    }
  }

  isUserOnline() async {
    final storage = await _storage;
    final isOnline = storage.getString(tokenKey);
    if (isOnline != null) {
      if (kDebugMode) {
        print('User: Online');
        print('User: token - $isOnline');
      }
      return true;
    } else {
      if (kDebugMode) {
        print('User: Offline');
      }
      return false;
    }
  }

  gerUserID() async {
    // get data from phone storage
    final storage = await _storage;
    final token = storage.getString(tokenKey);

    // create url
    String finalUrl = '${mainUrl}users/get_id/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.post(
        uri,
        headers: {'Authorization': 'Token $token'},
      );

      if (res.statusCode == 200) {
        // status code 200 ---- OK
        final data = json.decode(res.body);

        // save user id in phone storage
        storage.setInt(idKey, data['user_id']);

        if (kDebugMode) {
          print('User Id: ${data['user_id']} saved');
        }
        return data;
      }
    }
  }

  gerClientID() async {
    // get data from phone storage
    final storage = await _storage;
    final token = storage.getString(tokenKey);

    // create url
    String finalUrl = '${mainUrl}api/my_client_id/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.get(
        uri,
        headers: {'Authorization': 'Token $token'},
      );

      if (res.statusCode == 200) {
        // status code 200 ---- OK
        final data = json.decode(res.body);

        // save user id in phone storage
        storage.setInt(clientKey, data['id']);

        if (kDebugMode) {
          print('Client ID: ${data['id']} saved');
        }
        return true;
      } else {
        if (kDebugMode) {
          print('Client ID: get error');
        }
        return false;
      }
    }
  }

  userLogOut() async {
    final storage = await _storage;
    final success1 = await storage.remove(tokenKey);
    final success2 = await storage.remove(idKey);
    if (success1 && success2) {
      if (kDebugMode) {
        print('User: Successfully log out');
      }
      return true;
    } else {
      if (kDebugMode) {
        print('User: Log out error');
      }
      return false;
    }
  }
}
