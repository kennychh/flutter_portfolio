import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.home_outlined, color: colorScheme.primary),
    label: 'Home',
    selectedIcon: Icon(Icons.home_outlined, color: colorScheme.primary),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.face_outlined, color: colorScheme.primary),
    label: 'About',
    selectedIcon: Icon(Icons.face_outlined, color: colorScheme.primary),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.code_outlined, color: colorScheme.primary),
    selectedIcon: Icon(Icons.code_outlined, color: colorScheme.primary),
    label: 'Work',
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.person_outline, color: colorScheme.primary),
    label: 'Contact',
    selectedIcon: Icon(Icons.person_outline, color: colorScheme.primary),
  )
];

final List<NavigationRailDestination> navRailDestinations = appBarDestinations
    .map(
      (destination) => NavigationRailDestination(
        icon: Tooltip(
          message: destination.label,
          child: destination.icon,
        ),
        selectedIcon: Tooltip(
          message: destination.label,
          child: destination.selectedIcon,
        ),
        label: Text(destination.label),
      ),
    )
    .toList();

class NavigationRailSection extends StatefulWidget {
  final void Function(int) onSelectItem;
  final int selectedIndex;

  const NavigationRailSection({
    Key? key,
    required this.onSelectItem,
    required this.selectedIndex,
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
          setState(() {
            _selectedIndex = index;
          });
          widget.onSelectItem(index);
        },
      ),
    );
  }
}
