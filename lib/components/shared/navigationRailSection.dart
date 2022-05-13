import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../constants.dart';

class NavigationRailSection extends StatefulWidget {
  final void Function(int) onSelectItem;
  final int selectedIndex;
  final Function(int) scrollToIndex;

  const NavigationRailSection({
    Key? key,
    required this.onSelectItem,
    required this.selectedIndex,
    required this.scrollToIndex,
  }) : super(key: key);

  @override
  State<NavigationRailSection> createState() => _NavigationRailSectionState();
}

class _NavigationRailSectionState extends State<NavigationRailSection> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 56),
      child: NavigationRail(
        indicatorColor: colorScheme.secondaryContainer,
        backgroundColor: colorScheme.background,
        minWidth: navigationRailWidth,
        leading: SizedBox(
          height: 150,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  backgroundColor: colorScheme.primary,
                  onPressed: () {},
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ]),
        ),
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.home_outlined, color: colorScheme.primary),
            label: Text(
              'Home',
              style: TextStyle(color: colorScheme.onSecondaryContainer),
            ),
            selectedIcon: Icon(Icons.home, color: colorScheme.primary),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.face_outlined, color: colorScheme.primary),
            label: Text(
              'About',
              style: TextStyle(color: colorScheme.onSecondaryContainer),
            ),
            selectedIcon: Icon(Icons.face, color: colorScheme.primary),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.code_outlined, color: colorScheme.primary),
            selectedIcon: Icon(Icons.code, color: colorScheme.primary),
            label: Text(
              'Work',
              style: TextStyle(color: colorScheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.person_outline, color: colorScheme.primary),
            label: Text(
              'Contact',
              style: TextStyle(color: colorScheme.onSecondaryContainer),
            ),
            selectedIcon: Icon(Icons.person, color: colorScheme.primary),
          )
        ],
        selectedIndex: _selectedIndex,
        useIndicator: true,
        labelType: NavigationRailLabelType.none,
        onDestinationSelected: (index) {
          widget.scrollToIndex(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
