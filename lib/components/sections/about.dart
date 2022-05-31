import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globals.dart';
import 'dart:math';

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
    final minHeightList = [
      MediaQuery.of(context).size.height.toDouble(),
      1080.0
    ];
    var minHeight = minHeightList.reduce(min);
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.isMobile && isPortrait(context)) {
        return Container(
            constraints: BoxConstraints(minHeight: 600),
            child: Column(
              children: [
                appBarOffsetContainer,
                spaceH25,
                Text(
                  'About Me',
                  style: GoogleFonts.poppins(
                      color: scheme.onBackground,
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                ),
                spaceH10,
                Text(
                  'Get to know about me',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
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
                resumeButton(context),
                spaceH50,
                Text(
                  'Technical tools',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 22,
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
                              color: scheme.secondary,
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
                              color: scheme.secondary,
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
                              color: scheme.secondary,
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
            ));
      }
      return Container(
        constraints: BoxConstraints(minHeight: minHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarOffsetContainer,
            spaceH25,
            Text(
              'About',
              style: GoogleFonts.poppins(
                  color: scheme.onBackground,
                  fontSize: 45,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Get to know about me',
              style: GoogleFonts.poppins(
                  color: scheme.secondary,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            spaceH25,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            resumeButton(context)
                          ],
                        ))),
                Container(
                  width: 100,
                ),
                Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.topRight,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 350),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Container(
                                decoration:
                                    BoxDecoration(color: scheme.surface),
                                child: Image.asset(
                                  './assets/memoji.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ))),
              ],
            ),
            spaceH50,
            Text(
              'Technical tools I\'ve been working with',
              style: GoogleFonts.poppins(
                  color: scheme.secondary,
                  fontSize: 30,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Languages',
                            style: GoogleFonts.poppins(
                                color: scheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          spaceH10,
                          descriptionList(context, languageList)
                        ]),
                  ),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dev Tools',
                            style: GoogleFonts.poppins(
                                color: scheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          spaceH10,
                          descriptionList(context, devToolList)
                        ]),
                  ),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IDEs',
                            style: GoogleFonts.poppins(
                                color: scheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          spaceH10,
                          descriptionList(context, ideList)
                        ]),
                  ),
                ]),
            spaceH200,
          ],
        ),
      );
    }));
  }
}
