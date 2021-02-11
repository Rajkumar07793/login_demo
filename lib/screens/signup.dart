import 'package:login_demo/common/index.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isTrue = true;
  String selectRole = 'Admin';

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
    _contactController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: height * 0.14,
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Image.asset(
                      'assets/images/EClogo.png',fit: BoxFit.fill,
                    ),
                  ),
                  TF(
                    verticalPadding: height * 0.01,
                    controller: _firstNameController,
                    labelText: 'First Name',
                    hintText: 'Enter your name',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
                      child: Image.asset(
                        'assets/images/person.png',
                        scale: 2.5,
                      ),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  TF(
                    verticalPadding: height * 0.01,
                    controller: _lastNameController,
                    labelText: 'Last Name',
                    hintText: 'Enter your last name',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
                      child: Image.asset(
                        'assets/images/person.png',
                        scale: 2.5,
                      ),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  TF(
                    verticalPadding: height * 0.01,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'infoclient@gmail.com',
                    labelText: 'Email ID',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
                      child: Image.asset(
                        'assets/images/login-57.png',
                        scale: 2.5,
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
                    verticalPadding: height * 0.01,
                    controller: _passwordController,
                    hintText: '**********',
                    labelText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: _isVisible,
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.04),
                        child: Image.asset(
                          'assets/images/pwd.png',
                          scale: 2.5,
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
                  TF(
                    keyboardType: TextInputType.phone,
                    verticalPadding: height * 0.01,
                    controller: _contactController,
                    labelText: 'Contact',
                    hintText: 'Enter your number',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
                      child: Image.asset(
                        'assets/images/person.png',
                        scale: 2.5,
                      ),
                    ),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.03,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioBtn(
                          onTap: () {
                            setState(() {
                              selectRole = 'Admin';
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              selectRole = value;
                            });
                          },
                          role: 'Admin',
                          selectRole: selectRole,
                        ),
                        RadioBtn(
                          onTap: () {
                            setState(() {
                              selectRole = 'Service Provider';
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              selectRole = value;
                            });
                          },
                          role: 'Service Provider',
                          selectRole: selectRole,
                        ),
                        RadioBtn(
                          onTap: () {
                            setState(() {
                              selectRole = 'Vendor';
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              selectRole = value;
                            });
                          },
                          role: 'Vendor',
                          selectRole: selectRole,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.24,
                    width: width,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          // bottom: 0,
                          child: SizedBox(
                              // height: height * 0.30,
                              width: width,
                              child: Image.asset(
                                'assets/images/bottom1.png',
                                fit: BoxFit.fill,
                              )),
                        ),
                        Positioned(
                          left: width * 0.27,
                          right: width * 0.27,
                          top: height * 0.08,
                          bottom: height * 0.08,
                          // padding: EdgeInsets.fromLTRB(width * 0.27, height * 0.12,
                          //     width * 0.26, height * 0.08),
                          child: Btn(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                print("validation successful");
                                return {
                                  // createSignUpState(
                                  //     _firstname.text,
                                  //     _lastname.text,
                                  //     _email.text,
                                  //     _password.text,
                                  //     selectRole,
                                  //     _contact.text,
                                  //     context),
                                  showToast(
                                      "We are creating your account..", context)
                                };
                              } else {
                                print("Please Enter Valid Details");
                              }
                            },
                            btnName: 'Sign Up',
                          ),
                        ),
                        Positioned(
                          bottom: height * 0.03,
                          left: 0, right: 0,
                          // top: height * 0.28,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Do have an already account? ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.02),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: height * 0.02),
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
      ),
    );
  }
}
