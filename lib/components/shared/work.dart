import 'package:flutter/cupertino.dart';
import '../../components/parallax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class Work extends StatelessWidget {
  const Work({Key? key}) : super(key: key);

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
              'Work Experience',
              style: GoogleFonts.poppins(
                  color: colorScheme.onSurface,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
            Container(height: 25),
            for (final item in workExperienceItems)
              ListItem(
                imageUrl: item.imageUrl,
                name: item.title,
                subtitle: item.subtitle,
                description: item.description,
              ),
            Container(height: 75),
            Text(
              'Projects',
              style: GoogleFonts.poppins(
                  color: colorScheme.onSurface,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
            Container(height: 25),
            for (final item in projectsItems)
              ListItem(
                imageUrl: item.imageUrl,
                name: item.title,
                subtitle: item.subtitle,
                description: item.description,
              ),
            Container(height: 100),
          ],
        ));
  }
}
