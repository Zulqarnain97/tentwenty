import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:tentwenty/screens/ticket_detail_screen.dart';



class BookTicketScreen extends StatefulWidget {
  static const routeName = '/book_ticket_screen';

  @override
  _BookTicketScreenState createState() => _BookTicketScreenState();
}

class _BookTicketScreenState extends State<BookTicketScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController cimema = TextEditingController();
  TextEditingController seatnumber = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget TextFieldCard(
      String hint,
      TextInputType type,
      TextEditingController controller,
      FormFieldValidator validator,
    ) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 20.0.sp),
        child: Container(
          height: 8.0.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0.sp),
              border: Border.all(
                color: const Color(0xff132B5E),
              )),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0.sp),
              child: TextFormField(
                keyboardType: type,
                controller: controller,
                validator: validator,
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 14.0.sp,
                  color: const Color(0xff132B5E),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 12.0.sp,
                      color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF7DD00),
        automaticallyImplyLeading: false,
        elevation: 0.2,
        toolbarHeight: 10.0.h,
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
        title: Container(
          height: 9.0.h,
          width: 100.0.w,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Book A Ticket',
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Zen Dots',
                  fontSize: 14.0.sp),
            ),
          ),
        ),
      ),
      body: Container(
          height: 80.0.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.0.h,
                  ),
                  TextFieldCard(
                    'Enter Cinema Name',
                    TextInputType.name,
                    cimema,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Cinema Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 1.0.sp,
                  ),
                  TextFieldCard(
                    'Enter Seat Number',
                    TextInputType.number,
                    seatnumber,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Seat Number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 1.0.sp,
                  ),
                  TextFieldCard(
                    'Enter Location',
                    TextInputType.text,
                    location,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Location';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        if (formkey.currentState.validate()) {
                          print('Booking Ticket');
                          Timer(const Duration(milliseconds: 4000), () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> TicketDetailScreen()));
                          });



                        } else {
                          print("Not Validated");
                        }
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                           color: const Color(0xffF7DD00),
                            border: Border.all(
                                color: Colors.black, width: 1.0.sp),
                            borderRadius: BorderRadius.circular(15.0.sp)),
                        height: 10.0.h,
                        width: 50.0.w,
                        child: Center(
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Zen Dots',
                                fontSize: 14.0.sp),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
