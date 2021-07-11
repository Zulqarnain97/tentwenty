import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer_util.dart';
import './screens/book_ticket_screen.dart';
import './screens/ticket_detail_screen.dart';

import './screens/movie_detail_screen.dart';
import './screens/movie_list_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(//return LayoutBuilder
        builder: (context, constraints) {
      return OrientationBuilder(//return OrientationBuilder
          builder: (context, orientation) {
        //initialize SizerUtil()
        SizerUtil().init(constraints, orientation); //initialize SizerUtil
        return MaterialApp(
          locale: DevicePreview.locale(context), // Add the locale here
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (BuildContext context) => MovieListScreen(),
            '/movie_detail_screen': (BuildContext context) =>
                MovieDetailScreen(),
            '/book_ticket_screen': (BuildContext context) =>
                BookTicketScreen(),
            '/ticket_detail_screen': (BuildContext context) =>
                TicketDetailScreen(),

          },
        );
      });
    });
  }
}
