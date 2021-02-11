import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final double verticalMargin;
  final double horizontalMargin;
  final void Function() onTap;
  final double btnHeight;
  final double btnWidth;
  final String btnName;
  final double fontSize;
  final FontWeight fontWeight;
  final Color txtColor;
  final Color btnColor;
  final Color borderColor;
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