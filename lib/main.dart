import 'package:app_peliculas/provider/movies_provider.dart';
import 'package:app_peliculas/routes/app_routes.dart';
import 'package:app_peliculas/themes/app_themes.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(), lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

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