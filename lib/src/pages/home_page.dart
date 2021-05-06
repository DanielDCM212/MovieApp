import 'package:flutter/material.dart';
import 'package:movie_app/src/provider/movies_provider.dart';

import 'package:movie_app/src/widgets/card_swipper_widget.dart';
import 'package:movie_app/src/widgets/movie_horizontal.dart';

class HomePage extends StatefulWidget {
  // HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final providerMovies = ProviderMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Movies App'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){},),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
          _swiperCards(),
          _footer(context),
        ],
        ),
      ),
    );
  }

  Widget _swiperCards() {

    return FutureBuilder(
      future: providerMovies.getCinemaMovies(),
      // initialData: [1, 2, 3, 4],
      builder: (BuildContext context, AsyncSnapshot <List> snapshot) {
        final __screenSize = MediaQuery.of(context).size;

        if (snapshot.hasData){
          return CardSwiper(movies: snapshot.data);
        }else{
          return Container(
            height: __screenSize.height * 0.5,
            child: Center(child: CircularProgressIndicator())
            );
        }
        
      },
    );  
  
  }

  Widget _footer(BuildContext context) {
    return Container(width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 20.0),
        child: Text('Populars', style: Theme.of(context).textTheme.subtitle1)
        ),
      SizedBox(height: 20.0),
      FutureBuilder(
        future: providerMovies.getPopulars(),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final __screenSize = MediaQuery.of(context).size;

          if (snapshot.hasData){
            return HorizontalMovie(movies: snapshot.data);
          }else{
            return Container(
              height: __screenSize.height * 0.25,
              child: Center(child: CircularProgressIndicator())
              );
          }
        },
      ),
    ],),);
  }
}
