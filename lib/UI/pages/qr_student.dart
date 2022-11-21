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
          child: Column(
            children: <Widget>[
              Text('Tu código QR',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              QrImage(
                data: arguments.toString(),
                version: QrVersions.auto,
                size: 200.0,
                foregroundColor: Color.fromARGB(255, 6, 69, 121),
                gapless: true,
                errorCorrectionLevel: QrErrorCorrectLevel.Q,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
