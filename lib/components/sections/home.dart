import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globals.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appBarOffsetContainer,
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('Kenny Chan',
                    style: TextStyle(
                        fontFamily: 'Euclid',
                        letterSpacing: -4,
                        color: scheme.onBackground,
                        fontSize: 130,
                        fontWeight: FontWeight.w600)),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Software Developer',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
              spaceH25,
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 720),
                child: Text(
                  textAlign: TextAlign.center,
                  homeDescription,
                  style: GoogleFonts.poppins(
                      color: scheme.onBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              appBarOffsetContainer,
            ],
          ));
    });
  }
}
