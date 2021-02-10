import 'package:flutter/material.dart';

class TF extends StatelessWidget {
  final controller;
  final keyboardType;
  final String labelText;
  final hintText;
  final suffixIcon;
  final obscureText;
  final validator;
  final radius;
  final double hintTextSize;
  final hintTextColor;
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

class Btn extends StatelessWidget {
  final double verticalMargin;
  final double horizontalMargin;
  final onTap;
  final double btnHeight;
  final double btnWidth;
  final String btnName;
  final double fontSize;
  final fontWeight;
  final txtColor;
  final btnColor;
  final borderColor;
  final double btnRadius;

  Btn(
      {Key key,
        this.verticalMargin,
        this.horizontalMargin,
        @required this.onTap,
        this.btnHeight,
        this.btnWidth,
        this.btnName,
        this.fontSize,
        this.fontWeight,
        this.txtColor,
        this.btnColor,
        this.borderColor,
        this.btnRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: btnHeight ?? height*0.08,
        width: btnWidth ?? width * 0.51,
        margin: EdgeInsets.symmetric(vertical: verticalMargin ?? 0, horizontal: horizontalMargin ?? 0),
        decoration: BoxDecoration(
          color: btnColor ?? Colors.white,
          border: Border.all(
            color: borderColor ?? Colors.blue,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(btnRadius ?? width * 0.102),
          ),
        ),
        child: GestureDetector(
          child: Center(
            child: Text(
              btnName ?? '',
              style: TextStyle(
                  fontSize: fontSize ?? height * 0.03,
                  fontWeight: fontWeight ?? FontWeight.bold,
                  color: txtColor ?? Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class RadioBtn extends StatelessWidget {
  final selectRole;
  final String role;
  RadioBtn({Key key,this.selectRole, this.role});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double _scale = 0.8;
    double _fontsize = 14;
    return GestureDetector(
      onTap: selectRole(role),
      child: Row(
        children: [
          SizedBox(
            width: 18,
            child: Transform.scale(
              scale: _scale,
              child: Radio(
                materialTapTargetSize:
                MaterialTapTargetSize.shrinkWrap,
                value: role,
                groupValue: selectRole,
                onChanged: (value) {
                  selectRole(role);
                },
              ),
            ),
          ),
          Text(
            role,
            style: TextStyle(fontSize: _fontsize),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
