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
                      color: colorScheme.onSurface,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 25,
                ),
                Text(
                  'I\'m currently majoring in Cognitive Science and minoring in Computer Science at University of Toronto. I specialize in implementing elegant and user friendly mobile digital experiences.',
                  style: GoogleFonts.poppins(
                      color: colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
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
                  color: colorScheme.onSurface,
                  fontSize: 45,
                  fontWeight: FontWeight.w500),
            ),
          ),
          AdaptiveContainer(
            columnSpan: 12,
            child: Text(
              'Get to know about me',
              style: GoogleFonts.poppins(
                  color: colorScheme.secondary,
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
                                  color: colorScheme.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              height: 10,
                            ),
                            Text(
                              'Currently I am in my final year at University of Toronto, majoring in both Cognitive Science and Psychology with a minor in Computer Science. Through their Co-op program, I\'ve had the amazing oppurtunity of working at HelloFresh for 16 months, where I was able to expand my experiences and interests in designing elegant code and user experience for people to use around the world.',
                              style: GoogleFonts.poppins(
                                  color: colorScheme.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              height: 50,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: colorScheme.onSecondaryContainer,
                                backgroundColor: colorScheme.secondaryContainer,
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
                              child: Image.network(
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
              'Skills',
              style: GoogleFonts.poppins(
                  color: colorScheme.onSurface,
                  fontSize: 45,
                  fontWeight: FontWeight.w500),
            ),
          ),
          AdaptiveContainer(
            columnSpan: 12,
            child: Text(
              'Technical tools I\'ve been working with',
              style: GoogleFonts.poppins(
                  color: colorScheme.secondary,
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
                                color: colorScheme.onSurface,
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
                                color: colorScheme.onSurface,
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
                                color: colorScheme.onSurface,
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
