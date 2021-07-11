import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tentwenty/screens/movie_detail_screen.dart';
import 'package:tentwenty/widgets/movie_card.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieListScreen extends StatefulWidget {


  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {



  List upcomingmovies=[];
  final String apikey='c9aea24f602a91f21f812d95bd6832b2';
  final String readaccesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOWFlYTI0ZjYwMmE5MWYyMWY4MTJkOTViZDY4MzJiMiIsInN1YiI6IjYwZTk4YTNjZWM4YTQzMDAyYWU3Y2VkNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.px-8d5sIxllIyrfSp1ooeL0wGMikqblwjZOeHbePmTw';

  void initState(){
    LoadUpcomingMovies();
    super.initState();
  }

  LoadUpcomingMovies() async {
    TMDB tmdbWithCustomLogs= TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,

    )
    );
    Map upcomingResults= await tmdbWithCustomLogs.v3.movies.getUpcoming();

    setState(() {
      upcomingmovies= upcomingResults['results'];
    });
    print(upcomingmovies);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7dd00),
      appBar: AppBar(
        toolbarHeight: 10.0.h,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'TenTwenty',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.0.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Zen Dots'),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return buildPortrait();
          } else {
            return buildLandscape();
          }
        },
      ),
    );
  }

  Widget buildPortrait() {
    return Container(
      color: Colors.white,
      child: ListView(
          scrollDirection: Axis.vertical,
          children:[MovieCard(upcoming: upcomingmovies,)]),
    );
  }

  Widget buildLandscape() {
    return Container(
      color: Colors.white,
      child: ListView(
          scrollDirection: Axis.vertical,
          children:[LandscapeMovieCard(upcoming: upcomingmovies,),

          ]),
    );
  }
}
