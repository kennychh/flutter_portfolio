import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'components/shared/parallax.dart';

var appBarOffsetContainer = Container(
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
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1C1B1E),
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
  surface: Color(0xFF1C1B1E),
  onSurface: Color(0xFFE5E1E5),
  surfaceVariant: Color(0xFF48454F),
  onSurfaceVariant: Color(0xFFC9C4D0),
  outline: Color(0xFF938F99),
  onInverseSurface: Color(0xFF1C1B1E),
  inverseSurface: Color(0xFFE5E1E5),
  inversePrimary: Color(0xFF6052A6),
  shadow: Color(0xFF000000),
);

var brightness = SchedulerBinding.instance!.window.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;
var colorScheme = isDarkMode ? darkColorScheme : lightColorScheme;

const workExperienceItems = [
  ParallaxItem(
      title: 'HelloFresh',
      subtitle: 'Software Developer Co-op',
      imageUrl: '/assets/hellofresh.jpg',
      time: 'May 2021 - August 2022',
      description: [
        'Implemented a variety of projects on mobile for HelloFresh\'s sub-brands using React Native.',
        'Involved in adding multi-language support, to facilitate global sub-brand integration.',
        'Developed and shipped front-end implementation of Multiple Payments, allowing users to add their credit cards or Paypal.',
        'Contributed extensively on the iOS widget implementation using the WidgetKit framework and the widget API for SwiftUI.'
      ]),
];
const projectsItems = [
  ParallaxItem(
      title: 'Weather',
      subtitle: 'Personal Project',
      imageUrl: '/assets/weather.png',
      description: [
        'Designed and implemented a beautiful weather app with Weather API integration.'
      ]),
];

const gradientImage = ParallaxItem(
  imageUrl: '/assets/gradient.jpg',
);
