import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isMobile) {
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
                    child: Image.network(
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
                  'I\'m currently majoring in Cognitive Science and minoring in Computer Science at University of Toronto. I specialize in implementing elegant and user friendly mobile digital experiences.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Container(height: 200),
              ],
            ));
      }
      return Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Hi, I\'m Kenny!',
                          style: GoogleFonts.poppins(
                              color: colorScheme.primary,
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
                            color: colorScheme.secondary,
                            fontSize: 35,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(height: 20),
                    Text(
                      'I\'m currently majoring in Cognitive Science and minoring in Computer Science at University of Toronto. I specialize in implementing elegant and user friendly mobile digital experiences.',
                      style: GoogleFonts.poppins(
                          color: colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.network(
                      gradientImage.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
