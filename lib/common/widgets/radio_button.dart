import 'package:flutter/material.dart';

class RadioBtn extends StatelessWidget {
  final void Function() onTap;
  final String role;
  final onChanged;
  final String selectRole;
  RadioBtn({Key key,@required this.onTap,@required this.role,@required this.onChanged,@required this.selectRole});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double _scale = width*0.002;
    double _fontsize = width*0.04;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: width*0.05,
            child: Transform.scale(
              scale: _scale,
              child: Radio(
                materialTapTargetSize:
                MaterialTapTargetSize.shrinkWrap,
                value: role,
                groupValue: selectRole,
                onChanged: onChanged,
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
