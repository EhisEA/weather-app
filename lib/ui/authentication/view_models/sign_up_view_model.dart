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
    // validate Sign up form
    if (currentFormState.validate()) {
      setBusy(ViewModelState.Busy);
      // make Sign up network call
      var result = await _authenticationService.signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );

      setBusy(ViewModelState.Idle);
      // check sign up result
      if (result is bool) {
        if (result) {
          // if sign up  is successful go to home page
          _navigationService.navigateToReplace(HomeViewRoute);
        } else {
          // if sign up  is unsuccessful show error
          await _dialogService.showDialog(
            title: 'Sign Up Failure',
            description: 'General sign up failure. Please try again later',
          );
        }
      } else {
        // if Sign up result is not bool
        //it means the error is from the server
        await _dialogService.showDialog(
          title: 'Sign Up Failurem',
          description: result,
        );
      }
    }
  }

  toLogin() {
    // go to login view
    _navigationService.navigateToReplace(LoginViewRoute);
  }
}
