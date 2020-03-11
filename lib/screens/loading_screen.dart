import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // [Tavo] - Life Cycle Method: On Component Init
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  // [Tavo] - We have to tell this function that it is going to be asynchronous
  // by adding `async` key word after the function's definition...
  void getLocation() async {
    Location currentLocation = new Location();
    await currentLocation.getCurrentLocation();
    print(currentLocation.latitude);
    print(currentLocation.longitude);
    getData();
  }

  Future<void> getData() async {
    http.Response currentWeather = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    print(currentWeather.statusCode);
    if (currentWeather.statusCode == 200) {
      String data = currentWeather.body;
      print(currentWeather.body);
    } else {
      print(currentWeather.statusCode);
    }
  }

  // [Tavo] Build gets called every time the screen gets rebuilt...
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
