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
    if (currentFormState.validate()) {
      setBusy(ViewModelState.Busy);
      var result = await _authenticationService.loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
      );

      setBusy(ViewModelState.Idle);
      if (result is bool) {
        if (result) {
          _navigationService.navigateToReplace(HomeViewRoute);
        } else {
          await _dialogService.showDialog(
            title: 'Login Up Failure',
            description: 'General Login failure. Please try again later',
          );
        }
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: result,
        );
      }
    }
  }

  void toSignUp() {
    _navigationService.navigateToReplace(SignUpViewRoute);
  }
}
