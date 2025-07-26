import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome() async {
    if (_formkey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      if (!mounted) return;
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset("assets/images/shoppingcart1.png", fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Catalog",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 5,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "enter username",
                        labelText: "username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter the username";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "enter password",
                        labelText: "password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter the password";
                        } else if (value.length < 8) {
                          return "password must be 8 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                        changeButton ? 50 : 8,
                      ),

                      child: InkWell(
                        onTap: () => moveToHome(),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,

                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
