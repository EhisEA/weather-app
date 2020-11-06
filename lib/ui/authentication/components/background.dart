import 'package:flutter/material.dart';

List<String> images = [
  "assets/images/rain_background.jpg",
  "assets/images/atmosphere_background.jpg",
  "assets/images/clouds_background.jpg",
  "assets/images/drizzle_background.jpg",
  "assets/images/snow_background.jpg",
  "assets/images/clear_background.jpg",
  "assets/images/thunderstorm_background.jpg",
];

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: List.generate(
          7,
          (index) => Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        images[index],
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}
