// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/shared/contact.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'components/shared/about.dart';
import 'components/shared/drawerItems.dart';
import 'components/shared/home.dart';
import 'components/shared/navigationRailSection.dart';
import 'components/shared/projects.dart';
import 'components/shared/work.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();
ItemPosition itemPosition =
    ItemPosition(index: 0, itemLeadingEdge: 0, itemTrailingEdge: 1);

GlobalKey<NavigationRailSectionState> navigationRailGlobalKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          backgroundColor: colorScheme.background,
          useMaterial3: true),
      home: const MyHomePage(title: 'Kenny Chan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? pageIndex;
  bool isNavigationRailExtended = false;
  @override
  void initState() {
    super.initState();
    getItemPosition();
  }

  void getItemPosition() {
    itemPositionsListener.itemPositions.addListener(() {
      itemPosition = itemPositionsListener.itemPositions.value.first;
      if (itemPosition.index != pageIndex) {
        navigationRailGlobalKey.currentState
            ?.onDestinationSelected(itemPosition.index, shouldScroll: false);
      }
      ;
    });
  }

  void _setColorScheme() {
    setState(() {
      if (colorScheme == darkColorScheme) {
        colorScheme = lightColorScheme;
      } else {
        colorScheme = darkColorScheme;
      }
      getItemPosition();
    });
  }

  void scrollToIndex(int index) {
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
          index: index,
          duration: const Duration(seconds: 1),
          curve: Curves.ease);
    }
  }

  void handlePageIndexChanged(int selectedPage) {
    setState(() {
      pageIndex = selectedPage;
    });
  }

  void handleNavigationRailExtended() {
    setState(() {
      isNavigationRailExtended = !isNavigationRailExtended;
    });
  }

  final List<Widget> componentList = [
    Home(),
    About(),
    Work(),
    Projects(),
    Contact()
  ];
  @override
  double getPadding(BoxConstraints constraints) {
    if (constraints.isMobile) {
      return 24;
    }
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.isMobile) {
        return Scaffold(
            backgroundColor: colorScheme.background,
            extendBodyBehindAppBar: true,
            drawerEnableOpenDragGesture: false,
            appBar: AppBar(
              iconTheme: IconThemeData(color: colorScheme.onBackground),
              elevation: 0,
              centerTitle: true,
              leading: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Builder(
                    builder: (context) => IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        color: colorScheme.primary,
                        icon: Icon(Icons.menu)),
                  )),
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: IconButton(
                        onPressed: _setColorScheme,
                        color: colorScheme.primary,
                        icon: Icon(colorScheme == darkColorScheme
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined)))
              ],
              backgroundColor: colorScheme.surface.withOpacity(0.7),
              surfaceTintColor: colorScheme.surface.withOpacity(0.7),
              title: Text(
                widget.title,
                style: GoogleFonts.poppins(
                    color: colorScheme.primary, fontWeight: FontWeight.w500),
              ),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return ScrollablePositionedList.builder(
                  key: UniqueKey(),
                  initialScrollIndex: itemPosition.index,
                  initialAlignment: itemPosition.itemLeadingEdge,
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  padding:
                      EdgeInsets.symmetric(horizontal: getPadding(constraints)),
                  itemCount: componentList.length,
                  itemBuilder: (context, index) {
                    return AdaptiveContainer(
                      columnSpan: 12,
                      child: componentList[index],
                    );
                  },
                );
              },
            ),
            drawer: DrawerItems(itemScrollController: itemScrollController),
            floatingActionButton: Padding(
              padding: EdgeInsets.only(right: 7, bottom: 7),
              child: FloatingActionButton(
                backgroundColor: colorScheme.primary,
                onPressed: () {},
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: colorScheme.onPrimary,
                ),
              ),
            ));
      }
      return Scaffold(
        backgroundColor: colorScheme.background,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SafeArea(
                bottom: false,
                top: false,
                child: Row(
                  children: <Widget>[
                    NavigationRailSection(
                      key: navigationRailGlobalKey,
                      onSelectItem: handlePageIndexChanged,
                      selectedIndex: pageIndex,
                      scrollToIndex: scrollToIndex,
                      isExtended: isNavigationRailExtended,
                      setColorScheme: _setColorScheme,
                    ),
                    Flexible(
                      child: ScrollablePositionedList.builder(
                        key: UniqueKey(),
                        initialScrollIndex: itemPosition.index,
                        initialAlignment: itemPosition.itemLeadingEdge,
                        itemScrollController: itemScrollController,
                        itemPositionsListener: itemPositionsListener,
                        itemCount: componentList.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: getPadding(constraints)),
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 1350,
                                  minHeight:
                                      MediaQuery.of(context).size.height),
                              child: componentList[index],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ));
          },
        ),
        extendBodyBehindAppBar: true,
        appBar: showAppBar
            ? AppBar(
                iconTheme: IconThemeData(color: colorScheme.onBackground),
                elevation: 0,
                centerTitle: true,
                leading: Padding(
                  padding: EdgeInsets.only(left: 17),
                  child: IconButton(
                      onPressed: () {
                        handleNavigationRailExtended();
                      },
                      color: colorScheme.primary,
                      icon: Icon(Icons.menu)),
                ),
                actions: [
                  Padding(
                      padding: EdgeInsets.only(right: 22),
                      child: IconButton(
                          onPressed: _setColorScheme,
                          color: colorScheme.primary,
                          icon: Icon(colorScheme == darkColorScheme
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_outlined)))
                ],
                backgroundColor: colorScheme.surface.withOpacity(0.7),
                surfaceTintColor: colorScheme.surface.withOpacity(0.7),
                title: Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                      color: colorScheme.primary, fontWeight: FontWeight.w500),
                ),
              )
            : null,
      );
    }));
  }
}
