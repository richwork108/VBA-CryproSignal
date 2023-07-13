import 'package:flutter/material.dart';
import 'package:metrdev/appcolors.dart';
import 'package:metrdev/dashboard.dart';
import 'package:metrdev/requesthelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  bool is_visible = true;
  bool error = false;

  String error_text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top bar
      appBar: AppBar(
        backgroundColor: AppColor.bg,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Log In'),
      ),
      backgroundColor: AppColor.bg,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // error text
              error
                  ? Text(
                      error_text,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.main_gold,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Container(),

              error ? SizedBox(height: 20) : Container(),

              // Log in box
              Container(
                decoration: BoxDecoration(
                  color: AppColor.bg_element,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // email label
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15),
                    // email textfield
                    TextField(
                      controller: email_controller,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        filled: true,
                        fillColor: AppColor.bg_off,
                        hintText: 'you@example.com',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: AppColor.gray,
                            fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                      ),
                    ),

                    SizedBox(height: 24),

                    // password label
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15),
                    // password textfield
                    TextField(
                      obscureText: is_visible,
                      controller: password_controller,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        filled: true,
                        fillColor: AppColor.bg_off,
                        hintText: 'Not less than 8 characters',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: AppColor.gray,
                            fontWeight: FontWeight.w400),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                        suffix: null,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () => setState(() {
                            is_visible = !is_visible;
                          }),
                          icon: Icon(
                            !is_visible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColor.main_gold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 32),

                    // login button
                    InkWell(
                      onTap: () => login(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.main_gold,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 64, vertical: 18),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF131313),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // -------------------

              SizedBox(height: 24),

              // OR line
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 101,
                    color: AppColor.bg_element,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.gray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 1,
                    width: 101,
                    color: AppColor.bg_element,
                  ),
                ],
              ),

              SizedBox(height: 10),

              // social icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/flat-color-icons_google.png',
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(width: 30),
                  Image.asset(
                    'images/Vector.png',
                    width: 32,
                    height: 32,
                  ),
                ],
              ),

              SizedBox(height: 12),

              // sign up link
              RichText(
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.gray),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColor.main_gold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    if (email_controller.text.isEmpty || password_controller.text.isEmpty) {
      setState(() {
        error_text = 'Please fill in your user credentials to proceed';
        error = true;
      });
      return;
    }

    String url = 'http://vbatest.metrdev.com:2472/api/v1/signin';
    Map data = {'email': email_controller.text.trim(), 'password': password_controller.text};

    var res = await RequestHelper.getRequest(url, data);
    var result = res['message'];

    if (result == 'success') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      setState(() {
        error_text = 'Invalid User Credential!';
        error = true;
      });
    }
  }
}
