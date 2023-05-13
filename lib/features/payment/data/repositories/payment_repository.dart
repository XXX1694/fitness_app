import 'package:tamos_family_club/common/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final mainUrl = dotenv.env['API_URL'];
final _storage = SharedPreferences.getInstance();

class PaymentRepository {
  setCardInfo(String cardNumber, String cardHolder, String cardCvv,
      String cardDate) async {
    // get data from storage
    final storage = await _storage;
    final token = storage.getString(tokenKey);
    final userId = storage.getInt(idKey);

    // create url
    String finalUrl = '${mainUrl}api/credit_card/create/';
    Uri? uri = Uri.tryParse(finalUrl);

    if (uri != null) {
      var res = await http.post(uri, headers: {
        'Authorization': 'Token $token'
      }, body: {
        "card_number": cardNumber,
        "name_on_card": cardHolder,
        "expiry_date": cardDate,
        "security_code": cardCvv,
        "user": userId.toString(),
      });
      if (res.statusCode == 201) {
        // status code 201 ---- Created
        if (kDebugMode) {
          print('Card create: Success request');
          print(res.body);
        }
        return true;
      } else {
        return res.body;
      }
    }
  }
}
