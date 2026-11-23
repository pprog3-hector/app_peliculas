import 'package:app_peliculas/screens/screens.dart';
import 'package:material_ui/material_ui.dart';

class AppRoutes {

  static String initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/home' : (BuildContext context) => const HomeScreen(),
    '/details' : (BuildContext context) => const DetailsScreen()
  };
  
}