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
        return Container(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                appBarOffsetContainer,
                spaceH25,
                Text(
                  'Projects',
                  style: GoogleFonts.poppins(
                      color: scheme.onBackground,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
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
            ));
      }
      return Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarOffsetContainer,
              spaceH25,
              Text(
                'Projects',
                style: GoogleFonts.poppins(
                    color: scheme.onBackground,
                    fontSize: 45,
                    fontWeight: FontWeight.w500),
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
          ));
    }));
  }
}
