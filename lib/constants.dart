import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/color_schemes.dart';

import 'components/parallax.dart';

var appBarOffsetContainer = AdaptiveContainer(
  columnSpan: 12,
  height: AppBar().preferredSize.height,
);

const seed = Color(0xFF5F51A4);

var color = 'purple';
var colors = ['purple', 'blue', 'green', 'orange', 'pink'];
var selectedColor = color;
var selected = colors.indexOf(color);

Map<String, ColorScheme?> darkColorSchemes = {
  'purple': purpleColorScheme['dark'],
  'blue': blueColorScheme['dark'],
  'green': greenDarkColorScheme,
  'orange': orangeDarkColorScheme,
  'pink': pinkDarkColorScheme
};

Map<String, ColorScheme?> lightColorSchemes = {
  'purple': purpleColorScheme['light'],
  'blue': blueColorScheme['light'],
  'green': greenLightColorScheme,
  'orange': orangeLightColorScheme,
  'pink': pinkLightColorScheme
};

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

void openColorPickerDialog(
    BuildContext context, Function setColor, Function setColorChoice) {
  ColorScheme scheme = Theme.of(context).colorScheme;
  var isDark = Theme.of(context).brightness == Brightness.dark;
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: scheme.surface,
      contentPadding: EdgeInsets.fromLTRB(0, 24, 0, 24),
      title: Text("Change Color",
          style: TextStyle(
            color: scheme.onBackground,
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 0, minWidth: 400),
          )),
          RadioListTile(
              activeColor: scheme.onSurfaceVariant,
              value: 0,
              selected: selected == 0,
              groupValue: selected,
              onChanged: (value) {
                setColorChoice(0, 'purple');
              },
              title: Text(
                'Purple',
                style: TextStyle(color: scheme.onSurfaceVariant),
              )),
          RadioListTile(
              activeColor: scheme.onSurfaceVariant,
              value: 1,
              selected: selected == 1,
              groupValue: selected,
              onChanged: (value) {
                setColorChoice(1, 'blue');
              },
              title: Text(
                'Blue',
                style: TextStyle(color: scheme.onSurfaceVariant),
              )),
          RadioListTile(
              activeColor: scheme.onSurfaceVariant,
              value: 2,
              selected: selected == 2,
              groupValue: selected,
              onChanged: (value) {
                setColorChoice(2, 'green');
              },
              title: Text(
                'Green',
                style: TextStyle(color: scheme.onSurfaceVariant),
              )),
          RadioListTile(
              activeColor: scheme.onSurfaceVariant,
              value: 3,
              selected: selected == 3,
              groupValue: selected,
              onChanged: (value) {
                setColorChoice(3, 'orange');
              },
              title: Text(
                'Orange',
                style: TextStyle(color: scheme.onSurfaceVariant),
              )),
          RadioListTile(
              activeColor: scheme.onSurfaceVariant,
              value: 4,
              selected: selected == 4,
              groupValue: selected,
              onChanged: (value) {
                setColorChoice(4, 'pink');
              },
              title: Text(
                'Pink',
                style: TextStyle(color: scheme.onSurfaceVariant),
              )),
        ],
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
          onPressed: selectedColor == color
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

PopupMenuButton<int> openMenu(
    {required BuildContext context,
    required Function setColorChoice,
    required Function setColorScheme,
    required Function setColor}) {
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
              onTap: () {
                Future.delayed(
                  const Duration(seconds: 0),
                  () =>
                      openColorPickerDialog(context, setColor, setColorChoice),
                );
              },
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
                    'Change Color',
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
                      scheme == darkColorSchemes[color]
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: scheme.onBackground,
                    ),
                  ),
                  Text(
                    scheme == darkColorSchemes[color]
                        ? 'Light Mode'
                        : 'Dark Mode',
                    style: TextStyle(color: scheme.onBackground, fontSize: 14),
                  )
                ],
              ),
              value: 1,
            ),
          ]);
}
