// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globals.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          constraints: const BoxConstraints(maxHeight: 650),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('Thanks for stopping by!',
                      style: GoogleFonts.poppins(
                          color: scheme.primary,
                          fontSize: 45,
                          fontWeight: FontWeight.w500))),
              spaceH25,
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(contactDescription,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: scheme.onBackground, fontSize: 16)),
              ),
              spaceH25,
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 760),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ConstrainedBox(
                                        constraints:
                                            const BoxConstraints(maxWidth: 110),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            primary: scheme.secondary,
                                            textStyle: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          onPressed: () {
                                            html.window.open(
                                                'https://www.linkedin.com/in/kenny-chan-2ab991195',
                                                'new tab');
                                          },
                                          child: const Text('LinkedIn'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ConstrainedBox(
                                        constraints:
                                            const BoxConstraints(maxWidth: 110),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            primary: scheme.secondary,
                                            textStyle: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          onPressed: () {
                                            html.window.open(
                                                'https://github.com/kennychh',
                                                'new tab');
                                          },
                                          child: const Text('GitHub'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ConstrainedBox(
                                        constraints:
                                            const BoxConstraints(maxWidth: 110),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            primary: scheme.secondary,
                                            textStyle: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          onPressed: () {
                                            html.window.open(
                                                'https://www.instagram.com/_kennychan_/',
                                                'new tab');
                                          },
                                          child: const Text('Instagram'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceH25,
                          Text('Designed and built by Kenny Chan',
                              style: GoogleFonts.poppins(
                                color: scheme.secondary,
                                fontSize: 12,
                              )),
                          constraints.isMobile ? spaceH100 : spaceH10,
                        ]),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
