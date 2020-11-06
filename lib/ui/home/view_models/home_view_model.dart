import 'package:flutter/material.dart';
import 'package:weather_app/base_view_model.dart';
import 'package:weather_app/constants/routing_contants.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/dialog_service.dart';
import 'package:weather_app/services/navigationService.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/utils/network_utils.dart';

class HomeViewModel extends BaseViewModel {
  final WeatherService _weatherService = WeatherService();
  NavigationService _navigationService = locator<NavigationService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  NetworkConfig _networkConfig = NetworkConfig();
  DialogService _dialogService = locator<DialogService>();
  final TextEditingController searchEdittingController =
      TextEditingController();
  WeatherModel weather = WeatherModel(
    weather: "rain",
    cloud: 20,
    humidity: 30,
    icon: "10d",
    locationName: "Abuja",
    maxTemp: 20,
    minTemp: 30,
    temp: 25,
    weatherDescription: "Raining",
    wind: 3,
  );

  getWeather() async {
    setBusy(ViewModelState.Busy);
    await _networkConfig.onNetworkAvailabilityDialog(_getWeatherNetworkRequest);
    setBusy(ViewModelState.Idle);
  }

  _getWeatherNetworkRequest() async {
    WeatherModel weatherResult = await _weatherService
        .getWeatherForecast(searchEdittingController.text.toLowerCase());
    if (weatherResult == null) {
      return _dialogService.showDialog(
        title: "Failed to get Weather",
        description: "no result was return for this location",
      );
    }
    weather = weatherResult;
  }

  Future<void> logOut() async {
    await _authenticationService.logOut();
    await _navigationService.navigateTo(LoginViewRoute);
  }
}
