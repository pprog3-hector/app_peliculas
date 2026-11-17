import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[700],
        title: Text('Peliculas', style: TextStyle(fontWeight: FontWeight.bold),),
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
            Container(
              child: Swiper(
                itemCount: 10,
                layout: SwiperLayout.STACK,
                itemHeight: size.height * 0.4,
                itemWidth: size.width * 0.6,
                itemBuilder: (context, index){
                  return FadeInImage(
                    placeholder: AssetImage('assets/jar-loading.gif'), 
                    image: NetworkImage('https://image.tmdb.org/t/p/original/ddnwokQ1ybe0vEErT2RdReZjByk.jpg')
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}