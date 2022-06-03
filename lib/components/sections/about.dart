import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/aboutAssets.dart';
import 'package:portfolio/components/glassMorphism.dart';
import '../../globals.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    List<String> languageList = [
      'Javascript',
      'HTML/CSS',
      'Dart',
      'Python',
      'Swift'
    ];
    List<String> devToolList = [
      'React Native',
      'Flutter',
      'GitHub',
      'Git',
      'Slack'
    ];
    List<String> ideList = ['Visual Studio Code', 'Xcode', 'Android Studio'];
    return LayoutBuilder(builder: ((context, constraints) {
      bool shouldShrinkAssets = constraints.isTablet;
      bool showSeperatedAssets = MediaQuery.of(context).size.width < 1050;
      if (constraints.isMobile && isPortrait(context)) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarOffsetContainer,
            spaceH25,
            Text(
              'About',
              style: TextStyle(
                  fontFamily: 'Euclid',
                  letterSpacing: -1,
                  color: scheme.onBackground,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
            spaceH10,
            Text(
              'Get to know about me',
              style: GoogleFonts.poppins(
                  color: scheme.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            spaceH25,
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Container(
                  decoration: BoxDecoration(color: scheme.surface),
                  child: Image.asset(
                    './assets/memoji_1.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            spaceH25,
            Text(
              aboutDescription1,
              style: GoogleFonts.poppins(
                  color: scheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            spaceH10,
            Text(
              aboutDescription2,
              style: GoogleFonts.poppins(
                  color: scheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            spaceH50,
            Text(
              'Technical tools',
              style: GoogleFonts.poppins(
                  color: scheme.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            spaceH25,
            Align(
              alignment: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  aboutTechToolsDescription,
                  style: GoogleFonts.poppins(
                      color: scheme.onBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            spaceH25,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Languages',
                      style: GoogleFonts.poppins(
                          color: scheme.onBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: descriptionList(context, languageList),
                  ),
                ),
              ],
            ),
            spaceH25,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Dev Tools',
                      style: GoogleFonts.poppins(
                          color: scheme.onBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: descriptionList(context, devToolList),
                  ),
                ),
              ],
            ),
            spaceH25,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'IDEs',
                      style: GoogleFonts.poppins(
                          color: scheme.onBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: descriptionList(context, ideList),
                  ),
                ),
              ],
            )
          ],
        );
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          appBarOffsetContainer,
          spaceH25,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(
                              fontFamily: 'Euclid',
                              letterSpacing: -1,
                              color: scheme.onBackground,
                              fontSize: 45,
                              fontWeight: FontWeight.w600),
                        ),
                        spaceH10,
                        Text(
                          'Get to know about me',
                          style: GoogleFonts.poppins(
                              color: scheme.secondary,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        spaceH25,
                        showSeperatedAssets
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: ConstrainedBox(
                                          constraints:
                                              BoxConstraints(maxWidth: 760),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                aboutDescription1,
                                                style: GoogleFonts.poppins(
                                                    color: scheme.onBackground,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Container(
                                                height: 10,
                                              ),
                                              Text(
                                                aboutDescription2,
                                                style: GoogleFonts.poppins(
                                                    color: scheme.onBackground,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Container(
                                                height: 50,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  Container(
                                    width: 50,
                                  ),
                                  ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxHeight: 225),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(32),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: scheme.surface),
                                          child: Image.asset(
                                            './assets/memoji_1.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Align(
                                alignment: Alignment.topLeft,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 760),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        aboutDescription1,
                                        style: GoogleFonts.poppins(
                                            color: scheme.onBackground,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        height: 10,
                                      ),
                                      Text(
                                        aboutDescription2,
                                        style: GoogleFonts.poppins(
                                            color: scheme.onBackground,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                )),
                        spaceH50,
                        Text(
                          'Technical tools I\'ve been working with',
                          style: GoogleFonts.poppins(
                              color: scheme.secondary,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        spaceH25,
                        showSeperatedAssets
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: ConstrainedBox(
                                        constraints:
                                            const BoxConstraints(maxWidth: 760),
                                        child: Text(
                                          aboutTechToolsDescription,
                                          style: GoogleFonts.poppins(
                                              color: scheme.onBackground,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                  ),
                                  ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxHeight: 225),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(32),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: scheme.surface),
                                          child: Image.asset(
                                            './assets/memoji_2.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Align(
                                alignment: Alignment.topLeft,
                                child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 760),
                                  child: Text(
                                    aboutTechToolsDescription,
                                    style: GoogleFonts.poppins(
                                        color: scheme.onBackground,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                        spaceH25,
                        Container(
                          constraints: BoxConstraints(maxWidth: 880),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Languages',
                                          style: GoogleFonts.poppins(
                                              color: scheme.onBackground,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        spaceH10,
                                        descriptionList(context, languageList)
                                      ]),
                                ),
                                Flexible(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dev Tools',
                                          style: GoogleFonts.poppins(
                                              color: scheme.onBackground,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        spaceH10,
                                        descriptionList(context, devToolList)
                                      ]),
                                ),
                                Flexible(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'IDEs',
                                          style: GoogleFonts.poppins(
                                              color: scheme.onBackground,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        spaceH10,
                                        descriptionList(context, ideList)
                                      ]),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  )),
              showSeperatedAssets
                  ? Container()
                  : Container(
                      width: 50,
                    ),
              showSeperatedAssets
                  ? Container()
                  : AboutAssets(shouldShrinkAssets: shouldShrinkAssets)
            ],
          )
        ],
      );
    }));
  }
}
