import 'package:flutter/material.dart';
import '../../constants.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  void scrollTo(GlobalKey<ScaffoldState> key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    double y = position.dy;
    scrollController.animateTo(
      y - AppBar().preferredSize.height,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorScheme.secondaryContainer,
      child: Column(children: [
        Container(
          height: 56,
        ),
        ListTile(
          leading: Icon(Icons.home_outlined,
              color: colorScheme.onSecondaryContainer),
          title: Text(
            'Home',
            style: TextStyle(color: colorScheme.onSecondaryContainer),
          ),
          onTap: () {
            scrollTo(homeKey);
          },
        ),
        ListTile(
          leading: Icon(Icons.face_outlined,
              color: colorScheme.onSecondaryContainer),
          title: Text(
            'About',
            style: TextStyle(color: colorScheme.onSecondaryContainer),
          ),
          onTap: () {
            scrollTo(aboutKey);
          },
        ),
        ListTile(
          leading: Icon(Icons.psychology_outlined,
              color: colorScheme.onSecondaryContainer),
          title: Text(
            'Skills',
            style: TextStyle(color: colorScheme.onSecondaryContainer),
          ),
          onTap: () {
            scrollTo(skillsKey);
          },
        ),
        ListTile(
          leading: Icon(Icons.code_outlined,
              color: colorScheme.onSecondaryContainer),
          title: Text(
            'Work',
            style: TextStyle(color: colorScheme.onSecondaryContainer),
          ),
          onTap: () {
            scrollTo(workKey);
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline,
              color: colorScheme.onSecondaryContainer),
          title: Text(
            'Contact',
            style: TextStyle(color: colorScheme.onSecondaryContainer),
          ),
          onTap: () {
            scrollTo(contactKey);
          },
        ),
      ]),
    );
  }
}
