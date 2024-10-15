import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:untitled6/Homepage.dart';
 // Ensure this path is correct
import 'signup.dart';   // Ensure this path is correct

void main() {
  Get.testMode = true;
  runApp(GetMaterialApp(
    home: Loginpage(),
  ));
}

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String url =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAKz3l784jmdBHJjaMNDAa1KH2lNmlnG0Y";

  Future<void> signup() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final res = await http.post(
      Uri.parse(url),
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode == 200) {
      // Successful login
      Get.to(() => Homepage());
    } else {
      // Failed login
      Get.snackbar(
        "WARNING",
        "INVALID LOGIN",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 5),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.grey,
              Colors.grey[400]!,
              Colors.grey[200]!,
              Colors.blueGrey[100]!,
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              "asset/img.png",
              height: 100,
            ),
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LOGIN PAGE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.mail, color: Colors.white),
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.white),
                hintText: "PASSWORD",
                hintStyle: TextStyle(color: Colors.black),
              ),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to Forgot Password Page (not defined here)
                    },
                    child: Text("FORGOT PASSWORD?"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: signup, // Call the signup function
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent[800],
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
