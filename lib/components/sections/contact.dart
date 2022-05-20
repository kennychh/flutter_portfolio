import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../parallax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

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
                    'Feel free to reach out anytime and stay connected. Whether you have a question, a job oppurtunity, or just want to chat, my inbox is always open!',
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
                  openDialog(context);
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
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      tooltip: 'LinkedIn',
                                      icon: SvgPicture.asset(
                                        'linkedin.svg',
                                        width: 20,
                                        height: 20,
                                        color: scheme.onSecondaryContainer,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      tooltip: 'GitHub',
                                      icon: SvgPicture.asset(
                                        'github.svg',
                                        width: 20,
                                        height: 20,
                                        color: scheme.onSecondaryContainer,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      tooltip: 'Instagram',
                                      icon: SvgPicture.asset(
                                        'instagram.svg',
                                        width: 20,
                                        height: 20,
                                        color: scheme.onSecondaryContainer,
                                      )),
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
