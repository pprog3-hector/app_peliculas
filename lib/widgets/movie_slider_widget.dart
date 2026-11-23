import 'package:app_peliculas/models/models.dart';
import 'package:material_ui/material_ui.dart';

class MovieSlider extends StatelessWidget {

  final List<Movie> movies;
  final String widgetName;

  const MovieSlider({
    super.key, 
    required this.movies, 
    required this.widgetName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widgetName, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 200,
                  width: 130,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          print('Has pulsado una peli del LV');
                          Navigator.pushNamed(context, '/details');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: FadeInImage(
                            placeholder: const AssetImage('assets/jar-loading.gif'), 
                            image: NetworkImage(movies[index].fullPosterImage),
                            width: 130,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(movies[index].title, style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis, maxLines: 2,)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}