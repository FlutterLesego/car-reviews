import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.map});
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 15.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //get the image key from the map
              Image.network('${map['image']}'),
              const SizedBox(height: 10),
              //get the car key from the map
              Text(
                '${map['car']}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              //get the review key from the map
              Text(
                '${map['review']}',
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10),
              //get the price key from the map
              Text(
                '${map['price']}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
