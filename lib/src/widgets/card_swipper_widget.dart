import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_app/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  CardSwiper({@required this.movies});

  @override
  Widget build(BuildContext context) {
    
    final __screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      // width: __screenSize.width * 0.7,
      // height: __screenSize.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            // child: Image.network("https://via.placeholder.com/350x150",fit: BoxFit.fill,),
            // child: Image.network("https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",fit: BoxFit.fill,),
            child: FadeInImage(
              image: NetworkImage(movies[index].getPosterImg()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
            ),
            
          );
        },
        itemCount: movies.length,
        itemWidth: __screenSize.width * 0.7,
        itemHeight: __screenSize.height * 0.5,
        // pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }
}