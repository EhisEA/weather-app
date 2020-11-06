import 'package:flutter/material.dart';
import 'package:weather_app/utils/size_config.dart';

class ComponentInfoWidget extends StatelessWidget {
  final String name;
  final String value;
  final String rate;
  final double percentage;

  const ComponentInfoWidget({
    Key key,
    @required this.name,
    @required this.value,
    @required this.rate,
    @required this.percentage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Text(
          "$name",
          style: TextStyle(
            fontSize: getProportionatefontSize(15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "$value",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionatefontSize(23),
            ),
          ),
        ),
        Text(
          "$rate",
          style: TextStyle(
            fontSize: getProportionatefontSize(13),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        CircularProgressIndicator(
          value: percentage,
          backgroundColor: Colors.black.withOpacity(0.3),
          valueColor: AlwaysStoppedAnimation(Colors.red),
        )
      ],
    );
  }
}
