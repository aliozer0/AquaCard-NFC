import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  BehaviorSubject<String> lottieAnimationSubject$ =
      BehaviorSubject<String>.seeded("assets/animation/animations.json");

  @override
  void initState() {
    super.initState();
    _NfcReader();
  }

  void _NfcReader() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var cardData = (tag.data["isodep"]["identifier"]).toString();

      String formattedCardData =
          cardData.replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '');
      print(" CardID: $formattedCardData");
      var status = await service.getCard(cardId: formattedCardData);

      if (status == true) {
        lottieAnimationSubject$.add("assets/animation/success.json");
        Future.delayed(Duration(seconds: 5), () {
          lottieAnimationSubject$.add("assets/animation/animations.json");
          containerColorSubject$.add(Colors.grey);
        });
      } else {
        lottieAnimationSubject$.add("assets/animation/cancel.json");
        Future.delayed(const Duration(seconds: 5), () {
          lottieAnimationSubject$.add("assets/animation/animations.json");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String animatedName = "";

    return Scaffold(
        appBar: AppBar(
          title: const Text('WaterHill NFC'),
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
          child: StreamBuilder<String>(
              stream: lottieAnimationSubject$.stream,
              initialData: "assets/animation/animations.json",
              builder: (context, snapshot) {
                return Column(children: [
                  Container(
                    color: Colors.white, // Conteyner rengi
                    width: double.infinity,
                    height: 200,
                    alignment: Alignment.center,
                    child: Center(
                      child: Lottie.asset(
                        snapshot.data!, // Animasyon adı
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]);
                // return Container(
                //     alignment: Alignment.bottomCenter,
                //     width: size.width,
                //     height: size.height,
                //     child: Lottie.asset(animatedName);
                //
                //     // Column(
                //     //   mainAxisAlignment: MainAxisAlignment.center,
                //     //   crossAxisAlignment: CrossAxisAlignment.center,
                //     //   children: [
                //     //     Container(
                //     //       child: Lottie.asset("assets/success.json"),
                //     //     ), // Green
                //     //     Container(
                //     //       child: Lottie.asset("assets/cancel.json"),
                //     //     ), // Red
                //     //     Container(
                //     //       child: Lottie.asset("assets/animations.json",
                //     //           height: size.height * 0.5),
                //     //     ), // Default
                //     //   ],
                //     // ),
                //     );
              }),
        ));
  }
}
