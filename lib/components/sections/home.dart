import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globals.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return LayoutBuilder(builder: (context, constraints) {
      double titleFontSize = constraints.isTablet ? 72 : 55;
      return Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appBarOffsetContainer,
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 780),
                child: Text('Software Developer with a passion for design',
                    textAlign: TextAlign.center,
                    style: titleFont(scheme,
                        letterSpacing: -4, fontSize: titleFontSize)),
              ),
              spaceH25,
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  textAlign: TextAlign.center,
                  homeDescription,
                  style: GoogleFonts.poppins(
                      color: scheme.onBackground,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              appBarOffsetContainer,
            ],
          ));
    });
  }
}
