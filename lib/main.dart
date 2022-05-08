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
          backgroundColor: lightColorScheme.background,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightColorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: lightColorScheme.onBackground),
          elevation: 0,
          leading: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Builder(
                builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    color: lightColorScheme.primary,
                    icon: Icon(Icons.menu)),
              )),
          backgroundColor: lightColorScheme.surface,
          title: Text(
            widget.title,
            style: GoogleFonts.poppins(
                color: lightColorScheme.primary, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi, I\'m Kenny!',
                          style: GoogleFonts.poppins(
                              color: lightColorScheme.primary,
                              fontSize: 32,
                              fontWeight: FontWeight.w600)),
                      Container(
                        height: 20,
                      ),
                      Text(
                        'I build things for mobile',
                        style: GoogleFonts.poppins(
                            color: lightColorScheme.secondary,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(height: 20),
                      Text(
                        'I\'m a software developer currently majoring in Cognitive Science and minoring in Computer Science at University of Toronto. I specialize in implementing (and sometimes designing) elegant and user friendly digital experiences.',
                        style: GoogleFonts.poppins(
                            color: lightColorScheme.secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(height: 200),
                    ],
                  )),
              Text(
                'Work Experience',
                style: GoogleFonts.poppins(
                    color: lightColorScheme.onSurface,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
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
                    color: lightColorScheme.onSurface,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              Container(height: 25),
              for (final item in projectsItems)
                ListItem(
                  imageUrl: item.imageUrl,
                  name: item.title,
                  subtitle: item.subtitle,
                  description: item.description,
                ),
            ],
          ),
        )),
        drawer: Drawer(
          backgroundColor: lightColorScheme.secondaryContainer,
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 7, bottom: 7),
          child: FloatingActionButton(
            backgroundColor: lightColorScheme.primary,
            onPressed: _incrementCounter,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.chat_bubble_outline,
              color: lightColorScheme.onPrimary,
            ),
          ),
        ));
  }
}
