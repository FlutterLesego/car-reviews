import 'package:flutter/material.dart';
import 'package:json_cars/routes/route_manager.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.map});
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, RouteManager.carReviewsDetails);
            },
            leading: Text(
              '${map['car']}',
              style:
                  const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
            ),
            trailing: Text(
              '${map['price']}',
              style:
                  const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }
}
