// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/customAppBar.dart';
import 'package:portfolio/components/sections/contact.dart';
import 'package:portfolio/dark_theme_provider.dart';
import 'package:portfolio/pages/notFoundPage.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
    themeChangeProvider.color =
        await themeChangeProvider.darkThemePreference.getColor();
    themeChangeProvider.selected =
        await themeChangeProvider.darkThemePreference.getSelected();
    themeChangeProvider.gradientImageUrl =
        await themeChangeProvider.darkThemePreference.getGradientImageUrl();
    gradientImage = ParallaxItem(
      imageUrl: themeChangeProvider.gradientImageUrl,
    );
    selectedColor = themeChangeProvider.color;
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    const homePage = MyHomePage(title: 'Kenny Chan');
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    }, child: Consumer<DarkThemeProvider>(
      builder: (context, value, child) {
        String color = themeChangeProvider.color;
        return MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => homePage,
          },
          onGenerateRoute: (settings) =>
              MaterialPageRoute(builder: (context) => NotFoundPage()),
          onUnknownRoute: (settings) =>
              MaterialPageRoute(builder: (context) => NotFoundPage()),
          scrollBehavior: MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.unknown
            },
          ),
          debugShowCheckedModeBanner: false,
          title: 'Kenny Chan',
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
          themeMode:
              themeChangeProvider.darkTheme ? ThemeMode.dark : ThemeMode.light,
        );
      },
    ));
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      themeChangeProvider.darkTheme = themeMode == ThemeMode.dark;
    });
  }

  void changeColor(String _color) {
    setState(() {
      themeChangeProvider.gradientImageUrl = "./assets/${_color}_gradient.png";
      themeChangeProvider.color = _color;
      gradientImage = ParallaxItem(
        imageUrl: "./assets/${_color}_gradient.png",
      );
    });
  }

  void changeColorChoice(int _selected, String color) {
    setState(() {
      themeChangeProvider.selected = _selected;
      selected = _selected;
      selectedColor = color;
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
  bool isMouse = false;
  bool isNavigationRailExtended = false;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  ItemPosition itemPosition =
      ItemPosition(index: 0, itemLeadingEdge: 0, itemTrailingEdge: 1);
  GlobalKey<NavigationRailSectionState> navigationRailGlobalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    getItemPosition();
  }

  void getItemPosition() {
    itemPositionsListener.itemPositions.addListener(() {
      var firstItem = itemPositionsListener.itemPositions.value.first;
      itemPosition = firstItem;
      if (itemPosition.index != pageIndex) {
        navigationRailGlobalKey.currentState
            ?.onDestinationSelected(itemPosition.index, shouldScroll: false);
      }
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

  void scrollToMouseScroll(int index, double alignment, bool down) {
    double offset = down ? -0.15 : 0.15;
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
          index: index,
          alignment: alignment + offset,
          duration: const Duration(milliseconds: 400),
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
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    DarkThemeProvider themeChangeProvider =
        MyApp.of(context)!.themeChangeProvider;
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.isMobile) {
        return Scaffold(
            backgroundColor: scheme.background,
            extendBodyBehindAppBar: true,
            drawerEnableOpenDragGesture: false,
            appBar: PreferredSize(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getPadding(constraints)),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        constraints: BoxConstraints(maxWidth: 1350),
                        child: Builder(builder: (context) {
                          return CustomAppBar(
                              scrollToIndex: scrollToIndex,
                              showMenu:
                                  MediaQuery.of(context).size.width < 1000,
                              menu: fullPopUpMenu(
                                  themeChangeProvider: themeChangeProvider,
                                  scheme: scheme,
                                  setColor: _setColor,
                                  setColorChoice: _setColorChoice,
                                  context: context,
                                  scrollToIndex: scrollToIndex,
                                  setColorScheme: () {
                                    _setColorScheme(context);
                                  }));
                        })),
                  ),
                ),
                preferredSize: Size.fromHeight(80)),
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
            endDrawer: DrawerItems(
              itemScrollController: itemScrollController,
              setColor: _setColor,
              setColorChoice: _setColorChoice,
              setColorScheme: () {
                _setColorScheme(context);
              },
              themeChangeProvider: themeChangeProvider,
            ),
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
                    !showAppBar
                        ? Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              NavigationRailSection(
                                key: navigationRailGlobalKey,
                                onSelectItem: handlePageIndexChanged,
                                selectedIndex: pageIndex,
                                scrollToIndex: scrollToIndex,
                                isExtended: isNavigationRailExtended,
                              ),
                              fullPopUpMenu(
                                  themeChangeProvider: themeChangeProvider,
                                  scheme: scheme,
                                  setColor: _setColor,
                                  setColorChoice: _setColorChoice,
                                  context: context,
                                  scrollToIndex: scrollToIndex,
                                  setColorScheme: () {
                                    _setColorScheme(context);
                                  })
                            ],
                          )
                        : Container(),
                    Expanded(
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
        floatingActionButton: MediaQuery.of(context).size.width < 1000
            ? Padding(
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
              )
            : null,
        extendBodyBehindAppBar: true,
        endDrawer: DrawerItems(
          itemScrollController: itemScrollController,
          setColor: _setColor,
          setColorChoice: _setColorChoice,
          setColorScheme: () {
            _setColorScheme(context);
          },
          themeChangeProvider: themeChangeProvider,
        ),
        appBar: showAppBar
            ? PreferredSize(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getPadding(constraints)),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 1350),
                      child: Builder(builder: (context) {
                        return CustomAppBar(
                            scrollToIndex: scrollToIndex,
                            showMenu: MediaQuery.of(context).size.width < 1100,
                            moreMenu: popUpMenu(
                                themeChangeProvider: themeChangeProvider,
                                scheme: scheme,
                                setColor: _setColor,
                                setColorChoice: _setColorChoice,
                                context: context,
                                scrollToIndex: scrollToIndex,
                                setColorScheme: () {
                                  _setColorScheme(context);
                                }),
                            menu: fullPopUpMenu(
                                themeChangeProvider: themeChangeProvider,
                                scheme: scheme,
                                setColor: _setColor,
                                setColorChoice: _setColorChoice,
                                context: context,
                                scrollToIndex: scrollToIndex,
                                setColorScheme: () {
                                  _setColorScheme(context);
                                }));
                      })),
                ),
                preferredSize: Size.fromHeight(80))
            : null,
      );
    }));
  }
}
