import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nfc_aqu/Login/LoginModel.dart';

import '../Global/GlobalVariables.dart';

class loginService {
  LoginResponse? item;

  Future<bool> getLogin(
      String userCode, String password, String tentant) async {
    String url = "https://4001.hoteladvisor.net";

    try {
      var response = await http.post(Uri.parse(url),
          body: json.encode({
            "Action": "Login",
            "Usercode": userCode,
            "Password": password,
            "Tenant": tentant,
          }));

      if (response.statusCode == 200) {
        print("Login Request Success");
        var responseData = jsonDecode(response.body);
        if (responseData["Success"]) {
          login$.value = LoginResponse.fromJson(responseData);
          print(' loginToken : ${login$.value!.loginToken}');
          return true;
        }
        throw responseData["Message"];
      }
      return false;
    } catch (e) {
      print("Error");
      print(e);
      return false;
    }
  }
}
