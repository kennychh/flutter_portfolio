import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../parallax.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globals.dart';

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('Thanks for stopping by!',
                    style: GoogleFonts.poppins(
                        color: scheme.primary,
                        fontSize: 60,
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                height: 25,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 760),
                child: Text(
                    'Feel free to reach out anytime! Whether you have a question, a job oppurtunity, or just want to chat, my inbox is always open!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: scheme.onBackground, fontSize: 16)),
              ),
              Container(
                height: 25,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: scheme.onSecondaryContainer,
                  backgroundColor: scheme.secondaryContainer,
                  padding: const EdgeInsets.all(20.0),
                  textStyle: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  mailToHelper();
                },
                child: const Text('Get In Touch'),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 760),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 110),
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
                                            BoxConstraints(maxWidth: 110),
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
                                            BoxConstraints(maxWidth: 110),
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
                          Container(
                            height: 25,
                          ),
                          Text('Designed and built by Kenny Chan',
                              style: GoogleFonts.poppins(
                                color: scheme.secondary,
                                fontSize: 12,
                              )),
                          if (constraints.isMobile)
                            Container(
                              height: 100,
                            ),
                        ]),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
