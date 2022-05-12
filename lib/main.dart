// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/components/shared/contact.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'components/shared/about.dart';
import 'components/shared/drawerItems.dart';
import 'components/shared/home.dart';
import 'components/shared/skills.dart';
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
void getItemPosition() {
  itemPositionsListener.itemPositions.addListener(() {
    itemPosition = itemPositionsListener.itemPositions.value.first;
  });
}

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
  @override
  void initState() {
    super.initState();
    getItemPosition();
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

  final List<Widget> componentList = [Home(), About(), Work(), Contact()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorScheme.background,
        extendBodyBehindAppBar: true,
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
          title: Text(
            widget.title,
            style: GoogleFonts.poppins(
                color: colorScheme.primary, fontWeight: FontWeight.w600),
          ),
        ),
        body: ScrollablePositionedList.builder(
          key: UniqueKey(),
          initialScrollIndex: itemPosition.index,
          initialAlignment: itemPosition.itemLeadingEdge,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: componentList.length,
          itemBuilder: (context, index) {
            return Container(
              child: componentList[index],
            );
          },
        ),
        drawer: DrawerItems(itemScrollController: itemScrollController),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 7, bottom: 7),
          child: FloatingActionButton(
            backgroundColor: colorScheme.primary,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.chat_bubble_outline,
              color: colorScheme.onPrimary,
            ),
          ),
        ));
  }
}
