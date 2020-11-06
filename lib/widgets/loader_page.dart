import 'package:flutter/material.dart';
import 'package:weather_app/widgets/loader.dart';

class LoaderPage extends StatelessWidget {
  final Widget child;
  final bool busy;

  const LoaderPage({
    Key key,
    @required this.busy,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: child,
        ),
        busy
            ? Container(
                color: Colors.black.withOpacity(0.7),
                child: Loader(),
              )
            : SizedBox(),
      ],
    ));
  }
}
