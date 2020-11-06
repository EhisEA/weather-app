import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) validate;
  final String name;

  const AuthTextField({
    Key key,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validate,
    @required this.name,
  }) : super(key: key);

  AuthTextFieldState createState() => AuthTextFieldState();
}

class AuthTextFieldState extends State<AuthTextField> {
  bool obscure;
  void togglePasswordVisibility() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  void initState() {
    obscure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value.isEmpty) return "${widget.name} cannot be empty";
        if (widget.validate != null) return widget.validate(value);
        return null;
      },
      keyboardType: widget.keyboardType,
      obscureText: obscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 20,
          ),
          hintText: widget.name,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          isDense: true,
          focusColor: Colors.teal,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.teal,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.red,
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
          suffixIcon: !widget.isPassword
              ? SizedBox()
              : obscure
                  ? InkWell(
                      onTap: togglePasswordVisibility,
                      child: Icon(
                        Icons.visibility,
                      ),
                    )
                  : InkWell(
                      onTap: togglePasswordVisibility,
                      child: Icon(
                        Icons.visibility_off,
                      ),
                    ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 40,
            maxWidth: 40,
            minHeight: 40,
            minWidth: 40,
          )),
    );
  }
}
