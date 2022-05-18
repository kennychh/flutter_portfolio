import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/cupertino.dart';
import 'parallax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);
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
      if (constraints.isMobile && isPortrait(context)) {
        return Container(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                appBarOffsetContainer,
                Container(
                  height: 25,
                ),
                Text(
                  'About Me',
                  style: GoogleFonts.poppins(
                      color: scheme.onSurface,
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  'Get to know about me',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 25,
                ),
                Text(
                  'Hey there! my name is Kenny and I enjoy building and designing things, and bring my ideas to life on digital devices. My interest in software development started back in highschool when I took my first Computer Science class. With an enjoyement in both technology and art, coding became the best of both worlds for expressing my creativity.',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  'Currently I am in my final year at University of Toronto, majoring in both Cognitive Science and Psychology with a minor in Computer Science. Through their Co-op program, I\'ve had the amazing oppurtunity of working at HelloFresh for 16 months, where I was able to expand my experiences and interests in designing elegant code and user experience for people to use around the world.',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  height: 50,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: scheme.onSecondaryContainer,
                    backgroundColor: scheme.secondaryContainer,
                    padding: const EdgeInsets.all(20.0),
                    textStyle: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {},
                  child: const Text('Resume'),
                ),
                Container(
                  height: 50,
                ),
                Text(
                  'Technical tools',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 25,
                ),
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
                              color: scheme.onSurface,
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
                Container(
                  height: 25,
                ),
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
                              color: scheme.onSurface,
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
                Container(
                  height: 25,
                ),
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
                              color: scheme.onSurface,
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
      return AdaptiveColumn(
        margin: 0,
        children: [
          appBarOffsetContainer,
          AdaptiveContainer(
            columnSpan: 12,
            height: 25,
          ),
          AdaptiveContainer(
            columnSpan: 12,
            child: Text(
              'About',
              style: GoogleFonts.poppins(
                  color: scheme.onSurface,
                  fontSize: 45,
                  fontWeight: FontWeight.w500),
            ),
          ),
          AdaptiveContainer(
            columnSpan: 12,
            child: Text(
              'Get to know about me',
              style: GoogleFonts.poppins(
                  color: scheme.secondary,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          ),
          AdaptiveContainer(
            columnSpan: 12,
            height: 25,
          ),
          AdaptiveContainer(
            columnSpan: 12,
            child: Row(
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
                              'Hey there! my name is Kenny and I enjoy building and designing things, and bring my ideas to life on digital devices. My interest in software development started back in highschool when I took my first Computer Science class. With an enjoyement in both technology and art, coding became the best of both worlds for expressing my creativity.',
                              style: GoogleFonts.poppins(
                                  color: scheme.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              height: 10,
                            ),
                            Text(
                              'Currently I am in my final year at University of Toronto, majoring in both Cognitive Science and Psychology with a minor in Computer Science. Through their Co-op program, I\'ve had the amazing oppurtunity of working at HelloFresh for 16 months, where I was able to expand my experiences and interests in designing elegant code and user experience for people to use around the world.',
                              style: GoogleFonts.poppins(
                                  color: scheme.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              height: 50,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: scheme.onSecondaryContainer,
                                backgroundColor: scheme.secondaryContainer,
                                padding: const EdgeInsets.all(20.0),
                                textStyle: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              onPressed: () {},
                              child: const Text('Resume'),
                            ),
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
                              child: Image.asset(
                                gradientImage.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ))),
              ],
            ),
          ),
          AdaptiveContainer(
            columnSpan: 12,
            height: 100,
          ),
          AdaptiveContainer(
            columnSpan: 12,
            child: Text(
              'Technical tools I\'ve been working with',
              style: GoogleFonts.poppins(
                  color: scheme.secondary,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          ),
          AdaptiveContainer(
            columnSpan: 12,
            height: 25,
          ),
          AdaptiveContainer(
            columnSpan: 12,
            child: Flexible(
                child: Align(
              alignment: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  'Throughout my journey as a Software Developer, I have acquired various skills that helped me build a multitude digital experiences, using different programming languages, tools, etc. I am most experienced in building mobile apps with React Native, and expanding my knowledge with Flutter. Here are other notable technical skills that I am also proficient with:',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )),
          ),
          AdaptiveContainer(
            columnSpan: 12,
            height: 25,
          ),
          AdaptiveContainer(
            columnSpan: 12,
            child: Row(
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
                                color: scheme.onSurface,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 10,
                          ),
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
                                color: scheme.onSurface,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 10,
                          ),
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
                                color: scheme.onSurface,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 10,
                          ),
                          descriptionList(context, ideList)
                        ]),
                  ),
                ]),
          ),
        ],
      );
    }));
  }
}
