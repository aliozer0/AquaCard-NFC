import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nfc_aqu/Login/LoginModel.dart';
import 'package:rxdart/rxdart.dart';

class loginService {
  LoginResponse? item;
  final BehaviorSubject<LoginResponse?> login$ = BehaviorSubject.seeded(null);
  void getLogin() async {
    String url = "https://4001.hoteladvisor.net/login";
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            "Action": "Login",
            "Usercode": "ali",
            "Password": "123456Aa.",
            "Tenant": "24204",
            "ttCaptchaCode": "",
            "ttCaptchaId": ""
          }));
      if (response.statusCode == 200) {
        print("Giriş başarılı");
        var responseData = jsonDecode(response.body);
        login$.value = LoginResponse.fromJson(responseData);
        print(login$.value?.loginToken);
      } else {
        throw Exception('Sunucudan veri alınamadı.');
      }
    } catch (e) {
      print("hataa");
    }
  }
}
