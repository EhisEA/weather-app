import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/utils/size_config.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    SizeConfig().init(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/rain_background.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.black.withOpacity(0.4),
          child: SafeArea(
              child: isPortrait
                  ? content(context, isPortrait)
                  : SingleChildScrollView(
                      child: content(context, isPortrait),
                    )),
        )
      ],
    ));
  }

  content(context, isPortrait) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration:
                    InputDecoration(fillColor: Colors.white, filled: true),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                print("ff");
                WeatherService().getWeatherForecast("");
              },
            ),
          ],
        ),
        SizedBox(height: 60),
        Text(
          "Abuja",
          style: TextStyle(
            fontSize: getProportionatefontSize(50),
          ),
        ),
        Text(
          "${DateFormat.jm().format(DateTime.now())} - ${DateFormat("EEEE, dd MMMM").format(DateTime.now())}",
          style: TextStyle(
            fontSize: getProportionatefontSize(16),
          ),
        ),
        isPortrait ? Spacer() : SizedBox(height: 40),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "20°",
                  style: TextStyle(
                    fontSize: getProportionatefontSize(50),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/11n.png",
                      scale: 3,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: width - 140 - getProportionateScreenWidth(100),
                      child: Text(
                        "thunderstorm with heavy drizzle ",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: getProportionatefontSize(14),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            r(context)
          ],
        ),
        isPortrait ? Spacer() : SizedBox(height: 40),
        // ===================== FOOTER ++++++++++++++
        // ===================== FOOTER ++++++++++++++
        // ===================== FOOTER ++++++++++++++
        // ===================== FOOTER ++++++++++++++
        // ===================== FOOTER ++++++++++++++
        Divider(
          color: Colors.white,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            d("wind", (2.1) / 32.7, "m/s", "2.1", context),
            d("cloud ", 15 / 100, "%", "15", context),
            d("Humidity", 13, "%", "32", context)
          ],
        )
      ],
    );
  }

  r(context) {
    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
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
                    style: TextStyle(fontSize: getProportionatefontSize(17)
                        // fontSize: getProportionateScreenWidth(60),
                        ),
                  ),
                  Text(
                    "20°",
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
                    "Min temp",
                    style: TextStyle(fontSize: getProportionatefontSize(17)),
                  ),
                  Text(
                    "20°",
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

  d(String name, double percentage, String rate, String value, context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Text(
          "$name",
          style: TextStyle(
            // fontWeight: FontWeight.bold,
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
            // fontWeight: FontWeight.bold,
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
