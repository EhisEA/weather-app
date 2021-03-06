import 'package:flutter/material.dart';
import 'package:weather_app/base_view_model.dart';
import 'package:weather_app/constants/routing_contants.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/dialog_service.dart';
import 'package:weather_app/services/navigationService.dart';

import '../../../locator.dart';

class LoginViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final _authenticationService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  login() async {
    final currentFormState = formKey.currentState;
    // validate login form
    if (currentFormState.validate()) {
      setBusy(ViewModelState.Busy);
      // make login network call
      var result = await _authenticationService.loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
      );

      setBusy(ViewModelState.Idle);
      // check login result
      if (result is bool) {
        if (result) {
          // if login is successful go to home page
          _navigationService.navigateToReplace(HomeViewRoute);
        } else {
          // if login is unsuccessful show error

          await _dialogService.showDialog(
            title: 'Login Up Failure',
            description: 'General Login failure. Please try again later',
          );
        }
      } else {
        // if login result is not bool
        //it means the error is from the server
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: result,
        );
      }
    }
  }

  void toSignUp() {
    // go to sign up view
    _navigationService.navigateToReplace(SignUpViewRoute);
  }
}
