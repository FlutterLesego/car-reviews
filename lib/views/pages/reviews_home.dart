import 'package:flutter/material.dart';
import 'package:json_cars/model/cars.dart';
import 'package:provider/provider.dart';

import '../widgets/car_card.dart';

class CarReviewsHome extends StatelessWidget {
  const CarReviewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CarsData>().fetchCarsInfo;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Reviews'),
      ),
      body: RefreshIndicator(onRefresh: () async {
        //await will let the refresh indicator stay on the screen until data is retreived
        await context.read<CarsData>().fetchCarsInfo;
      }, child: Center(
        child: Consumer<CarsData>(
          //build an instance for CarsData class
          builder: (context, value, child) {
            return value.carsMap.isEmpty && !value.error
                //show the progress bar on the screen
                ? const CircularProgressIndicator()
                //display error message if the error is true
                : value.error
                    ? Text(
                        'Something went wrong! ${value.errorMessage}',
                        textAlign: TextAlign.center,
                      )
                    //listview for fetchCarsInfo map with values
                    : ListView.builder(
                        itemCount: value.carsMap['items'].length,
                        itemBuilder: ((context, index) {
                          return CarCard(map: value.carsMap['items'][index]);
                        }));
          },
        ),
      )),
    );
  }
}
