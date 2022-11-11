import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';

const apiKey = "29bf9920f804c742199e34ec026f9e4d";
const openWeatherURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = "$openWeatherURL?q=$cityName&appid=$apiKey&units=metric";
    NetworkManager networkManager = NetworkManager(url);
    var weatherData = await networkManager.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    LocationAndPermissions location = LocationAndPermissions();

    await location.getCurrentLocation();

    NetworkManager manageNetwork = NetworkManager(
        "$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    var weatherData = await manageNetwork.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
