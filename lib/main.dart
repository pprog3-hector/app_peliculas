import 'package:app_peliculas/routes/app_routes.dart';
import 'package:app_peliculas/themes/app_themes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      theme: AppThemes.darkTheme,
    );
  }
}