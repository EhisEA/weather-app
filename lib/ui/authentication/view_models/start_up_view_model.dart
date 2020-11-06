import 'dart:async';

import 'package:weather_app/constants/routing_contants.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/navigationService.dart';

import '../../../base_view_model.dart';
import '../../../locator.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    bool hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    Timer(Duration(seconds: 1), () {
      //check if user exist
      if (hasLoggedInUser) {
        _navigationService.navigateToReplace(HomeViewRoute);
      } else {
        _navigationService.navigateToReplace(LoginViewRoute);
      }
    });
  }
}
