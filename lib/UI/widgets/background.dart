import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundColor extends StatelessWidget {
  final String title;
  const BackgroundColor({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF1488CC),
                Color(0xFF2B32B2),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 35,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  title,
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const BackgroundWhite(),
          ],
        ),
      ),
    );
  }
}

class BackgroundWhite extends StatelessWidget {
  const BackgroundWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 120),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))));
  }
}
