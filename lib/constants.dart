import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/parallax.dart';

var appBarOffsetContainer = AdaptiveContainer(
  columnSpan: 12,
  height: AppBar().preferredSize.height,
);

const seed = Color(0xFF5F51A4);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF6052A6),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE7DEFF),
  onPrimaryContainer: Color(0xFF1C0161),
  secondary: Color(0xFF605C71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE6DFF9),
  onSecondaryContainer: Color(0xFF1C192B),
  tertiary: Color(0xFF7C5264),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD9E8),
  onTertiaryContainer: Color(0xFF301120),
  error: Color(0xFFBA1B1B),
  errorContainer: Color(0xFFFFDAD4),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410001),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1C1B1E),
  surface: Color(0xFFF3EDF7),
  onSurface: Color(0xFF49454f),
  surfaceVariant: Color(0xFFE5E0EB),
  onSurfaceVariant: Color(0xFF48454F),
  outline: Color(0xFF79767F),
  onInverseSurface: Color(0xFFF4EFF4),
  inverseSurface: Color(0xFF313033),
  inversePrimary: Color(0xFFCBBEFF),
  shadow: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFCBBEFF),
  onPrimary: Color(0xFF312075),
  primaryContainer: Color(0xFF48398D),
  onPrimaryContainer: Color(0xFFE7DEFF),
  secondary: Color(0xFFC9C3DC),
  onSecondary: Color(0xFF312E41),
  secondaryContainer: Color(0xFF484459),
  onSecondaryContainer: Color(0xFFE6DFF9),
  tertiary: Color(0xFFEDB8CC),
  onTertiary: Color(0xFF482535),
  tertiaryContainer: Color(0xFF623B4C),
  onTertiaryContainer: Color(0xFFFFD9E8),
  error: Color(0xFFFFB4A9),
  errorContainer: Color(0xFF930006),
  onError: Color(0xFF680003),
  onErrorContainer: Color(0xFFFFDAD4),
  background: Color(0xFF1C1B1E),
  onBackground: Color(0xFFE5E1E5),
  surface: Color(0xFF2a2831),
  onSurface: Color(0xFFcac4d0),
  surfaceVariant: Color(0xFF48454F),
  onSurfaceVariant: Color(0xFFC9C4D0),
  outline: Color(0xFF938F99),
  onInverseSurface: Color(0xFF1C1B1E),
  inverseSurface: Color(0xFFE5E1E5),
  inversePrimary: Color(0xFF6052A6),
  shadow: Color(0xFF000000),
);

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
        'Contributed extensively on the iOS widget implementation using the WidgetKit framework and the widget API for SwiftUI.'
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
        'Designed and implemented a beautiful weather app with Weather API integration.'
      ]),
  ParallaxItem(
      title: 'JavaScript Library',
      subtitle: 'School Project',
      imageUrl: './assets/weather_js.png',
      url: 'https://github.com/kennychh/js-library',
      time: 'Fall 2020',
      description: [
        'Designed and developed a JavaScript library that displays and builds weather information for websites. Constructed using JavaScript and jQuery',
        'Uses DOM manipulation in the browser'
      ]),
];

const gradientImage = ParallaxItem(
  imageUrl: './assets/gradient.jpg',
);

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}

double navigationRailWidth = 75;
double navigationRailExtendedWidth = 75 + 181;

bool showAppBar = false;

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
                style: TextStyle(
                  color: scheme.onBackground,
                  fontSize: 16,
                  height: 1.55,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
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
          style: TextStyle(color: scheme.onBackground)),
      content: Text(
          "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
          style: TextStyle(color: scheme.onBackground)),
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

PopupMenuButton<int> openMenu(
    {required BuildContext context, required Function setColorScheme}) {
  ColorScheme scheme = Theme.of(context).colorScheme;
  return PopupMenuButton(
      tooltip: 'More',
      color: scheme.surface,
      elevation: 2,
      icon: Icon(Icons.more_horiz_outlined, color: scheme.onSecondaryContainer),
      itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.contact_page_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    'View Resume',
                    style: GoogleFonts.poppins(
                      color: scheme.onBackground,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.palette_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    'Change Colors',
                    style: TextStyle(color: scheme.onBackground, fontSize: 14),
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
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      scheme == darkColorScheme
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    scheme == darkColorScheme ? 'Light Mode' : 'Dark Mode',
                    style:
                        TextStyle(color: scheme.onSurfaceVariant, fontSize: 14),
                  )
                ],
              ),
              value: 1,
            ),
          ]);
}
