import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/ui/authentication/components/auth_text_field.dart';
import 'package:weather_app/ui/authentication/components/background.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Container(
            color: Colors.black.withOpacity(0.6),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                    child: SvgPicture.asset(
                  "assets/svgs/weather_svg1.svg",
                  color: Colors.teal,
                )),
                Text(
                  "Weather App",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                AuthTextField(),
                SizedBox(height: 20),
                AuthTextField(),
                SizedBox(height: 20),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  color: Colors.teal,
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
                Text("Don't have an account?"),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
