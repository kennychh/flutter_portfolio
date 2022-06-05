import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globals.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    bool hideEmailTextField = MediaQuery.of(context).size.width < 1050;

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
              hideEmailTextField ? Container() : spaceH50,
              hideEmailTextField
                  ? Container()
                  : Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 600),
                          decoration: BoxDecoration(
                            color: scheme.surface,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: TextField(
                            autocorrect: false,
                            cursorColor: scheme.onBackground,
                            style: GoogleFonts.poppins(
                                color: scheme.onBackground,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your email',
                              contentPadding:
                                  EdgeInsets.fromLTRB(32, 32, 197, 32),
                              labelStyle: GoogleFonts.poppins(
                                  color: scheme.onBackground.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              hintStyle: GoogleFonts.poppins(
                                  color: scheme.onBackground.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 20),
                                backgroundColor: scheme.tertiaryContainer,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)))),
                            onPressed: () {
                              mailToHelper();
                            },
                            child: Text(
                              'Get In Touch',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: scheme.onTertiaryContainer,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
              appBarOffsetContainer,
            ],
          ));
    });
  }
}
