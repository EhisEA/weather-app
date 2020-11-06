import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_app/ui/authentication/components/auth_text_field.dart';
import 'package:weather_app/ui/authentication/components/background.dart';
import 'package:weather_app/ui/authentication/view_models/login_view_model.dart';
import 'package:weather_app/widgets/loader_page.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, _) {
          return LoaderPage(
            busy: model.isBusy,
            child: Scaffold(
              body: Stack(
                children: [
                  Background(),
                  Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.6),
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: model.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                height: 120,
                                child: SvgPicture.asset(
                                  "assets/svgs/weather_svg1.svg",
                                  color: Colors.teal,
                                )),
                            Text(
                              "Weather App",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.teal),
                            ),
                            SizedBox(height: 20),
                            AuthTextField(
                              name: "email",
                              keyboardType: TextInputType.emailAddress,
                              controller: model.emailController,
                            ),
                            SizedBox(height: 20),
                            AuthTextField(
                              name: "password",
                              isPassword: true,
                              controller: model.passwordController,
                            ),
                            SizedBox(height: 20),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: model.login,
                              color: Colors.teal,
                              child: Text("Login",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Text("Don't have an account?"),
                            InkWell(
                              onTap: model.toSignUp,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
