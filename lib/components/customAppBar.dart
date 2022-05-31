// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.scrollToIndex,
    required this.showMenu,
    required this.showSections,
    required this.menu,
    required this.themePopUpMenu,
    required this.moreMenu,
  }) : super(key: key);

  final Function scrollToIndex;
  final Widget menu;
  final bool showSections;
  final Widget themePopUpMenu;
  final Widget moreMenu;
  final bool showMenu;

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    TextStyle fontTheme = GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: scheme.onBackground,
      fontSize: 16,
    );
    return LayoutBuilder(builder: (context, constraints) {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: getPadding(constraints)),
          constraints:
              BoxConstraints(maxWidth: 1350 + getPadding(constraints) * 2),
          height: showSections ? 70 : 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Kenny Chan',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: scheme.primary,
                      fontSize: showSections ? 20 : 23,
                    ),
                  ),
                  showSections
                      ? Container()
                      : Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 28),
                              child: TextButton(
                                child: Text(
                                  'Home',
                                  style: fontTheme,
                                ),
                                onPressed: () {
                                  scrollToIndex(0);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: TextButton(
                                child: Text(
                                  'About',
                                  style: fontTheme,
                                ),
                                onPressed: () {
                                  scrollToIndex(1);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: TextButton(
                                child: Text(
                                  'Work',
                                  style: fontTheme,
                                ),
                                onPressed: () {
                                  scrollToIndex(2);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: TextButton(
                                child: Text(
                                  'Projects',
                                  style: fontTheme,
                                ),
                                onPressed: () {
                                  scrollToIndex(3);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: TextButton(
                                child: Text(
                                  'Contact',
                                  style: fontTheme,
                                ),
                                onPressed: () {
                                  scrollToIndex(4);
                                },
                              ),
                            ),
                          ],
                        )
                ],
              ),
              showMenu
                  ? showSections
                      ? menu
                      : moreMenu
                  : Row(
                      children: [
                        Container(child: themePopUpMenu),
                        Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: TextButton(
                            child: Text(
                              'Resume',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: scheme.onSecondaryContainer,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              openFile("resume.pdf");
                            },
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 20),
                                backgroundColor: scheme.surface,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: scheme.secondaryContainer,
                                        width: 2),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0)))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 20),
                                backgroundColor: scheme.tertiaryContainer,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0)))),
                            onPressed: () {
                              mailToHelper();
                            },
                            child: Text(
                              'Contact Me',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: scheme.onTertiaryContainer,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
            ],
          ),
          width: MediaQuery.of(context).size.width,
          color: scheme.background,
        ),
      );
    });
  }
}
