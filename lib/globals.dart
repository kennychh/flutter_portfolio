import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/color_schemes.dart';
import 'package:portfolio/dark_theme_preference.dart';
import 'package:portfolio/dark_theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import 'package:universal_html/html.dart' as html;

import 'components/parallax.dart';

const seed = Color(0xFF5F51A4);

// Color Schemes
var colors = ['Purple', 'Blue', 'Green', 'Orange', 'Pink'];
var selectedColor = 'Purple';
var selected = colors.indexOf(selectedColor);

TextStyle textFont(ColorScheme scheme,
        {FontWeight fontWeight = FontWeight.w400, double fontSize = 18}) =>
    TextStyle(
        fontFamily: 'Euclid',
        color: scheme.onBackground,
        fontSize: fontSize,
        fontWeight: fontWeight);

TextStyle titleFont(ColorScheme scheme,
        {FontWeight fontWeight = FontWeight.w600,
        double fontSize = 45,
        double letterSpacing = -1}) =>
    TextStyle(
        fontFamily: 'Euclid',
        letterSpacing: letterSpacing,
        color: scheme.onBackground,
        fontSize: fontSize,
        fontWeight: fontWeight);

TextStyle subtitleFont(ColorScheme scheme,
        {FontWeight fontWeight = FontWeight.w500,
        double fontSize = 30,
        double letterSpacing = -1}) =>
    TextStyle(
        fontFamily: 'Euclid',
        letterSpacing: letterSpacing,
        color: scheme.secondary,
        fontSize: fontSize,
        fontWeight: fontWeight);

double previousScrollPosition = 0;
double previousScrollPositionSave = 0;

Map<String, ColorScheme?> darkColorSchemes = {
  'Purple': purpleDarkColorScheme,
  'Blue': blueDarkColorScheme,
  'Green': greenDarkColorScheme,
  'Orange': orangeDarkColorScheme,
  'Pink': pinkDarkColorScheme
};

Map<String, ColorScheme?> lightColorSchemes = {
  'Purple': purpleLightColorScheme,
  'Blue': blueLightColorScheme,
  'Green': greenLightColorScheme,
  'Orange': orangeLightColorScheme,
  'Pink': pinkLightColorScheme
};

// Whitespace

const spaceH10 = SizedBox(
  height: 10,
);
const spaceH25 = SizedBox(
  height: 25,
);
const spaceH50 = SizedBox(
  height: 50,
);
const spaceH56 = SizedBox(
  height: 56,
);
const spaceH100 = SizedBox(
  height: 100,
);

const spaceH200 = SizedBox(
  height: 200,
);

var appBarOffsetContainer = Container(
  height: 100,
);
// Long Texts

const aboutDescription1 =
    'Hey there! My name is Kenny. I enjoy building and designing things, and bringing my ideas to life on digital devices. My interest in software development started back in highschool when I took my first Computer Science class. With an enjoyement in both technology and art, coding became the best of both worlds for expressing my creativity.';
const aboutDescription2 =
    'Currently I am in my final year at University of Toronto, majoring in both Cognitive Science and Psychology with a minor in Computer Science. Through their Co-op program, I\'ve had the amazing opportunity of working at HelloFresh for 16 months, where I was able to expand my experiences and interests in designing elegant code and user experience for people to use around the world.';
const aboutTechToolsDescription =
    'Throughout my journey as a Software Developer, I have acquired various skills that helped me build a multitude of digital experiences, using different programming languages, tools, etc. I am experienced in building mobile apps with React Native, and I am expanding my knowledge with Flutter to create apps for mobile and the web. Here are other notable technical skills that I am also proficient with:';
const homeDescription =
    'Hi there, I\'m Kenny! I specialize in implementing elegant and user-friendly digital experiences.';

const contactDescription =
    'Feel free to reach out anytime! Whether you have a question, a job opportunity, or just want to chat, my inbox is always open!';

const workExperienceItems = [
  ParallaxItem(
      title: 'HelloFresh',
      subtitle: 'Software Developer Co-op',
      imageUrl: './assets/hellofresh.jpg',
      time: 'May 2021 - August 2022',
      description: [
        'Implemented a variety of projects on mobile for HelloFresh\'s sub-brands using React Native.',
        'Involved in adding multi-language support, to facilitate global sub-brand integration.',
        'Developed and shipped front-end implementation of Multiple Payments, allowing users to add different credit cards or Paypal.',
        'Contributed extensively on the iOS widget design implementation using the WidgetKit framework and the widget API for SwiftUI.'
      ]),
];
const projectsItems = [
  ParallaxItem(
      title: 'Weather',
      subtitle: 'Personal Project',
      imageUrl: './assets/weather.png',
      url: 'https://github.com/kennychh/Weather',
      time: 'June 2020',
      description: [
        'Designed and implemented a beautiful weather app using Flutter.',
        'Integrated OpenWeatherMap API for real-time weather information.'
      ]),
  ParallaxItem(
      title: 'JavaScript Library',
      subtitle: 'School Project',
      imageUrl: './assets/weather_js.png',
      url: 'https://github.com/kennychh/js-library',
      time: 'Fall 2020',
      description: [
        'Designed and developed a JavaScript library that displays and builds weather information for websites. Constructed using JavaScript and jQuery.',
        'Uses DOM manipulation in the browser.'
      ]),
];

var gradientImage = const ParallaxItem(
  imageUrl: './assets/Purple_gradient_1.png',
);

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}

double navigationRailWidth = 75;
double navigationRailExtendedWidth = 75 + 181;

bool showAppBar = true;

// Helper Functions

double getPadding(BoxConstraints constraints) {
  if (constraints.isDesktop) {
    return 100;
  }
  if (constraints.isTablet) {
    return 50;
  }
  return 24;
}

bool isPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

bool isScreenWide(BuildContext context) {
  return MediaQuery.of(context).size.width >= 1350;
}

Widget descriptionList(BuildContext context, List<String> description) {
  ColorScheme scheme = Theme.of(context).colorScheme;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: description.map((str) {
      return Column(
        children: [
          Container(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\u2022',
                style: GoogleFonts.poppins(
                  color: scheme.onBackground,
                  fontSize: 16,
                  height: 1.55,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  str,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: GoogleFonts.poppins(
                      color: scheme.onBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          )
        ],
      );
    }).toList(),
  );
}

void openDialog(BuildContext context) {
  ColorScheme scheme = Theme.of(context).colorScheme;
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: scheme.surface,
      title: Text("Basic Dialog Title",
          style: GoogleFonts.poppins(color: scheme.onBackground)),
      content: Text(
          "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
          style: GoogleFonts.poppins(color: scheme.onBackground)),
      actions: <Widget>[
        TextButton(
          child: const Text('Dismiss'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('Action'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}

void launchUrlHelper(Uri url) async {
  if (!await launchUrl(url)) throw 'Could not launch $url';
}

Future<void> openFile(String path) async {
  html.window.open(path, "_blank");
  html.Url.revokeObjectUrl(path);
}

void mailToHelper() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'hoiyat0210@gmail.com',
  );
  if (!await launchUrl(emailLaunchUri)) {
    throw 'Could not launch $emailLaunchUri';
  }
}

void openColorPickerDialog(BuildContext context, Function setColor,
    Function setColorChoice, DarkThemeProvider themeProvider) {
  ColorScheme scheme = Theme.of(context).colorScheme;
  var radioListTileTheme = GoogleFonts.poppins(
      color: scheme.onSurfaceVariant, fontWeight: FontWeight.w500);
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: scheme.surface,
      contentPadding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
      title: Text("Change Color Palette",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: scheme.onBackground,
          )),
      content: Container(
        width: MediaQuery.of(context).size.width < 730 ? double.maxFinite : 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RadioListTile(
                        activeColor: scheme.onSurfaceVariant,
                        title: Text(
                          colors[index],
                          style: radioListTileTheme,
                        ),
                        value: index,
                        selected: selected == index,
                        groupValue: selected,
                        onChanged: (value) {
                          setColorChoice(index, colors[index]);
                        });
                  }),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          style: TextButton.styleFrom(
            textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('Ok'),
          style: TextButton.styleFrom(
            textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          onPressed: themeProvider.color == colors[themeProvider.selected]
              ? null
              : () {
                  setColor(selectedColor);
                  Navigator.of(context).pop();
                },
        ),
      ],
    ),
  );
}

TextButton resumeButton(BuildContext context) {
  ColorScheme scheme = Theme.of(context).colorScheme;
  return TextButton(
    style: TextButton.styleFrom(
      primary: scheme.onSecondaryContainer,
      backgroundColor: scheme.secondaryContainer,
      padding: const EdgeInsets.all(20.0),
      textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    onPressed: () {
      openFile("resume.pdf");
    },
    child: const Text('Resume'),
  );
}

PopupMenuButton themePopUpMenu(
    {required Function setColorChoice,
    required Function setColorScheme,
    required Function setColor,
    required Function scrollToIndex,
    required ColorScheme scheme,
    required BuildContext context,
    required DarkThemeProvider themeChangeProvider}) {
  TextStyle fontTheme = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: scheme.onBackground,
  );
  return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.zero,
      tooltip: 'More',
      color: scheme.surface,
      position: PopupMenuPosition.under,
      icon: Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.auto_awesome_outlined, color: scheme.onBackground),
      ),
      itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () {
                Future.delayed(
                  const Duration(seconds: 0),
                  () => openColorPickerDialog(
                      context, setColor, setColorChoice, themeChangeProvider),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.palette_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text('Change Color', style: fontTheme)
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              onTap: () {
                setColorScheme();
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      themeChangeProvider.darkTheme
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                      themeChangeProvider.darkTheme
                          ? 'Light Mode'
                          : 'Dark Mode',
                      style: fontTheme),
                ],
              ),
              value: 1,
            ),
          ]);
}

PopupMenuButton morePopUpMenu(
    {required Function setColorChoice,
    required Function setColorScheme,
    required Function setColor,
    required Function scrollToIndex,
    required ColorScheme scheme,
    required BuildContext context,
    required DarkThemeProvider themeChangeProvider}) {
  TextStyle fontTheme = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: scheme.onBackground,
  );
  return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      tooltip: 'More',
      color: scheme.surface,
      icon: Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.menu_outlined, color: scheme.onBackground),
      ),
      itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () {
                openFile("resume.pdf");
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.contact_page_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    'View Resume',
                    style: fontTheme,
                  )
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              onTap: () {
                Future.delayed(
                  const Duration(seconds: 0),
                  () => openColorPickerDialog(
                      context, setColor, setColorChoice, themeChangeProvider),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.palette_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text('Change Color', style: fontTheme)
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              onTap: () {
                setColorScheme();
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      themeChangeProvider.darkTheme
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                      themeChangeProvider.darkTheme
                          ? 'Light Mode'
                          : 'Dark Mode',
                      style: fontTheme),
                ],
              ),
              value: 1,
            ),
          ]);
}

PopupMenuButton fullPopUpMenu(
    {required Function setColorChoice,
    required Function setColorScheme,
    required Function setColor,
    required Function scrollToIndex,
    required ColorScheme scheme,
    required BuildContext context,
    required DarkThemeProvider themeChangeProvider}) {
  TextStyle fontTheme = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: scheme.onBackground,
  );
  return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      tooltip: 'Menu',
      color: scheme.surface,
      icon: Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.menu, color: scheme.onBackground),
      ),
      itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () {
                scrollToIndex(0);
              },
              child: Container(
                constraints: BoxConstraints(minWidth: 150),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.home_outlined,
                        color: scheme.onBackground,
                      ),
                    ),
                    Text('Home', style: fontTheme)
                  ],
                ),
              ),
              value: 1,
            ),
            PopupMenuItem(
              onTap: () {
                scrollToIndex(1);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.face_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    'About',
                    style: fontTheme,
                  )
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              onTap: () {
                scrollToIndex(2);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.work_outline,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    'Work',
                    style: fontTheme,
                  )
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              onTap: () {
                scrollToIndex(3);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.folder_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    'Projects',
                    style: fontTheme,
                  )
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              onTap: () {
                scrollToIndex(4);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.person_outline,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    'Contact',
                    style: fontTheme,
                  )
                ],
              ),
              value: 1,
            ),
            const PopupMenuDivider(),
            PopupMenuItem(
              onTap: () {
                openFile("resume.pdf");
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.contact_page_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    'View Resume',
                    style: fontTheme,
                  )
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              onTap: () {
                Future.delayed(
                  const Duration(seconds: 0),
                  () => openColorPickerDialog(
                      context, setColor, setColorChoice, themeChangeProvider),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.palette_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    'Change Color',
                    style: fontTheme,
                  )
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              onTap: () {
                setColorScheme();
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      themeChangeProvider.darkTheme
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    themeChangeProvider.darkTheme ? 'Light Mode' : 'Dark Mode',
                    style: fontTheme,
                  ),
                ],
              ),
              value: 1,
            ),
          ]);
}

extension FancyIterable on Iterable<int> {
  int get max => reduce(math.max);

  int get min => reduce(math.min);
}
