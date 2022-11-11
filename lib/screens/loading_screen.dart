import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    this.getLocationData();
    super.initState();

    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   checkLocationService();
    // });
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    print(weatherData);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        },
      ),
    );
  }

  // checkLocationService() {
  //   if (LocationAndPermissions().checkLocationEnabled() == false) {
  //     return showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text("Location service"),
  //         content: Text(
  //             "Location services are disabled. Open your phone's Settings app. Under \"Personal,\" tap Location access. At the top of the screen, turn Access to my location on."),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                textAlign: TextAlign.center,
                "Checking the weather in your location ...",
                style: kLoadingTextStyle,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitFadingCube(
              color: Colors.white,
              size: 60,
            ),
          ],
        ),
      ),
    );
  }
}
