import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MovieDetailScreen extends StatefulWidget {
  static const routeName = '/movie_detail_screen';

  final String name, banner, overview, vote_average, releaseDate;

  const MovieDetailScreen({Key key, this.name, this.banner, this.overview, this.vote_average, this.releaseDate}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState(this.name, this.banner, this.overview, this.vote_average, this.releaseDate,  );
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final String name, banner, overview, vote_average, releaseDate;

  _MovieDetailScreenState(this.name, this.banner, this.overview, this.vote_average, this.releaseDate);
  Widget MovieGenreDate(String name, String detail) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 35.0.w,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0.sp, horizontal: 5.0.sp),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12.0.sp,
                  fontFamily: 'Lato'),
            ),
          ),
        ),
        Container(
            width: 55.0.w,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0.sp, horizontal: 5.0.sp),
                  child: Text(
                    detail,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0.sp,
                        fontFamily: 'Ubuntu'),
                  )),
            ))
      ],
    );
  }


  Widget LandscapeMovieGenreDate(String name, String detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 35.0.w,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0.sp, horizontal: 5.0.sp),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12.0.sp,
                  fontFamily: 'Lato'),
            ),
          ),
        ),
        Container(
            width: 60.0.w,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0.sp, horizontal: 5.0.sp),
                  child: Text(
                    detail,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0.sp,
                        fontFamily: 'Ubuntu'),
                  )),
            ))
      ],
    );
  }

  Widget MovieOverView(String name, String description) {
    return Container(
        height: 20.0.h,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.sp),
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12.0.sp,
                        fontFamily: 'Lato'),
                  )),
              SizedBox(
                height: 2.0.sp,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.0.sp, horizontal: 10.0.sp),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0.sp,
                        fontFamily: 'Ubuntu'),
                  )),
            ])));
  }

  Widget LandscapeMovieOverView(String name, String description) {
    return Container(
        height: 20.0.h,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.sp),
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12.0.sp,
                            fontFamily: 'Lato'),
                      )),
                  SizedBox(
                    height: 2.0.sp,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.0.sp, horizontal: 10.0.sp),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0.sp,
                            fontFamily: 'Ubuntu'),
                      )),
                ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Material(
                        elevation: 4,
                        child: Container(
                          height: 50.0.h,
                          width: 100.0.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.0.sp),
                                bottomRight: Radius.circular(25.0.sp)),
                            child: Image.network(
                              banner,
                              fit: BoxFit.fill,
                              height: 50.0.h,
                              width: 100.0.w,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        child: Container(
                          height: 50.0.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.0.sp),
                                bottomRight: Radius.circular(25.0.sp)),
                            color: Colors.black.withOpacity(0.4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(
                                flex: 1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0.sp, horizontal: 10.0.sp),
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                    size: 26.0.sp,
                                  ),
                                ),
                              ),
                              Spacer(
                                flex: 6,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Zen Dots',
                                      fontSize: 20.0.sp),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 42.0.h,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.0.sp, vertical: 10.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MovieGenreDate(
                              'vote_average',
                              vote_average,
                            ),
                            MovieGenreDate(
                              'Release Date:',
                              releaseDate,
                            ),
                            MovieOverView(
                              'OverView:',
                              overview,
                            ),
                            SizedBox(
                              height: 2.0.sp,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xfff7dd00),
                                      borderRadius: BorderRadius.circular(15.0.sp)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0.sp, horizontal: 10.0.sp),
                                    child: Text(
                                      'Watch Trailer',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Zen Dots',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0.sp),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Material(
                      elevation: 4,
                      child: Container(
                        height: 100.0.h,
                        width: 70.0.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.0.sp),
                              bottomRight: Radius.circular(25.0.sp)),
                          child: Image.network(
                            banner,
                            fit: BoxFit.fill,
                            height: 100.0.h,
                            width: 70.0.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.0.sp),
                              bottomRight: Radius.circular(25.0.sp)),
                          color: Colors.black.withOpacity(0.4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0.sp, horizontal: 10.0.sp),
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.white,
                                  size: 26.0.sp,
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 6,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
                              child: Text(
                                name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Zen Dots',
                                    fontSize: 24.0.sp),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    height: 100.0.h,
                    width: 60.0.w,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 10.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LandscapeMovieGenreDate(
                              'Vote_Average',
                              vote_average,
                            ),
                            LandscapeMovieGenreDate(
                              'Release Date:',
                             releaseDate
                            ),
                            LandscapeMovieOverView(
                              'OverView:',
                              overview,
                            ),
                            SizedBox(
                              height: 5.0.h,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xfff7dd00),
                                      borderRadius: BorderRadius.circular(15.0.sp)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0.sp, horizontal: 10.0.sp),
                                    child: Text(
                                      'Watch Trailer',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Zen Dots',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0.sp),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }




}
