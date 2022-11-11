import 'package:geolocator/geolocator.dart';

class LocationAndPermissions {
  late double latitude;
  late double longitude;

  Future getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        print("10");

        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        print(position.longitude);

        print("11");
        this.latitude = position.latitude;
        this.longitude = position.longitude;
        print("pass");
      } else {
        latitude = 30.033333;
        longitude = 31.233334;
      }
    } catch (e) {
      print(e);
    }
  }
}
