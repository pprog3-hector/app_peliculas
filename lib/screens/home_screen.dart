import 'package:app_peliculas/provider/movies_provider.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[700],
        title: const Text('Peliculas', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(
              movies: moviesProvider.nowPlayingMovies,
            ),
            MovieSlider(
              movies: moviesProvider.popularMovies,
              widgetName: 'Peliculas populares',
            )
          ],
        ),
      )
    );
  }
}

