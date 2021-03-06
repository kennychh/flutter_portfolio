import '../parallax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globals.dart';

class Work extends StatelessWidget {
  const Work({Key? key}) : super(key: key);

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
              'Work Experience',
              style: titleFont(scheme, fontSize: 40),
            ),
            spaceH25,
            for (final item in workExperienceItems)
              ListItem(
                imageUrl: item.imageUrl,
                name: item.title,
                subtitle: item.subtitle,
                time: item.time,
                description: item.description,
                fillBackground: false,
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
            'Work Experience',
            style: titleFont(scheme),
          ),
          spaceH50,
          for (final item in workExperienceItems)
            ListItem(
              imageUrl: item.imageUrl,
              name: item.title,
              subtitle: item.subtitle,
              time: item.time,
              description: item.description,
              fillBackground: false,
            ),
        ],
      );
    }));
  }
}
