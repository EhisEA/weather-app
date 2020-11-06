import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/ui/authentication/components/background.dart';
import 'package:weather_app/ui/authentication/view_models/start_up_view_model.dart';
import 'package:weather_app/widgets/loader.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (model) => model.handleStartUpLogic(),
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Stack(
            children: [
              Background(),
              Container(
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.6),
                child: Loader(),
              ),
            ],
          ),
        );
      },
    );
  }
}
