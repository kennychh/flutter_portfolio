import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../constants.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    Key? key,
    required this.itemScrollController,
  }) : super(key: key);

  final ItemScrollController itemScrollController;

  void scrollToIndex(int index) {
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
          index: index,
          duration: const Duration(seconds: 1),
          curve: Curves.ease);
    }
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
            scrollToIndex(0);
            Navigator.pop(context);
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
            scrollToIndex(1);
            Navigator.pop(context);
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
            scrollToIndex(2);
            Navigator.pop(context);
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
            scrollToIndex(3);
            Navigator.pop(context);
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
              scrollToIndex(4);
              Navigator.pop(context);
            }),
      ]),
    );
  }
}
