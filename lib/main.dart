import 'package:flutter/material.dart';
import 'constants.dart';
import 'parallax.dart';

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
          backgroundColor: lightColorScheme.background, useMaterial3: true),
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
        backgroundColor: lightColorScheme.background,
        title: Text(
          widget.title,
          style: TextStyle(color: lightColorScheme.onBackground),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Hi, I\'m Kenny!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            ExampleParallax()
          ],
        ),
      )),
      endDrawer: Drawer(
        backgroundColor: lightColorScheme.primaryContainer,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightColorScheme.primaryContainer,
        onPressed: _incrementCounter,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Icon(
          Icons.chat_bubble_outline,
          color: lightColorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
