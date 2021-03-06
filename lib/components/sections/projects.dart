import '../parallax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globals.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.isMobile && isPortrait(context)) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarOffsetContainer,
            spaceH25,
            Text(
              'Projects',
              style: TextStyle(
                  fontFamily: 'Euclid',
                  letterSpacing: -1,
                  color: scheme.onBackground,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
            spaceH25,
            for (final item in projectsItems)
              ListItem(
                imageUrl: item.imageUrl,
                name: item.title,
                subtitle: item.subtitle,
                time: item.time,
                description: item.description,
                showGithubIcon: true,
                url: item.url,
              ),
          ],
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBarOffsetContainer,
          spaceH25,
          Text(
            'Projects',
            style: TextStyle(
                fontFamily: 'Euclid',
                letterSpacing: -1,
                color: scheme.onBackground,
                fontSize: 45,
                fontWeight: FontWeight.w600),
          ),
          spaceH50,
          for (final item in projectsItems)
            ListItem(
              imageUrl: item.imageUrl,
              name: item.title,
              subtitle: item.subtitle,
              time: item.time,
              description: item.description,
              showGithubIcon: true,
              url: item.url,
            ),
        ],
      );
    }));
  }
}
