// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:portfolio/dark_theme_preference.dart';
import 'package:portfolio/dark_theme_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../globals.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    Key? key,
    required this.itemScrollController,
    required this.setColor,
    required this.setColorChoice,
    required this.setColorScheme,
    required this.themeChangeProvider,
  }) : super(key: key);

  final ItemScrollController itemScrollController;
  final Function setColor;
  final Function setColorChoice;
  final Function setColorScheme;
  final DarkThemeProvider themeChangeProvider;

  void scrollToIndex(int index) {
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
          index: index,
          duration: const Duration(seconds: 1),
          curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: scheme.surface,
      child: Column(children: [
        appBarOffsetContainer,
        ListTile(
          leading: Icon(Icons.home_outlined, color: scheme.onBackground),
          title: Text(
            'Home',
            style: TextStyle(
                color: scheme.onBackground, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            scrollToIndex(0);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.face_outlined, color: scheme.onBackground),
          title: Text(
            'About',
            style: TextStyle(
                color: scheme.onBackground, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            scrollToIndex(1);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.work_outline, color: scheme.onBackground),
          title: Text(
            'Work',
            style: TextStyle(
                color: scheme.onBackground, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            scrollToIndex(2);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.folder_outlined, color: scheme.onBackground),
          title: Text(
            'Projects',
            style: TextStyle(
                color: scheme.onBackground, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            scrollToIndex(3);
            Navigator.pop(context);
          },
        ),
        ListTile(
            leading: Icon(Icons.person_outline, color: scheme.onBackground),
            title: Text(
              'Contact',
              style: TextStyle(
                  color: scheme.onBackground, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              scrollToIndex(4);
              Navigator.pop(context);
            }),
        Expanded(
          child: Container(),
        ),
        ListTile(
            leading:
                Icon(Icons.contact_page_outlined, color: scheme.onBackground),
            title: Text(
              'View Resume',
              style: TextStyle(
                  color: scheme.onBackground, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              openFile("resume.pdf");
              Navigator.pop(context);
            }),
        ListTile(
            leading: Icon(Icons.palette_outlined, color: scheme.onBackground),
            title: Text(
              'Change Color',
              style: TextStyle(
                  color: scheme.onBackground, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              Future.delayed(
                const Duration(seconds: 0),
                () => openColorPickerDialog(
                    context, setColor, setColorChoice, themeChangeProvider),
              );
              Navigator.pop(context);
            }),
        ListTile(
            leading: Icon(
                themeChangeProvider.darkTheme
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                color: scheme.onBackground),
            title: Text(
              themeChangeProvider.darkTheme ? 'Light Mode' : 'Dark Mode',
              style: TextStyle(
                  color: scheme.onBackground, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              setColorScheme();
              Navigator.pop(context);
            }),
      ]),
    );
  }
}
