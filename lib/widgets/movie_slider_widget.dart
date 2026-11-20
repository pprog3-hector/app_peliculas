import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const new({
    super.key,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Peliculas populares', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
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
                            image: NetworkImage('https://i.pinimg.com/1200x/5d/e0/16/5de01684b848c903f9aa01cb38879a1a.jpg'),
                            width: 130,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Nombre pelicula', style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis, maxLines: 2,)
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