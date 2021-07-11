
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tentwenty/models/movies.dart';

class CategoriesProvider with ChangeNotifier {
  List<Movies> _movs = [];

  List<Movies> get movs {
    return [..._movs];
  }





  Future<bool> fetchAndSetMovies() async {
    const url = 'https://admin.alharammerchandisepvtltd.com/api/vehiclecat/index';

    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedData =
      json.decode(response.body) as List<dynamic>; // Map<String, dynamic>;
      print('after parsing $extractedData');
      print(extractedData);
      if (extractedData == null) {
        return false;
      }

      final List<Movies> loadedProducts = [];
      extractedData.forEach((prodData) {
        loadedProducts.add(Movies(
         PosterImage: prodData['PosterImage'],
          Name: prodData['Name'],
          ReleaseDate: prodData['ReleaseDate'],
          Adult: prodData['Adult'],
          BookButton: prodData['BookButton'],
        ));
      });
      /*
      extractedData.forEach((id, prodData) {
        loadedProducts.add(CategoryMeal(
          id: id,
          cat_id: prodData['cat_id'],
          title: prodData['title'],
          imagePath: prodData['image'],
          description: prodData['description'],
        ));
      });

       */
      print('now printing my model data');
      loadedProducts.forEach((element) {
        print(element.Name);

        print(element.PosterImage);
        print(element.Adult);
        print(element.ReleaseDate);
        print(element.BookButton);
      });
      _movs = loadedProducts;
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }
}
