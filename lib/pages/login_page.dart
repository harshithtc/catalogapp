import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/main.dart'; // import to access `api`
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => changeButton = true);

    try {
      // 🔑 Call backend API
      final token = await api.login(email: email, password: password);

      // ✅ Save token for authenticated requests
      api.setToken(token);

      // (Optional) Save to flutter_secure_storage here

      if (!mounted) return;
      await Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
    } catch (e) {
      // Show error
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login failed: $e")));
    } finally {
      setState(() => changeButton = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D1B2A), Color(0xFF1B263B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Login Card
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    width: size.width * 0.9,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Logo
                          Image.asset(
                            "assets/images/inventra4_logo.png",
                            height: 120,
                          ),
                          const SizedBox(height: 20),

                          // Username
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: _inputDecoration(
                              "Username",
                              Icons.person,
                            ),
                            onChanged: (val) => email = val,
                            validator: (value) => value == null || value.isEmpty
                                ? "Please enter the username"
                                : null,
                          ),
                          const SizedBox(height: 20),

                          // Password
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: _inputDecoration(
                              "Password",
                              Icons.lock,
                            ),
                            onChanged: (val) => password = val,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter the password";
                              } else if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),

                          // Login Button
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            width: changeButton ? 60 : size.width * 0.6,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF5F5DC), Colors.white],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(
                                changeButton ? 30 : 20,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: _handleLogin, // 🔑 Replaced with API call
                              borderRadius: BorderRadius.circular(25),
                              child: Center(
                                child: changeButton
                                    ? const Icon(
                                        Icons.done,
                                        color: Color(0xFF0D1B2A),
                                      )
                                    : Text(
                                        "Login",
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF0D1B2A),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Signup Option
                          Text(
                            "Don’t have an account? Sign up",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.white),
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: const Color.fromRGBO(255, 255, 255, 0.12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: const BorderSide(color: Color(0xFFF5F5DC)),
      ),
    );
  }
}
