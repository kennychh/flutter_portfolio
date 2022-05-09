// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'constants.dart';
import 'parallax.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();
void main() {
  runApp(const MyApp());
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
  void _setColorScheme() {
    setState(() {
      if (colorScheme == darkColorScheme) {
        colorScheme = lightColorScheme;
      } else {
        colorScheme = darkColorScheme;
      }
    });
  }

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
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: AppBar().preferredSize.height,
              ),
              Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListItem(
                        imageUrl: gradientImage.imageUrl,
                        aspectRatio: 1,
                        showText: false,
                        borderRadius: 80,
                      ),
                      Container(
                        height: 20,
                      ),
                      Text('Hi, I\'m Kenny!',
                          style: GoogleFonts.poppins(
                              color: colorScheme.primary,
                              fontSize: 32,
                              fontWeight: FontWeight.w500)),
                      Container(
                        height: 20,
                      ),
                      Text(
                        'Front End Developer',
                        style: GoogleFonts.poppins(
                            color: colorScheme.secondary,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(height: 20),
                      Text(
                        'I\'m currently majoring in Cognitive Science and minoring in computer science at University of Toronto. I specialize in implementing elegant and user friendly digital experiences.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: colorScheme.secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(height: 200),
                    ],
                  )),
              Text(
                'Work Experience',
                style: GoogleFonts.poppins(
                    color: colorScheme.onSurface,
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
              Container(height: 25),
              for (final item in workExperienceItems)
                ListItem(
                  imageUrl: item.imageUrl,
                  name: item.title,
                  subtitle: item.subtitle,
                  description: item.description,
                ),
              Container(height: 50),
              Text(
                'Projects',
                style: GoogleFonts.poppins(
                    color: colorScheme.onSurface,
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
              Container(height: 25),
              for (final item in projectsItems)
                ListItem(
                  imageUrl: item.imageUrl,
                  name: item.title,
                  subtitle: item.subtitle,
                  description: item.description,
                ),
              Container(height: 200),
            ],
          ),
        )),
        drawer: Drawer(
          backgroundColor: colorScheme.secondaryContainer,
          child: Column(children: [
            Container(
              height: 56,
            ),
            ListTile(
              leading: Icon(Icons.home_outlined,
                  color: colorScheme.onSecondaryContainer),
              title: Text(
                'Home',
                style: TextStyle(color: colorScheme.onSecondaryContainer),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_outline,
                  color: colorScheme.onSecondaryContainer),
              title: Text(
                'About',
                style: TextStyle(color: colorScheme.onSecondaryContainer),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.psychology_outlined,
                  color: colorScheme.onSecondaryContainer),
              title: Text(
                'Skills',
                style: TextStyle(color: colorScheme.onSecondaryContainer),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.data_object_outlined,
                  color: colorScheme.onSecondaryContainer),
              title: Text(
                'Work',
                style: TextStyle(color: colorScheme.onSecondaryContainer),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.forum_outlined,
                  color: colorScheme.onSecondaryContainer),
              title: Text(
                'Contact',
                style: TextStyle(color: colorScheme.onSecondaryContainer),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ]),
        ),
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
