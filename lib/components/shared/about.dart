import 'package:flutter/cupertino.dart';
import 'parallax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(
          children: [
            appBarOffsetContainer,
            Container(
              height: 25,
            ),
            Text(
              'About Me',
              style: GoogleFonts.poppins(
                  color: colorScheme.onSurface,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ));
  }
}
