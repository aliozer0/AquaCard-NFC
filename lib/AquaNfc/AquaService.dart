import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nfc_aqu/Global/GlobalVariables.dart';

import 'AquaModel.dart';

class AquaService {
  Future<bool> getNfcCard() async {
    String url =
        'https://www.randoxm.org/integers/?num=1&min=1&max=9&col=1&base=10&format=plain&rnd=new';

    try {
      var urle = Uri.parse(url);
      var response = await http.get(urle);

      print(response.body);
      if (response.statusCode == 200) {
        print(" Istek başarılı ");
        final number = int.parse(response.body);
        if (number % 2 == 0) {
          return true;
        }
        return false;
      }
      print('Request failed with status: ${response.statusCode}');
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool?> getCard({String? cardId}) async {
    String url = "https://4001.hoteladvisor.net/";
    try {
      var response = await http.post(Uri.parse(url),
          body: json.encode({
            "Parameters": {
              "TURNSTILEID": 18,
              "CARDID": cardId,
              "HOTELID": login$.value!.tenancy?.hotelid,
              "DIRECTION": 1,
              "SELECTTT": 0
            },
            "Action": "Execute",
            "Object": "SP_PARK_TURNSTILE_PASS_CONTROL_BY_GUESTID",
            "LoginToken": login$.value!.loginToken
          }));

      if (response.statusCode == 200) {
        print(" NFC isteği başarılı ");
        print(response.body);
        var responseData = jsonDecode(response.body);
        CardResponse cardResponse = CardResponse.fromJson(responseData[0][0]);

        return cardResponse.success;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
