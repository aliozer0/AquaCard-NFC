import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nfc_aqu/Login/LoginModel.dart';
import 'package:rxdart/rxdart.dart';

class loginService {
  LoginResponse? item;
  final BehaviorSubject<LoginResponse?> login$ = BehaviorSubject.seeded(null);

  Future<bool> getLogin(
      String userCode, String password, String tentant) async {
    String url = "https://4001.hoteladvisor.net";
    try {
      print({
        "Action": "Login",
        "Usercode": userCode,
        "Password": password,
        "Tenant": tentant,
      });
      var response = await http.post(Uri.parse(url),
          body: json.encode({
            "Action": "Login",
            "Usercode": "ali",
            "Password": "123456Aa.",
            "Tenant": "24204"
          }));

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print("Giriş başarılı");
        var responseData = jsonDecode(response.body);
        login$.value = LoginResponse.fromJson(responseData);

        print(login$.value?.loginToken);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("hataa");
      return false;
    }
  }
}
