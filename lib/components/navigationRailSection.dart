import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class NavigationRailSection extends StatefulWidget {
  final void Function(int) onSelectItem;
  final int? selectedIndex;
  final Function(int) scrollToIndex;
  final bool isExtended;
  final Function() setColorScheme;

  const NavigationRailSection({
    Key? key,
    required this.onSelectItem,
    required this.selectedIndex,
    required this.scrollToIndex,
    required this.isExtended,
    required this.setColorScheme,
  }) : super(key: key);

  @override
  State<NavigationRailSection> createState() => NavigationRailSectionState();
}

class NavigationRailSectionState extends State<NavigationRailSection> {
  int? _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void onDestinationSelected(int index, {bool shouldScroll = true}) {
    setState(() {
      _selectedIndex = index;
    });
    shouldScroll ? widget.scrollToIndex(index) : null;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(top: showAppBar ? 56 : 2),
      child: NavigationRail(
        indicatorColor: scheme.secondaryContainer,
        backgroundColor: scheme.background,
        minWidth: navigationRailWidth,
        extended: widget.isExtended,
        groupAlignment: -0.75,
        leading: FloatingActionButton(
          backgroundColor: scheme.tertiaryContainer,
          onPressed: () {
            openDialog(context);
          },
          child: Icon(
            Icons.chat_bubble_outline,
            color: scheme.onTertiaryContainer,
          ),
        ),
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.home_outlined, color: scheme.onSecondaryContainer),
            label: Text(
              'Home',
              style: TextStyle(color: scheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.face_outlined, color: scheme.onSecondaryContainer),
            label: Text(
              'About',
              style: TextStyle(color: scheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.work_outline, color: scheme.onSecondaryContainer),
            label: Text(
              'Work',
              style: TextStyle(color: scheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon:
                Icon(Icons.folder_outlined, color: scheme.onSecondaryContainer),
            label: Text(
              'Projects',
              style: TextStyle(color: scheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon:
                Icon(Icons.person_outline, color: scheme.onSecondaryContainer),
            label: Text(
              'Contact',
              style: TextStyle(color: scheme.onSecondaryContainer),
            ),
          )
        ],
        selectedIndex: _selectedIndex,
        useIndicator: true,
        labelType: NavigationRailLabelType.none,
        onDestinationSelected: (index) {
          onDestinationSelected(index);
        },
      ),
    );
  }
}
