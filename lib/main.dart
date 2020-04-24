import 'package:firstapp/screens/home/main.dart';
import 'package:firstapp/screens/plant/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/plant': (context) => PlantScreen()
        },
    );
  }
}
