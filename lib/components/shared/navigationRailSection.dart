import 'package:flutter/material.dart';
import '../../constants.dart';

class NavigationRailSection extends StatefulWidget {
  final void Function(int) onSelectItem;
  final int selectedIndex;
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
  int _selectedIndex = 0;

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
    return Padding(
      padding: EdgeInsets.only(top: showAppBar ? 56 : 20),
      child: NavigationRail(
        indicatorColor: colorScheme.secondaryContainer,
        backgroundColor: colorScheme.background,
        minWidth: navigationRailWidth,
        extended: widget.isExtended,
        leading: SizedBox(
          height: 80,
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
        trailing: Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: IconButton(
                onPressed: () {
                  widget.setColorScheme();
                },
                color: colorScheme.primary,
                icon: Icon(colorScheme == darkColorScheme
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined)),
          ),
        )),
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.home_outlined, color: colorScheme.primary),
            label: Text(
              'Home',
              style: TextStyle(color: colorScheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.face_outlined, color: colorScheme.primary),
            label: Text(
              'About',
              style: TextStyle(color: colorScheme.onSecondaryContainer),
            ),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.code_outlined, color: colorScheme.primary),
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
