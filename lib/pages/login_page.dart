import 'package:chat_app/components/myButton.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.onTap});

  
  // Email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // To go to register Page

  final void Function()? onTap;
 

  // Login

  void login() {
    // Login Method
    print("Clicked Login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              // Welcome Back Message
              const SizedBox(height: 25),

              Text(
                "Welcome Back, we missed you!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 15),

              // Email
              MyTextField(
                hintText: "Email",
                pw: false,
                controller: _emailController,
              ),

              const SizedBox(height: 15),
              // Password

              MyTextField(
                hintText: "Password",
                pw: true,
                controller: _passwordController,
              ),

              const SizedBox(height: 30),
              // Login Button
              MyButton(label: "Login", onTap: login),

              // Register Text
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
