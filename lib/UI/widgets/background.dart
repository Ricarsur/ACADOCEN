import 'package:acadocen/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundPage extends StatelessWidget {
  final String title;
  final Widget child;
  const BackgroundPage({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            ColorsApp.gradiant1,
            ColorsApp.gradiant2,
          ],
        ),
      ),
      child: Stack(children: [
        Column(
          children: [
            const SizedBox(height: 50),
            Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height - 105,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Stack(
                children: [
                  Positioned(top: 0, left: 0, right: 0, child: child),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
