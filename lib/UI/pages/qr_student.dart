import 'package:acadocen/UI/pages/pages.dart';
import 'package:flutter/material.dart';

class QrStudent extends StatelessWidget {
  const QrStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text('Tu código QR',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(98, 96, 96, 1),
                        )),
                    SizedBox(height: 15),
                    Text('Tu profesor debe escanear este código',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(98, 96, 96, 1),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: QrImage(
                    data: arguments.toString(),
                    version: QrVersions.auto,
                    size: 300.0,
                    foregroundColor: Color.fromARGB(255, 40, 102, 173),
                    gapless: true,
                    errorCorrectionLevel: QrErrorCorrectLevel.Q,
                  ),
                ),
                Image.asset('assets/images/qr-paint.png',
                    width: MediaQuery.of(context).size.width)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
