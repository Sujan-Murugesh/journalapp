import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journalapp/src/provider/entry_provider.dart';
import 'package:journalapp/src/screens/home.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EntryProvider(),
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: Colors.black26,
            primaryColor: Colors.blueGrey,
            textTheme: GoogleFonts.patrickHandScTextTheme(),
        ),
      ),
    );
  }
}

/*
return MaterialApp(
      home: HomeScreen(), <==== replaced 1
      theme: ThemeData(accentColor: Colors.pinkAccent,primaryColor: Colors.black),
    );
* ====> 1 Scaffold(body: Center(child: Text('Home Page'),
        ),
      ),
* */