import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ViewModelState { Busy, Idle }

class BaseViewModel extends ChangeNotifier {
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();

  // UserModel get currentUser => _authenticationService.currentUser;

  ViewModelState _state = ViewModelState.Idle;
  final moneyFormat = NumberFormat('#,###,###,###.00', 'en_US');

  ViewModelState get state => _state;
  bool get isBusy => _state == ViewModelState.Busy;

  setBusy(ViewModelState currentState) {
    _state = currentState;
    notifyListeners();
  }
}
