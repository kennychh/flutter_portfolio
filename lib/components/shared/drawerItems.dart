import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: scheme.surface,
      child: Column(children: [
        Container(
          height: 56,
        ),
        ListTile(
          leading: Icon(Icons.home_outlined, color: scheme.onSurface),
          title: Text(
            'Home',
            style:
                TextStyle(color: scheme.onSurface, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            scrollToIndex(0);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.face_outlined, color: scheme.onSurface),
          title: Text(
            'About',
            style:
                TextStyle(color: scheme.onSurface, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            scrollToIndex(1);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.work_outline, color: scheme.onSurface),
          title: Text(
            'Work',
            style:
                TextStyle(color: scheme.onSurface, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            scrollToIndex(2);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.folder_outlined, color: scheme.onSurface),
          title: Text(
            'Projects',
            style:
                TextStyle(color: scheme.onSurface, fontWeight: FontWeight.w600),
          ),
          onTap: () {
            scrollToIndex(3);
            Navigator.pop(context);
          },
        ),
        ListTile(
            leading: Icon(Icons.person_outline, color: scheme.onSurface),
            title: Text(
              'Contact',
              style: TextStyle(
                  color: scheme.onSurface, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              scrollToIndex(4);
              Navigator.pop(context);
            }),
      ]),
    );
  }
}
