// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/glassMorphism.dart';
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              GlassMorphism(
                constraints: BoxConstraints(minHeight: showSections ? 70 : 80),
                blur: 20,
                opacity: 0,
                child: Container(),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: 1350 + getPadding(constraints) * 2),
                padding:
                    EdgeInsets.symmetric(horizontal: getPadding(constraints)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'KC',
                          style: TextStyle(
                            fontFamily: 'Rany',
                            fontWeight: FontWeight.w500,
                            color: scheme.onBackground,
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
                                padding: EdgeInsets.only(left: 12),
                                child: IconButton(
                                  tooltip: 'Resume',
                                  icon: Icon(
                                    Icons.contact_page_outlined,
                                    color: scheme.onBackground,
                                  ),
                                  onPressed: () {
                                    openFile("resume.pdf");
                                  },
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 20),
                                      backgroundColor: scheme.tertiaryContainer,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)))),
                                  onPressed: () {
                                    mailToHelper();
                                  },
                                  child: Text(
                                    'Let\'s Chat',
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
              )
            ],
          ));
    });
  }
}
