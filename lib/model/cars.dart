import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class CarsData with ChangeNotifier {
  //a map that will hold the objects from JSON file
  Map<String, dynamic> _carsMap = {};
  //check if value from the internet has an error
  bool _error = false;
  //error message when there are issues with the data from the internet
  String _errorMessage = '';

  //getters
  //getter for the _cars map
  Map<String, dynamic> get carsMap => _carsMap;
  //getter for the error
  bool get error => _error;
  //getter for the _errorMessage
  String get errorMessage => _errorMessage;

  //Future is used to hold either the JSON file or an error value
  Future<void> get fetchCarsInfo async {
    //parse will convert the link into a readable format
    final response = await get(
        Uri.parse('https://dl.dropbox.com/s/m8saoxxi9fyz7lj/cars.json?dl=0'));
    // statuscode will return OK if it is 200 i.e. file was retrieved
    if (response.statusCode == 200) {
      try {
        //decode the JSON object into a map for dart
        _carsMap = jsonDecode(response.body);
        _error = false;

        //catch errors in the JSON file
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _carsMap = {};
      }
    } else {
      //if there are any internet or link issues
      _error = true;
      _errorMessage = 'error: file not found 404';
      _carsMap = {};
    }
    //notify widgets which need to implement the changes from fetchCarsInfo method
    notifyListeners();
  }

  //set initial values
  void initialValues() {
    _carsMap = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
