import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globals.dart';
import 'dart:math';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    final minHeightList = [
      MediaQuery.of(context).size.height.toDouble(),
      1080.0
    ];
    var minHeight = minHeightList.reduce(min);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isMobile && isPortrait(context)) {
        return Container(
            constraints: const BoxConstraints(minHeight: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBarOffsetContainer,
                Text('Hi, I\'m Kenny!',
                    style: GoogleFonts.poppins(
                        color: scheme.primary,
                        fontSize: 40,
                        fontWeight: FontWeight.w500)),
                spaceH10,
                Text(
                  'Software Developer',
                  style: GoogleFonts.poppins(
                      color: scheme.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                spaceH25,
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 550),
                  child: Text(
                    homeDescription,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        color: scheme.onBackground,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ));
      }
      return Container(
          constraints: BoxConstraints(minHeight: minHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appBarOffsetContainer,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('Hi, I\'m Kenny!',
                              style: GoogleFonts.poppins(
                                  color: scheme.primary,
                                  fontSize: 88,
                                  fontWeight: FontWeight.w500)),
                        ),
                        spaceH25,
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Software Developer',
                            style: GoogleFonts.poppins(
                                color: scheme.secondary,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        spaceH25,
                        Text(
                          homeDescription,
                          style: GoogleFonts.poppins(
                              color: scheme.onBackground,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 3,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          gradientImage.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              appBarOffsetContainer,
            ],
          ));
    });
  }
}
