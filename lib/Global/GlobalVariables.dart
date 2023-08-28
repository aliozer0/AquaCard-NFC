/*
Burada RxDart State Management'in özelliği olan  'BehaviorSubject' sınıfına ait bir obje oluşturuyoruz.
Bu objeye programın her bölgesinden ulaşabiliyoruz ve objenin değeri değişirse eğer bundan haberdar olabiliyoruz.

login$ model class ile oluşturduğumuz model objesini temsil etmektedir.
*/

import 'package:get_it/get_it.dart';
import 'package:nfc_aqu/Login/LoginScreen.dart';
import 'package:rxdart/rxdart.dart';

import '../Login/LoginModel.dart';

final getIt = GetIt.instance;

BehaviorSubject<LoginResponse?> login$ = BehaviorSubject.seeded(null);

class ServiceLocator {
  void setup() {
    getIt.registerSingleton<loginScreen>(loginScreen());
  }
}
