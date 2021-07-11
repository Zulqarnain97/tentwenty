import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TicketDetailScreen extends StatelessWidget{

  static const routeName='/ticket_detail_screen';


  Widget TicketDetail(String name, String detail){
    return Container(
      height: 8.0.h,
      color: Colors.white,
      child: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.sp, ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  width: 40.0.w,
                  child: Text(name, style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14.0.sp,
                    fontFamily: 'Lato'
              ),),
                ),

                Container(
                  width: 40.0.w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(detail,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0.sp,
                        fontFamily: 'Ubuntu'
                    ),),
                  ),
                ),
              ],
            )),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.0.h,
        backgroundColor: const Color(0xffF7DD00),
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 1.0.sp),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: 20.0.sp,
              ),
            )),
        title: Text('Ticket Detail', style: TextStyle(
            color: Colors.black,
            fontFamily: 'Zen Dots',
            fontSize: 18.0.sp),),

      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          if(orientation == Orientation.portrait){
            return portraitMode();
          }else{
            return landscapeMode();
          }
        },
      ),
    );
  }
Widget portraitMode(){
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10.0.h,),
              TicketDetail('Cinema:', 'Shaheen Cinema'),
              TicketDetail('City:', 'Sargodha'),
              TicketDetail('Booking Number:', '0xFF123'),
              TicketDetail('Seat Number:', '12'),
              TicketDetail('Ticket Price:', 'Rs. 1000'),
              SizedBox(height: 10.0.h,),
            ]),
      ),
    );
}

Widget landscapeMode(){
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 4.0.h,),
                TicketDetail('Cinema:', 'Shaheen Cinema'),
                TicketDetail('City:', 'Sargodha'),
                TicketDetail('Booking Number:', '0xFF123'),
                TicketDetail('Seat Number:', '12'),
                TicketDetail('Ticket Price:', 'Rs. 1000'),
                SizedBox(height: 10.0.h,),
              ]),
        ),
      ),
    );
  }
}