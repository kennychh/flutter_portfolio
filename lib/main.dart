// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'constants.dart';
import 'parallax.dart';

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
          fontFamily: 'Poppins',
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
          iconTheme: IconThemeData(color: lightColorScheme.onBackground),
          elevation: 0,
          leading: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Builder(
                builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: Icon(Icons.menu)),
              )),
          backgroundColor: lightColorScheme.surface,
          title: Text(
            widget.title,
            style: TextStyle(
                color: lightColorScheme.onBackground,
                fontWeight: FontWeight.w600),
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
                      Text(
                        'Hi, I\'m Kenny!',
                        style: TextStyle(
                            color: lightColorScheme.primary,
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        height: 20,
                      ),
                      Text(
                        'I build things for mobile',
                        style: TextStyle(
                            color: lightColorScheme.secondary,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(height: 20),
                      Text(
                        'I\'m a software developer currently majoring in Cognitive Science and minoring in Computer Science at University of Toronto. I specialize in implementing (and sometimes designing) elegant and user friendly digital experiences.',
                        style: TextStyle(
                            color: lightColorScheme.secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(height: 200),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chat_bubble_outline,
                            color: lightColorScheme.onPrimaryContainer,
                          ),
                          label: Text('Let\'s chat!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: lightColorScheme.onPrimaryContainer)),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 28, horizontal: 22),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              backgroundColor:
                                  lightColorScheme.primaryContainer)),
                    ],
                  )),
              for (final item in items)
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
          backgroundColor: lightColorScheme.primaryContainer,
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 8),
          child: FloatingActionButton(
            backgroundColor: lightColorScheme.primaryContainer,
            onPressed: _incrementCounter,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.chat_bubble_outline,
              color: lightColorScheme.onPrimaryContainer,
            ),
          ),
        ));
  }
}
