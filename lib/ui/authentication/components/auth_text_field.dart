import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {


bool isPassword;
TextEditingController controller;
TextInputType keyboardType;
Function (String) validate;
String name;

AuthTextFieldState createState=>AuthTextFieldState();
}

class AuthTextFieldState extends State<AuthTextField>{
bool obscure;
  @override
  Widget build(BuildContext context) {
Obscure=widget.isPassword;
    return TextFormField(
controller: widget.controller,
Validate:(value){
If(value.isEmpty()) return "${widget.name} cannot be empty";
return Widget.validate();
},
obscureText:widget.isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusColor: Colors.teal,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.teal,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.teal,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}
