// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.scrollToIndex,
    required this.showMenu,
    required this.menu,
    this.moreMenu,
  }) : super(key: key);

  final Function scrollToIndex;
  final Theme menu;
  final Widget? moreMenu;
  final bool showMenu;

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    TextStyle fontTheme = GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: scheme.onBackground,
      fontSize: 16,
    );
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: BoxConstraints(maxWidth: 1350),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kenny Chan',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: scheme.onBackground,
                fontSize: showMenu ? 20 : 23,
              ),
            ),
            showMenu
                ? menu
                : Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24),
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
                        padding: EdgeInsets.only(left: 24),
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
                        padding: EdgeInsets.only(left: 24),
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
                        padding: EdgeInsets.only(left: 24),
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
                        padding: EdgeInsets.only(left: 24),
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
                      Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: TextButton(
                          child: Text(
                            'Resume',
                            style: fontTheme,
                          ),
                          onPressed: () {
                            openFile("resume.pdf");
                          },
                        ),
                      ),
                      Container(child: moreMenu),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
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
  }
}
