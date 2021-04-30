import 'package:flutter/material.dart';
import 'package:movie_app/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies App",
      routes: getApplicationRoutes(),
      initialRoute: '/',
    );
  }
}
