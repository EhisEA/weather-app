import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/ui/authentication/login.dart';
import 'package:weather_app/ui/home/home_view.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'router.dart';
import 'services/dialog_service.dart';
import 'services/navigationService.dart';

void main() {
  setupLocator(); //*====registaring get_it
  return runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
  // MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
        )),
        builder: (context, child) {
          var dialogService = locator<DialogService>();
          return DevicePreview.appBuilder(context, child);
          // return Navigator(
          //   key: dialogService.dialogNavigationKey,
          //   onGenerateRoute: (settings) => MaterialPageRoute(
          //       builder: (context) => DialogManager(child: child)),
          // );
        },
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
        home: LoginView());
  }
}
