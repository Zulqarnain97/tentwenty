import 'package:flutter/cupertino.dart';

class Movies with ChangeNotifier{
  final String PosterImage;
  final String Name;
  final String ReleaseDate;
  final String Adult;
  final String BookButton;

  Movies(
      {this.PosterImage,
      this.Name,
      this.ReleaseDate,
      this.Adult,
      this.BookButton});

}