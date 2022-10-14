import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      //Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/images/logo.png'),
            width: 130,
          ),
          SizedBox(
            height: 16,
          ),
          Image(
            image: AssetImage('assets/images/NameApp.png'),
            width: 200,
          ),
          SizedBox(
            height: 60,
          ),
          SpinKitFadingCube(
            color: Color.fromRGBO(104, 118, 253, 1),
            size: 50.0,
          ),
          SizedBox(height: 20),
        ],
      ),
    ));
  }
}
