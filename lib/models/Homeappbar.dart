import 'package:flutter/material.dart';
import 'package:untitled6/login/signup/login.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.category),
            onPressed: () {
              // Handle button press
            },
          ),

          Row(
            children: [
              Center(child: const SizedBox(width: 10)),
              const Text(
                "NYSARGAA",
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white60,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(width: 10),
              MaterialButton(
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loginpage()),);
                },
                child: Text('Login'),
              )
// Reduce fixed width spacing

            ],
          ),
        ],
      ),
    );
  }
}
