import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/globals.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: ((context, constraints) {
      return Scaffold(
          backgroundColor: scheme.background,
          body: Center(
            child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getPadding(constraints)),
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Uh Oh! This page isn\'t available.',
                          style: TextStyle(
                              fontFamily: 'Rany',
                              color: scheme.primary,
                              fontSize: 60,
                              fontWeight: FontWeight.w500)),
                    ),
                    spaceH25,
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: scheme.onSecondaryContainer,
                        backgroundColor: scheme.secondaryContainer,
                        padding: const EdgeInsets.all(20.0),
                        textStyle: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Go Home'),
                    ),
                  ],
                )),
          ));
    }));
  }
}
