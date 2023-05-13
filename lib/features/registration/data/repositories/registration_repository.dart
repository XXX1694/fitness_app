import 'dart:convert';
import 'package:tamos_family_club/common/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class RegistrationRepository {
  createUser(String username, String password) async {
    // taking data from phone storage
    final storage = await _storage;

    // creating url
    String finalUrl = '${mainUrl}auth/users/';
    String finalUrl1 = '${mainUrl}auth/token/login/';
    Uri? uri = Uri.tryParse(finalUrl);
    Uri? urii = Uri.tryParse(finalUrl1);

    if (uri != null && urii != null) {
      var res = await http.post(
        uri,
        headers: {},
        body: {
          'username': username,
          'password': password,
        },
      );
      var res1 = await http.post(
        urii,
        headers: {},
        body: {
          'username': username,
          'password': password,
        },
      );
      if (res.statusCode == 201) {
        // status code 200 ---- OK
        final data = json.decode(res.body);
        storage.setInt(idKey, data['id']);
        if (kDebugMode) {
          print(
              'Registration: User with id ${data['id']} created successfully');
        }
        if (res1.statusCode == 200) {
          final data1 = json.decode(res1.body);
          storage.setString(tokenKey, data1['auth_token']);
          if (kDebugMode) {
            print(
                'Registration: User token ${data1['auth_token']} was saved successfully');
          }
        } else {
          if (kDebugMode) {
            print('Registration: User token get faild');
          }
        }
        return true;
      } else {
        if (kDebugMode) {
          print('Registration: User create faild');
        }
        return false;
      }
    }
  }

  editProfile(String firstName, String lastName, String birthDate,
      String number, String email) async {
    // taking data from phone storage
    final storage = await _storage;
    final id = storage.getInt(idKey);
    final token = storage.getString(tokenKey);

    // creating url
    String finalUrl = '${mainUrl}users/$id/update/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      // patch to edit user
      final res = await http.put(
        uri,
        headers: {'Authorization': 'Token $token'},
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'birth_date': birthDate,
          'phone': number,
          'email': email,
          'is_client': 'true',
        },
      );
      if (res.statusCode == 200) {
        if (kDebugMode) print('User edit: Success');
        return true;
      } else {
        if (kDebugMode) print('User edit: Error');
        print('Edit profile:');
        print(res.body);
        return false;
      }
    }
  }

  clientCreate() async {
    final storage = await _storage;
    final token = storage.getString(tokenKey);
    final id = storage.getInt(idKey);

    // creating url
    String finalUrl = '${mainUrl}api/mobile/client/create/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      final res = await http.post(
        uri,
        headers: {
          'Authorization': 'Token $token',
        },
        body: {
          'user': id.toString(),
        },
      );
      if (res.statusCode == 201) {
        // status code 201 ---- Created
        final data = json.decode(res.body);
        storage.setInt(clientKey, data['id']);
        if (kDebugMode) {
          print('Client: Successfully created with id ${data['id']}');
        }
        return true;
      } else {
        if (kDebugMode) {
          print('Client: Creating error}');
        }
        return false;
      }
    }
  }
}
