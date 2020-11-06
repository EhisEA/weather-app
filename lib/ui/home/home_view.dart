import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/ui/home/components/max_min_temp_info_widget.dart';
import 'package:weather_app/ui/home/view_models/home_view_model.dart';
import 'package:weather_app/utils/size_config.dart';
import 'package:weather_app/widgets/loader_page.dart';

import 'components/component_info_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    SizeConfig().init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, _) {
        return LoaderPage(
          busy: model.isBusy,
          child: Scaffold(
            body: Stack(
              children: [
                // ===================== Background ++++++++++++++
                // ===================== Background ++++++++++++++
                // ===================== Background ++++++++++++++
                // ===================== Background ++++++++++++++
                // ===================== Background ++++++++++++++
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/${model.weather.weather}_background.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.black.withOpacity(0.4),
                  child: SafeArea(
                    child: isPortrait
                        ? content(context, isPortrait, model)
                        : SingleChildScrollView(
                            child: content(context, isPortrait, model),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  content(context, bool isPortrait, HomeViewModel model) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===================== Header ++++++++++++++
        // ===================== Header ++++++++++++++
        // ===================== Header ++++++++++++++
        // ===================== Header ++++++++++++++
        // ===================== Header ++++++++++++++
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.white,
                size: 40,
              ),
              onPressed: model.logOut,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                controller: model.searchEdittingController,
                decoration: InputDecoration(
                  hintText: "Search for places e.g london",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 40,
              ),
              onPressed: model.getWeather,
            ),
          ],
        ),
        SizedBox(height: 60),
        // ===================== Body ++++++++++++++
        // ===================== Body ++++++++++++++
        // ===================== Body ++++++++++++++
        // ===================== Body ++++++++++++++
        // ===================== Body ++++++++++++++
        Text(
          model.weather.locationName,
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
                  "${model.weather.temp}°",
                  style: TextStyle(
                    fontSize: getProportionatefontSize(50),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/${model.weather.icon}.png",
                      scale: 3,
                      color: Colors.white,
                    ),
                    SizedBox(width: 3),
                    Container(
                      width: width - 140 - getProportionateScreenWidth(100),
                      child: Text(
                        model.weather.weatherDescription,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: getProportionatefontSize(16),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            MaxMinTempInfoWidget(
              maxTemp: model.weather.maxTemp.toString(),
              minTemp: model.weather.minTemp.toString(),
            )
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
            ComponentInfoWidget(
              name: "wind",
              percentage: model.weather.wind / 32.7,
              rate: "m/s",
              value: model.weather.wind.toString(),
            ),
            ComponentInfoWidget(
              name: "cloud",
              percentage: model.weather.cloud / 100,
              rate: "%",
              value: model.weather.cloud.toString(),
            ),
            ComponentInfoWidget(
              name: "Humidity",
              percentage: model.weather.humidity / 32.7,
              rate: "%",
              value: model.weather.humidity.toString(),
            ),
          ],
        )
      ],
    );
  }
}
