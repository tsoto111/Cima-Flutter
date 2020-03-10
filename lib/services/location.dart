import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  // [Tavo] - We have to tell this function that it is going to be asynchronous
  // by adding `async` key word after the function's definition...
  Future<void> getCurrentLocation() async {
    try {
      // [Tavo] - We know that the Geolocator() function call is asynchronous because it
      // uses the `await` key word before its usage...
      Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy
            .low, // low, to use a minimal amount of device resources
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (error) {
      print(error);
    }
  }
}
