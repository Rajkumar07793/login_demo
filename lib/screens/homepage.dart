import 'package:flutter/material.dart';
import 'package:login_demo/common/widgets.dart';
import 'package:login_demo/screens/login.dart';

class Homepage extends StatelessWidget {
  final email;
  final password;

  Homepage(this.email, this.password);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              email.toString(),
              style: TextStyle(fontSize: width * 0.07),
            ),
            Text(
              password.toString(),
              style: TextStyle(fontSize: width * 0.07),
            ),
            Btn(
              verticalMargin: height * 0.02,
              horizontalMargin: width * 0.05,
              btnName: 'Sign out',txtColor: Colors.white,
              fontSize: width * 0.08,btnWidth: width*0.8,borderColor: Colors.red,
              btnColor: Colors.red,
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()));
              },
            )
          ],
        ),
      ),
    );
  }
}
