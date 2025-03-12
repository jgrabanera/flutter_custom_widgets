// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:custom_widgets/library.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormsContainer extends StatelessWidget {
  const FormsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 25,
            children: <Widget>[
              const LoginForm(),
              const RegistrationForm(),
            ],
          ),
        ),
      ),
    );
  }
}

//LOGIN
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isHidden = true;
  final _formKey = GlobalKey<FormState>();

  Map<String, bool> isLoadingMap = {};

  void setLoading(String key, bool value) {
    // Update loading state for specific button
    setState(() {
      isLoadingMap[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 600;
      return Container(
        padding: EdgeInsets.all(15),
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Login Form',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Container(
              // height: 500,
              width: isMobile ? double.maxFinite : 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    spreadRadius: 4,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(25),
                //color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 25),
                          Image.asset('assets/ww_logo.jpg', width: 250),
                          const SizedBox(height: 25),
                          Text(
                            "SIGN IN TO CONTINUE",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: 300,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: <Widget>[
                            TextFormField(
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 16,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: isMobile ? 14 : 16),
                                hintText: 'username',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                // if (_formKey.currentState!.validate()) {
                                //   _formKey.currentState!.save();
                                //   loginSubmit();
                                // }
                              },
                              onSaved: (value) {
                                //  _name = value;
                              },
                            ),
                            const SizedBox(height: 10),
                            //Password
                            TextFormField(
                              style: TextStyle(fontSize: isMobile ? 14 : 16),
                              obscureText: isHidden,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isHidden = !isHidden;
                                    });
                                  },
                                ),
                                fillColor: Colors.grey[100],
                                filled: true,

                                //  errorText: errMessage,
                                hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: isMobile ? 14 : 16),
                                hintText: 'password',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                // if (_formKey.currentState!.validate()) {
                                //   _formKey.currentState!.save();
                                //   loginSubmit();
                                // }
                              },
                              onSaved: (value) {
                                //  _name = value;
                              },
                            ),
                            //Button
                            const SizedBox(height: 15),
                            LoginBtn(
                              isLoading: isLoadingMap["login"] ?? false,
                              customIcon: isLoadingMap["login"] ?? false
                                  ? LoadingIndicator()
                                  : Icon(Icons.login_rounded,
                                      color: Colors.white),
                              customColor: Colors.black87,
                              onPress: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  setLoading("login", true);
                                  await Future.delayed(Duration(seconds: 1));
                                  if (mounted) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginForm()));
                                  }
                                  setLoading("login", false);
                                  // loginSubmit();
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "OR",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.black87,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.black87,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.xTwitter,
                                    color: Colors.black87,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Divider(
                              color: Colors.black54,
                              thickness: 1,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 12),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Register ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                      fontFamily: 'Poppins',
                                    ),
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () {
                                    //     Navigator.pop(context);
                                    //     showDialog(
                                    //       context: context,
                                    //       builder: (context) =>
                                    //           RegistrationForm(),
                                    //     );
                                    //   },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

//REGISTRATION
class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool isHidden = true;
  final _formKey = GlobalKey<FormState>();

  Map<String, bool> isLoadingMap = {};

  String? _errEmailMsg, _errPwdMsg, _email, _name, _password, _confirmPassword;

  void setLoading(String key, bool value) {
    // Update loading state for specific button
    setState(() {
      isLoadingMap[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 600;
      return Container(
        padding: EdgeInsets.all(15),
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Registration Form',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Container(
              // height: 500,
              width: isMobile ? double.maxFinite : 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    spreadRadius: 4,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Container(
                // width: isMobile ? double.maxFinite : 600,
                padding: EdgeInsets.all(25),
                //color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 25),
                          Image.asset('assets/ww_logo.jpg', width: 250),
                          const SizedBox(height: 25),
                          Text(
                            "SIGN UP",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: 300,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: <Widget>[
                            TextFormField(
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 16,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: isMobile ? 14 : 16),
                                hintText: 'your name',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                // if (_formKey.currentState!.validate()) {
                                //   _formKey.currentState!.save();
                                //   loginSubmit();
                                // }
                              },
                              onSaved: (value) {
                                //  _name = value;
                              },
                            ),
                            const SizedBox(height: 10),

                            //Email
                            TextFormField(
                              style: TextStyle(fontSize: isMobile ? 14 : 16),
                              decoration: InputDecoration(
                                errorText: _errEmailMsg,
                                prefixIcon: Icon(
                                  Icons.email_rounded,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: isMobile ? 14 : 16),
                                hintText: 'email',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email address';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                // if (_formKey.currentState!.validate()) {
                                //   _formKey.currentState!.save();
                                //   loginSubmit();
                                // }
                              },
                              onSaved: (value) {
                                _email = value;
                              },
                            ),
                            const SizedBox(height: 10),

                            //Password
                            TextFormField(
                              style: TextStyle(fontSize: isMobile ? 14 : 16),
                              obscureText: isHidden,
                              decoration: InputDecoration(
                                errorText: _errPwdMsg,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isHidden = !isHidden;
                                    });
                                  },
                                ),
                                fillColor: Colors.grey[100],
                                filled: true,

                                //  errorText: errMessage,
                                hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: isMobile ? 14 : 16),
                                hintText: 'password',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                // if (_formKey.currentState!.validate()) {
                                //   _formKey.currentState!.save();
                                //   loginSubmit();
                                // }
                              },
                              onSaved: (value) {
                                _password = value;
                              },
                            ),
                            SizedBox(height: 10),

                            //Confirm Password
                            TextFormField(
                              style: TextStyle(fontSize: isMobile ? 14 : 16),
                              obscureText: isHidden,
                              decoration: InputDecoration(
                                errorText: _errPwdMsg,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isHidden = !isHidden;
                                    });
                                  },
                                ),
                                fillColor: Colors.grey[100],
                                filled: true,

                                //  errorText: errMessage,
                                hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: isMobile ? 14 : 16),
                                hintText: 'confirm password',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please re-enter your password';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                // if (_formKey.currentState!.validate()) {
                                //   _formKey.currentState!.save();
                                //   loginSubmit();
                                // }
                              },
                              onSaved: (value) {
                                _confirmPassword = value;
                              },
                            ),

                            //Button
                            const SizedBox(height: 15),
                            LoginBtn(
                              customText: 'REGISTER',
                              isLoading: isLoadingMap["register"] ?? false,
                              customIcon: isLoadingMap["register"] ?? false
                                  ? LoadingIndicator()
                                  : Icon(Icons.app_registration_outlined,
                                      color: Colors.white),
                              customColor: Colors.black87,
                              onPress: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  if (_confirmPassword != _password) {
                                    setState(() {
                                      _errPwdMsg = 'Passwords do not match';
                                    });
                                    return;
                                  } else {
                                    setState(() {
                                      _errPwdMsg = null;
                                    });
                                  }
                                  if (!EmailValidator.validate(_email!)) {
                                    setState(() {
                                      _errEmailMsg = 'Invalid email address';
                                    });
                                    return;
                                  } else {
                                    setState(() {
                                      _errEmailMsg = null;
                                    });
                                  }

                                  setLoading("register", true);
                                  await Future.delayed(Duration(seconds: 1));
                                  // if (mounted) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const LoginForm()));
                                  // }
                                  setLoading("register", false);
                                  // loginSubmit();
                                }
                              },
                            ),
                            const SizedBox(height: 10),

                            Divider(
                              color: Colors.black54,
                              thickness: 1,
                            ),
                            const SizedBox(height: 15),
                            RichText(
                              text: TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 12),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Login ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                      fontFamily: 'Poppins',
                                    ),
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () {
                                    //     Navigator.pop(context);
                                    //     showDialog(
                                    //       context: context,
                                    //       builder: (context) =>
                                    //           RegistrationForm(),
                                    //     );
                                    //   },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 14,
      height: 14,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}
