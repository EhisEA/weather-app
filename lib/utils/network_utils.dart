import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../services/dialog_service.dart';

import '../locator.dart';

class NetworkConfig {
  final DialogService _dialogService = locator<DialogService>();

// =================================================
// =================================================
// =================================================
// =================================================
// =================================================
// =================================================
  // check if the device has a network connection
  _networkAvailable() async {
    try {
      // make a call to google to
      var result = await http.get('https://www.google.com');

      // if there is a result return true to indicate there is a connection
      if (result.statusCode == 200) {
        return true;
      }
    } catch (_) {
      // return false if there is no result to indicate
      // there is no network
      return false;
    }
    return false;
  }

// =================================================
// =================================================
// =================================================
// =================================================
// =================================================
// =================================================
  // run a function if there is network or display
  // a dialog showing there is no network conection
  onNetworkAvailabilityDialog(Function onNetwork) async {
    // if network  is available run the function [onNetwork]
    if (await _networkAvailable()) {
      await onNetwork();
    } else {
      // if network isn't available show a dialog
      await _dialogService.showDialog(
        title: 'No network connection',
        description: 'Please connect to the internet',
      );
    }
  }

// =================================================
// =================================================
// =================================================
// =================================================
// =================================================
// =================================================
  // run a function if there is network or display
  // a toast showing there is no network conection
  onNetworkAvailabilityToast(Function onNetwork) async {
    if (await _networkAvailable()) {
      // if network  is available run the function [onNetwork]
      onNetwork();
    } else {
      // if network isn't available show a Toast
      Fluttertoast.showToast(
          msg: "No Internet connection",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

// =================================================
// =================================================
// =================================================
// =================================================
// =================================================
// =================================================
  // run a function if there is network
  // and return a boolean in respect to it
  // result
  onNetworkAvailabilityBool() async {
    if (await _networkAvailable()) {
      // if network  is available run the function [onNetwork]
      return true;
    } else {
      // if network isn't available return boolean
      return false;
    }
  }
}
