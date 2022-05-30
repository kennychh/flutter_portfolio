// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class NavigationRailSection extends StatefulWidget {
  final void Function(int) onSelectItem;
  final int? selectedIndex;
  final Function(int) scrollToIndex;
  final bool isExtended;

  const NavigationRailSection({
    Key? key,
    required this.onSelectItem,
    required this.selectedIndex,
    required this.scrollToIndex,
    required this.isExtended,
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
        leading: Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: FloatingActionButton(
            elevation: 0,
            tooltip: 'Contact Me',
            backgroundColor: scheme.tertiaryContainer,
            onPressed: () {
              mailToHelper();
            },
            child: Icon(
              Icons.chat_bubble_outline,
              color: scheme.onTertiaryContainer,
            ),
          ),
        ),
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.home_outlined, color: scheme.onSecondaryContainer),
            label: Text(
              'Home',
              style: GoogleFonts.poppins(color: scheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.face_outlined, color: scheme.onSecondaryContainer),
            label: Text(
              'About',
              style: GoogleFonts.poppins(color: scheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.work_outline, color: scheme.onSecondaryContainer),
            label: Text(
              'Work',
              style: GoogleFonts.poppins(color: scheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon:
                Icon(Icons.folder_outlined, color: scheme.onSecondaryContainer),
            label: Text(
              'Projects',
              style: GoogleFonts.poppins(color: scheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon:
                Icon(Icons.person_outline, color: scheme.onSecondaryContainer),
            label: Text(
              'Contact',
              style: GoogleFonts.poppins(color: scheme.onSecondaryContainer),
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
