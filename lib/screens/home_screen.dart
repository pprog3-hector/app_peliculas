import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

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
            const CardSwiper(),
            MovieSlider()
          ],
        ),
      )
    );
  }
}

