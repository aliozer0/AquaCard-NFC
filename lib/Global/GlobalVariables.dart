import 'package:rxdart/rxdart.dart';

import '../Login/LoginModel.dart';

BehaviorSubject<LoginResponse?> login$ = BehaviorSubject.seeded(null);
