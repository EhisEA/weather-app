import 'package:flutter/material.dart';
import 'package:weather_app/constants/routing_contants.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/dialog_service.dart';
import 'package:weather_app/services/navigationService.dart';

import '../../../base_view_model.dart';
import '../../../locator.dart';

class SignUpViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final _authenticationService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  signUp() async {
    final currentFormState = formKey.currentState;
    if (currentFormState.validate()) {
      setBusy(ViewModelState.Busy);
      var result = await _authenticationService.signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );

      setBusy(ViewModelState.Idle);
      if (result is bool) {
        if (result) {
          _navigationService.navigateToReplace(HomeViewRoute);
        } else {
          await _dialogService.showDialog(
            title: 'Sign Up Failure',
            description: 'General sign up failure. Please try again later',
          );
        }
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failurem',
          description: result,
        );
      }
    }
  }
}
