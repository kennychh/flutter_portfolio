import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isMobile && isPortrait(context)) {
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
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset(
                      gradientImage.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                ),
                Text('Hi, I\'m Kenny!',
                    style: GoogleFonts.poppins(
                        color: scheme.primary,
                        fontSize: 32,
                        fontWeight: FontWeight.w500)),
                Container(
                  height: 10,
                ),
                Text(
                  'Front End Developer',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Container(height: 25),
                Text(
                  'I\'m currently majoring in Cognitive Science and minoring in Computer Science at University of Toronto. I specialize in implementing elegant and user friendly mobile digital experiences.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: scheme.onBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Container(height: 200),
              ],
            ));
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('Hi, I\'m Kenny!',
                      style: GoogleFonts.poppins(
                          color: scheme.primary,
                          fontSize: 88,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  height: 20,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Front End Developer',
                    style: GoogleFonts.poppins(
                        color: scheme.secondary,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(height: 20),
                Text(
                  'I\'m currently majoring in Cognitive Science and minoring in Computer Science at University of Toronto. I specialize in implementing elegant and user friendly mobile digital experiences.',
                  style: GoogleFonts.poppins(
                      color: scheme.onBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 3,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  gradientImage.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}