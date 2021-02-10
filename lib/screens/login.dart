import 'package:flutter/material.dart';
import 'package:login_demo/common/toast.dart';
import 'package:login_demo/common/widgets.dart';
import 'package:login_demo/config/constants.dart';
import 'package:login_demo/screens/signup.dart';
import 'homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isTrue = true;

  void _isVisible() {
    setState(() {
      isTrue = !isTrue;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.18,
                  margin: EdgeInsets.only(top: height * 0.074),
                  child: Image.asset('assets/images/EClogo.png'),
                ),
                TF(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'infoclient@gmail.com',
                  labelText: 'Email ID',
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: Image.asset(
                      'assets/images/login-57.png',
                      scale: height * 0.003,
                    ),
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Please enter Email ID';
                    }
                    if (!AppConstants().validateEmail(value)) {
                      return 'Please a valid Email ID';
                    }
                    return null;
                  },
                  // obscureText: false,
                ),
                TF(
                  controller: _passwordController,
                  hintText: '**********',
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: _isVisible,
                    child: Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
                      child: Image.asset(
                        'assets/images/pwd.png',
                        scale: height * 0.003,
                      ),
                    ),
                  ),
                  obscureText: isTrue,
                  validator: (String value) {
                    print(value);
                    if (value.trim().isEmpty) {
                      return 'Please enter Password';
                    } else {
                      if (value.length < 6)
                        return 'Must be more than 5 character';
                      // if (!AppConstants().validatePassword(value))
                      // return 'Password should be contain Minimum one: 1. Upper case, 2. lowercase, 3. Numeric Number, 4. Special Character, Common Allow Character ( ! @ # \$ & * ~ ), 5. Must be more than 5 character';
                      else
                        return null;
                    }
                  },
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: width * 0.47, ),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPasswordPage()));
                    },
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(fontSize: height * 0.02),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.30,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,top: 0,
                        child: SizedBox(width: width,
                          child: Image.asset('assets/images/bottom1.png',fit: BoxFit.fill,),
                        ),
                      ),
                      Positioned(
                        left: width * 0.27,right: width * 0.27,top: height * 0.11,bottom: height * 0.11,
                        child: Btn(onTap: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage(_emailController.text, _passwordController.text)));
                              print("validation successful");
                              return {
                              //   createLoginState(_controller.text,
                            //       _controller1.text, context),
                                showToast("You are logging in..", context),
                              };
                            } else {
                              print("Please Enter Valid Email & Password");
                          }
                        },btnName: 'LOGIN',),
                      ),
                      Positioned(
                        bottom: height * 0.03,
                        left: 0,right: 0,
                        child: Row(mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                  color: Colors.white, fontSize: height * 0.02),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.red, fontSize: height * 0.02),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
