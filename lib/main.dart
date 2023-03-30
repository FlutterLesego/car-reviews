import 'package:flutter/material.dart';
import 'package:json_cars/model/cars.dart';
import 'package:json_cars/views/pages/reviews_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        //
        home: ChangeNotifierProvider(
          create: (context) => CarsData(),
          builder: (context, child) {
            return const CarReviewsHome();
          },
        ));
  }
}
