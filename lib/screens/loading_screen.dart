import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

const apiKey = '8166d2071f21e28191224c569a1af373';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  // [Tavo] - Life Cycle Method: On Component Init
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  // [Tavo] - We have to tell this function that it is going to be asynchronous
  // by adding `async` key word after the function's definition...
  void getLocationData() async {
    Location currentLocation = new Location();
    await currentLocation.getCurrentLocation();
    NetworkHelper networkHelper = new NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?units=metric&lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=$apiKey');

    // Get Data from api response
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  // [Tavo] Build gets called every time the screen gets rebuilt...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
