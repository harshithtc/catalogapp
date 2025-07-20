import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(
            "welcome",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "enter password",
                    labelText: "password",
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                  child: Text("login"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
