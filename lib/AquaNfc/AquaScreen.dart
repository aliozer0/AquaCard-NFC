import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nfc_aqu/AquaNfc/AquaService.dart';
import 'package:nfc_aqu/Login/LoginScreen.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:rxdart/rxdart.dart';

class AquaScreen extends StatefulWidget {
  const AquaScreen({Key? key}) : super(key: key);

  @override
  State<AquaScreen> createState() => _AquaScreenState();
}

class _AquaScreenState extends State<AquaScreen> {
  final service = AquaService();

  BehaviorSubject<Color> containerColorSubject$ =
      BehaviorSubject<Color>.seeded(Colors.grey);

  void _changeBackgroundColor(Color color) {
    containerColorSubject$.add(color);
    Future.delayed(Duration(seconds: 10), () {
      containerColorSubject$.add(Colors.grey);
    });
  }

  @override
  void initState() {
    super.initState();
    _NfcReader();
  }

  void _NfcReader() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var status = await service.getNfcCard();
      if (status) {
        containerColorSubject$.add(Colors.green);
        Future.delayed(Duration(seconds: 10), () {
          containerColorSubject$.add(Colors.grey);
        });
      } else {
        containerColorSubject$.add(Colors.red);
        Future.delayed(Duration(seconds: 10), () {
          containerColorSubject$.add(Colors.grey);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Container Rengini Değiştirme'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => loginScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ))
          ],
        ),
        body: Center(
          child: StreamBuilder<Color>(
            stream: containerColorSubject$.stream,
            initialData: Colors.grey,
            builder: (context, snapshot) {
              return Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: containerColorSubject$.value,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // InkWell(
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     height: 40,
                      //     width: 100,
                      //     decoration: const BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       color: Colors.green,
                      //     ),
                      //     child: const Text(
                      //       "Yeşil Yap",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      //   onTap: () => _changeBackgroundColor(Colors.green),
                      // ),
                      // InkWell(
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     height: 40,
                      //     width: 100,
                      //     decoration: const BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       color: Colors.red,
                      //     ),
                      //     child: const Text(
                      //       "Kırmızı yap",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      //   onTap: () => _changeBackgroundColor(Colors.red),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
