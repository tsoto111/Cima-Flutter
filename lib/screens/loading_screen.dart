import 'package:flutter/material.dart';
import '../services/location.dart';

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
  }

  // [Tavo] Build gets called every time the screen gets rebuilt...
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
