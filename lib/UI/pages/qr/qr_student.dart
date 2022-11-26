import 'package:acadocen/UI/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrStudent extends StatefulWidget {
  const QrStudent({super.key});

  @override
  State<QrStudent> createState() => _QrStudentState();
}

class _QrStudentState extends State<QrStudent> {
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Tu código QR',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(98, 96, 96, 1),
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.22),
                          InkWell(
                            onTap: () {
                              showExitPopup();
                            },
                            child: Icon(Icons.exit_to_app,
                                color: Color.fromARGB(255, 106, 106, 106)),
                          )
                        ],
                      ),
                    ),
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

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('salir de la aplicación'),
            content: Text('¿Quieres salir de la aplicación?'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () => Get.toNamed('/login'),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
