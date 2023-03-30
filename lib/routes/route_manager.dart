import 'package:flutter/material.dart';

import '../views/pages/reviews_details.dart';
import '../views/pages/reviews_home.dart';

class RouteManager {
  static const String carReviewsHome = '/';
  static const String carReviewsDetails = '/carReviewsDetails';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //route for home page
      case carReviewsHome:
        return MaterialPageRoute(
          builder: (context) => const CarReviewsHome(),
        );

      //route for details page
      case carReviewsDetails:
        return MaterialPageRoute(
            builder: (context) => const CarReviewsDetails());

      default:
        throw Exception("No route found!");
    }
  }
}
