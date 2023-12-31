/*
Bu modülde kullanıcı giriş butonuna bastıktan sonra Server'a istek atılır. Eğer istek başarılı ise BehaviorSubject objesi olan login$'in değerine server'dan dönen istek atanır.
*/

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nfc_aqu/Login/LoginModel.dart';

import '../Global/GlobalVariables.dart';

class loginService {
  LoginResponse? item;
  // loginService getLogin() fonkisyonu ile userCode,tentant ve password sunucumuza iletiyoruz. Eğer kullanıcı doğruysa Response.statusCode==200 gelecek değilse error mesajı geri döndürecek.

  Future<bool> getLogin(
      String userCode, String password, String tentant) async {
    String url = "https://4001.hoteladvisor.net";

    try {
      var response = await http.post(Uri.parse(url), //Verilen url'ye istek attığımız yer burası.
          body: json.encode({
            "Action": "Login",
            "Usercode": userCode,
            "Password": password,
            "Tenant": tentant,
          }));

      if (response.statusCode == 200) {
        // istek başarılı
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
    } catch (e) { //İstek atma  sırasında bir hata olursa program bloğa girip false döndürecek.
      print("Error");
      print(e);
      return false;
    }
  }
}
