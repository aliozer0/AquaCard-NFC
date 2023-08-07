import 'package:flutter/material.dart';
import 'package:nfc_aqu/AquaNfc/AquaScreen.dart';
import 'package:nfc_aqu/Login/LoginService.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final service = loginService();
  final _formKey = GlobalKey<FormState>();
  String _userCode = '';
  String _hotelCode = '';
  String _password = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      print('User Code: $_userCode');
      print('Hotel Code: $_hotelCode');
      print('Password: $_password');
      bool response = await service.getLogin(
        _userCode,
        _password,
        _hotelCode,
      );

      print('response: $response');

      if (response) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => AquaScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    EdgeInsets.only(bottom: 40, top: 70, right: 10, left: 10),
                width: size.width,
                child: Image.asset(
                  'assets/aquapark_image.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                width: size.width * 0.7,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Tentant'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Tentant';
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    _hotelCode = value;
                  },
                ),
              ),
              Container(
                width: size.width * 0.7,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'User Code'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your User Code';
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    _userCode = value;
                  },
                ),
              ),
              Container(
                width: size.width * 0.7,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                  },
                  onChanged: (value) {
                    _password = value;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.3,
                  height: size.height * 0.04,
                  decoration: const BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                onTap: () => _submitForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
