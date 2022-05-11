import 'package:flutter/cupertino.dart';
import '../../components/parallax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appBarOffsetContainer,
            Container(
              height: 25,
            ),
            ListItem(
              imageUrl: gradientImage.imageUrl,
              aspectRatio: 1,
              showText: false,
              borderRadius: 80,
            ),
            Container(
              height: 40,
            ),
            Text('Hi, I\'m Kenny!',
                style: GoogleFonts.poppins(
                    color: colorScheme.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.w500)),
            Container(
              height: 20,
            ),
            Text(
              'Front End Developer',
              style: GoogleFonts.poppins(
                  color: colorScheme.secondary,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            Container(height: 20),
            Text(
              'I\'m currently majoring in Cognitive Science and minoring in computer science at University of Toronto. I specialize in implementing elegant and user friendly digital experiences.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: colorScheme.secondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            Container(height: 200),
          ],
        ));
  }
}
