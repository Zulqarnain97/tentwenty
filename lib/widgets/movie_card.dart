import 'package:flutter/material.dart';
import 'package:tentwenty/screens/book_ticket_screen.dart';
import '../screens/movie_detail_screen.dart';
import 'package:sizer/sizer.dart';

class MovieCard extends StatelessWidget{

  final List upcoming;



  const MovieCard({Key key,  this.upcoming}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(height: 90.0.h,
          child: ListView.builder(itemCount: upcoming.length ,itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 10.0.sp),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(15.0.sp),
                child: Container( height: 20.0.h,
                  decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(15.0.sp)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailScreen(
                            name: upcoming[index]['title'], banner: 'https://image.tmdb.org/t/p/w500'+ upcoming[index]['poster_path'],
                            releaseDate: upcoming[index]['release_date'], overview: upcoming[index]['overview'], vote_average: upcoming[index]['vote_average'].toString() ,
                          ))
                          );
                        },
                        child: Container( width: 30.0.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0.sp), bottomLeft: Radius.circular(15.0.sp),),
                              child: Image.network('https://image.tmdb.org/t/p/w500'+ upcoming[index]['poster_path'],
                                fit: BoxFit.cover,
                                height: 24.0.h,
                                width: 30.0.w,

                              ),
                            )),
                      ),
                      Container(color: Colors.white, width: 30.0.w,

                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0.sp, horizontal: 4.0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Text(upcoming[index]['title']!= null? upcoming[index]['title']: 'Loading',
                                textAlign: TextAlign.center,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Lato',
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(upcoming[index]['adult']==false ? 'non-adult' : 'adult' ,
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 10.0.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Text(upcoming[index]['release_date'],
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 10.0.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(BookTicketScreen.routeName,

                          );
                        },
                        child: Container(width: 30.0.w, height: 8.0.h,
                          margin: EdgeInsets.only(right: 5.0.sp),
                          decoration: BoxDecoration(color:   const Color(0xfff7dd00), borderRadius: BorderRadius.circular(15.0.sp), border: Border.all(color: Colors.black87, width: 1.0.sp)),
                          child: Center(child: Text('Book',   style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Zen Dots',
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,

                          ),)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          ))
        ],
      ),
    );
  }

}

class LandscapeMovieCard extends StatelessWidget{
  final List upcoming;

  const LandscapeMovieCard({Key key, this.upcoming}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(height: 50.0.h,
             
              child: ListView.builder(itemCount: upcoming.length ,itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.sp, horizontal: 30.0.sp),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(15.0.sp),
                    child: Container( height: 18.0.h,
                      decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(15.0.sp)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(MovieDetailScreen.routeName,);
                            },
                            child: Container( width: 40.0.w,
                                color: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0.sp), bottomLeft: Radius.circular(15.0.sp),),
                                  child: Image.network('https://image.tmdb.org/t/p/w500'+ upcoming[index]['poster_path'],
                                    fit: BoxFit.cover,
                                    height: 24.0.h,
                                    width: 30.0.w,

                                  ),
                                )),
                          ),
                          Container(color: Colors.white, width: 40.0.w,

                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0.sp, horizontal: 4.0.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  Text(upcoming[index]['title']!= null? upcoming[index]['title']: 'Loading',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Lato',
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(upcoming[index]['adult']==false ? 'non-adult' : 'adult' ,
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 10.0.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(upcoming[index]['release_date'],
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 10.0.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(BookTicketScreen.routeName,);
                            },
                            child: Container(width: 30.0.w, height: 8.0.h,
                              margin: EdgeInsets.only(right: 5.0.sp),
                              decoration: BoxDecoration(color:   const Color(0xfff7dd00), borderRadius: BorderRadius.circular(15.0.sp), border: Border.all(color: Colors.black87, width: 1.0.sp)),
                              child: Center(child: Text('Book',   style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Zen Dots',
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w400,

                              ),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              ))
        ],
      ),
    );
  }

}