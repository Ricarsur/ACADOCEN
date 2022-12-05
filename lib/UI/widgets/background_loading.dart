import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../misc/colors.dart';

class BackgroundLoading extends StatefulWidget {
  final String? ruta;
  final int tiempo;

  const BackgroundLoading({super.key, this.ruta = '/login', this.tiempo = 3});

  @override
  State<BackgroundLoading> createState() => _BackgroundLoadingState();
}

class _BackgroundLoadingState extends State<BackgroundLoading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.ruta != '') {
      Future.delayed(Duration(seconds: widget.tiempo)).then(
        (value) {
          Get.toNamed(widget.ruta!);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', width: 130, height: 130),
          SizedBox(
            height: 50,
          ),
          SpinKitFadingCube(
            size: 50,
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorsApp.gradiant1,
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
