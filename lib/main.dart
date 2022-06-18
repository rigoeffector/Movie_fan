import 'package:film_fan/services/movie.api.provider.dart';
import 'package:film_fan/ui/screens/home.screen.dart';
import 'package:film_fan/ui/screens/splash.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieApiProvider movieApiProvider;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie app',
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
