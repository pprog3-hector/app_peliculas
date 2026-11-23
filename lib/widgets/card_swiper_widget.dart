import 'package:app_peliculas/models/models.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:material_ui/material_ui.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({
    super.key,
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              print('Has pulsado esta peli');
              Navigator.pushNamed(context, '/details');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'), 
                image: NetworkImage(movies[index].fullPosterImage),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}