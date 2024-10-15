import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:untitled6/login/signup/login.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final url =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAKz3l784jmdBHJjaMNDAa1KH2lNmlnG0Y";

  Future<void> Signup() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    print(email);
    print(password);
    final res = await http.post(
      Uri.parse(url),
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print(res.statusCode);

    if (res.statusCode == 200) {
      Get.snackbar(
        "SIGN UP",
        "SUCCESSFUL",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
      Get.to(() => Loginpage());
    } else {
      Get.snackbar(
        "WARNING",
        "INVALID SIGNUP",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left half of the screen
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.grey[800] ?? Colors.grey,
                    Colors.grey[400]!,
                    Colors.grey[200]!,
                    Colors.grey[100]!,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "img.png", // Correct the asset path here
                    height: 100.0,
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    "SIGNUP PAGE",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 50.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail, color: Colors.white),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline, color: Colors.white),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: Signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent[800],
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Loginpage()); // Navigate to the Login page
                    },
                    child: Text(
                      "Already have an account? Login here",
                      style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right half of the screen (optional, can add content or leave empty)
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black, // You can add any content or leave it empty
            ),
          ),
        ],
      ),
    );
  }
}
