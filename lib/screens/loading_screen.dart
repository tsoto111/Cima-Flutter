import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    try {
      // [Tavo] - We know that the Geolocator() function call is asynchronous because it
      // uses the `await` key word before its usage...
      Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy
            .low, // low, to use a minimal amount of device resources
      );
      print(position);
    } catch (error) {
      print(error);
    }
  }

  // [Tavo] Build gets called every time the screen gets rebuilt...
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
