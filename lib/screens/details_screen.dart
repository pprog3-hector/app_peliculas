import 'package:app_peliculas/models/models.dart';
import 'package:app_peliculas/provider/movies_provider.dart';
import 'package:app_peliculas/themes/app_themes.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final Movie movieModal = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movieModal,),
          SliverList(delegate: SliverChildListDelegate([
            _PosterTitle(movie: movieModal),
            _Overview(movie: movieModal),
            _Casting(movie: movieModal,),
          ]))
        ],
      )
    );
  }
}

class _Casting extends StatelessWidget {

  final Movie movie;

  const _Casting({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movie.id),
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {

        if( !snapshot.hasData ){
          return SizedBox(
            height: 240,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Container(
          margin: EdgeInsets.all(20),
          height: 240,
          width: double.infinity,
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                // color: Colors.red,
                height: 180,
                width: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/jar-loading.gif'), 
                        image: NetworkImage(snapshot.data![index].fullPosterImage),
                        width: 110,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(snapshot.data![index].character!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2),
                    Text(snapshot.data![index].name, style: TextStyle(color: Colors.white, fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 2),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(movie.overview, style: const TextStyle(color: Colors.white), textAlign: TextAlign.justify,),
    );
  }
}

class _PosterTitle extends StatelessWidget {

  final Movie movie;

  const _PosterTitle({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage(movie.fullPosterImage),
              fit: BoxFit.cover,
              width: 150,
              height: 220,
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                Text(movie.originalTitle, style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.yellow,),
                    const SizedBox(width: 5,),
                    Text('${movie.voteAverage.roundToDouble()}/10', style: const TextStyle(color: Colors.white),)
                  ]
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppThemes.primary,
      expandedHeight: 150,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.black38,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Text(movie.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,)
          )
        ),
        centerTitle: true,
        background: FadeInImage(
          placeholder: const AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage(movie.fullBackdropPathImage),
          fit: BoxFit.cover,
        ),
      ),
      
    );
  }
}