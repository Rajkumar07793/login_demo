import 'package:flutter/material.dart';

class TF extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;
  final Widget suffixIcon;
  final bool obscureText;
  final String Function(String) validator;
  final double radius;
  final double hintTextSize;
  final Color hintTextColor;
  final double horizontalPadding;
  final double verticalPadding;

  TF(
      {Key key,
        this.controller,
        this.keyboardType,
        this.labelText,
        this.hintText,
        this.suffixIcon,
        this.obscureText,
        this.validator,
        this.radius,
        this.hintTextSize,
        this.hintTextColor,
        this.horizontalPadding,
        this.verticalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height*0.01),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? width*0.07,vertical: verticalPadding ?? 20),
          labelText: labelText ?? '',
          labelStyle: TextStyle(
            fontSize: height * 0.04,
            color: Colors.black,
          ),
          hintText: hintText ?? '',
          hintStyle: TextStyle(
              color: hintTextColor ?? Colors.black38, fontSize: hintTextSize ?? height * 0.02),
          suffixIcon: suffixIcon,
          errorStyle: TextStyle(height: 0.5),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? width * 0.08),
            ),
          ),),
      ),
    );
  }
}