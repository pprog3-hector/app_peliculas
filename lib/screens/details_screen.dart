import 'package:app_peliculas/themes/app_themes.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate([
            _PosterTitle(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Ut do incididunt ullamco commodo excepteur deserunt adipisicing velit. Et amet ex adipisicing velit duis velit officia et consequat labore proident. Et ullamco cillum pariatur cupidatat incididunt nulla id quis sint. Minim nostrud tempor eiusmod voluptate proident culpa. Aliquip consectetur eu magna dolore ut minim. Dolore velit sit nisi esse exercitation cillum. Cupidatat cupidatat eu aute magna eu excepteur officia.', style: TextStyle(color: Colors.white, ), textAlign: TextAlign.justify,),
            )
          ]))
        ],
      )
    );
  }
}

class _PosterTitle extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage('https://i.pinimg.com/1200x/5d/e0/16/5de01684b848c903f9aa01cb38879a1a.jpg'),
              fit: BoxFit.cover,
              height: 220,
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre pelicula', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                Text('The Oddysey', style: TextStyle(color: Colors.white)),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.yellow,),
                    SizedBox(width: 5,),
                    Text('8.9', style: TextStyle(color: Colors.white),)
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
  const new({
    super.key,
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
          child: Text('Detalles', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,)
        ),
        centerTitle: true,
        background: const FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: AssetImage('assets/HO00005974.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      
    );
  }
}