// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/sections/contact.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'components/parallax.dart';
import 'components/sections/about.dart';
import 'components/drawerItems.dart';
import 'components/sections/home.dart';
import 'components/navigationRailSection.dart';
import 'components/sections/projects.dart';
import 'components/sections/work.dart';
import 'globals.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true,
          colorScheme: darkColorSchemes[color],
          unselectedWidgetColor: darkColorSchemes[color]?.onSurfaceVariant),
      theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true,
          colorScheme: lightColorSchemes[color],
          unselectedWidgetColor: darkColorSchemes[color]?.onSurfaceVariant),
      themeMode: _themeMode,
      home: const MyHomePage(title: 'Kenny Chan'),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  void changeColor(String _color) {
    setState(() {
      color = _color;
      gradientImage = ParallaxItem(
        imageUrl: "./assets/${_color}_gradient.png",
      );
    });
  }

  void changeColorChoice(int _selected, String color) {
    setState(() {
      selectedColor = color;
      selected = _selected;
    });
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

  void _setColorScheme(BuildContext context) {
    var darkMode = Theme.of(context).brightness == Brightness.dark;
    MyApp.of(context)?.changeTheme(darkMode ? ThemeMode.light : ThemeMode.dark);
  }

  void _setColor(String color) {
    MyApp.of(context)?.changeColor(color);
  }

  void _setColorChoice(int selected, String color) {
    MyApp.of(context)?.changeColorChoice(selected, color);
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
  double getPadding(BoxConstraints constraints) {
    if (constraints.isMobile) {
      return 24;
    }
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.isMobile) {
        return Scaffold(
            backgroundColor: scheme.background,
            extendBodyBehindAppBar: true,
            drawerEnableOpenDragGesture: false,
            appBar: AppBar(
              iconTheme: IconThemeData(color: scheme.onBackground),
              elevation: 0,
              centerTitle: true,
              leading: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Builder(
                    builder: (context) => IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        color: scheme.onBackground,
                        icon: Icon(Icons.menu)),
                  )),
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: openMenu(
                        context: context,
                        isHoriz: false,
                        setColor: _setColor,
                        setColorChoice: _setColorChoice,
                        setColorScheme: () {
                          _setColorScheme(context);
                        }))
              ],
              backgroundColor: scheme.background.withOpacity(0.7),
              surfaceTintColor: scheme.background.withOpacity(0.7),
              title: Text(
                widget.title,
                style: GoogleFonts.poppins(
                    color: scheme.onBackground, fontWeight: FontWeight.w500),
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
                backgroundColor: scheme.tertiaryContainer,
                onPressed: () {
                  mailToHelper();
                },
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: scheme.onTertiaryContainer,
                ),
              ),
            ));
      }
      return Scaffold(
        backgroundColor: scheme.background,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SafeArea(
                bottom: false,
                top: false,
                child: Row(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        NavigationRailSection(
                          key: navigationRailGlobalKey,
                          onSelectItem: handlePageIndexChanged,
                          selectedIndex: pageIndex,
                          scrollToIndex: scrollToIndex,
                          isExtended: isNavigationRailExtended,
                          setColorScheme: () {
                            _setColorScheme(context);
                          },
                        ),
                        openMenu(
                            context: context,
                            setColor: _setColor,
                            setColorChoice: _setColorChoice,
                            setColorScheme: () {
                              _setColorScheme(context);
                            })
                      ],
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
                iconTheme: IconThemeData(color: scheme.onBackground),
                elevation: 0,
                centerTitle: true,
                leading: Padding(
                  padding: EdgeInsets.only(left: 17),
                  child: IconButton(
                      onPressed: () {
                        handleNavigationRailExtended();
                      },
                      color: scheme.primary,
                      icon: Icon(Icons.menu)),
                ),
                actions: [
                  Padding(
                      padding: EdgeInsets.only(right: 22),
                      child: IconButton(
                          onPressed: () {
                            _setColorScheme(context);
                          },
                          color: scheme.primary,
                          icon: Icon(scheme == darkColorSchemes[color]
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_outlined)))
                ],
                backgroundColor: scheme.surface.withOpacity(0.7),
                surfaceTintColor: scheme.surface.withOpacity(0.7),
                title: Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                      color: scheme.primary, fontWeight: FontWeight.w500),
                ),
              )
            : null,
      );
    }));
  }
}
