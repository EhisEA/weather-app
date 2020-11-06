import 'package:flutter/material.dart';
import 'package:weather_app/utils/size_config.dart';

class MaxMinTempInfoWidget extends StatelessWidget {
  final String maxTemp;
  final String minTemp;

  const MaxMinTempInfoWidget({Key key, this.maxTemp, this.minTemp})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: getProportionatefontSize(110),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_upward, color: Colors.white),
              Column(
                children: [
                  Text(
                    "Max temp",
                    style: TextStyle(fontSize: getProportionatefontSize(17)),
                  ),
                  Text(
                    "$maxTemp°",
                    style: TextStyle(
                      fontSize: getProportionatefontSize(26),
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(color: Colors.white),
          Row(
            children: [
              Icon(Icons.arrow_downward, color: Colors.white),
              Column(
                children: [
                  Text(
                    "Min Temp",
                    style: TextStyle(fontSize: getProportionatefontSize(17)),
                  ),
                  Text(
                    "$minTemp°",
                    style: TextStyle(
                      fontSize: getProportionatefontSize(26),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
