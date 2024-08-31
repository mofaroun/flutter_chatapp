import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/myButton.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.onTap});

  // Email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // To go to register Page

  final void Function()? onTap;

  // Login

  void login(BuildContext context) async {
    // Login Method
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
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
              MyButton(label: "Login", onTap: () => login (context),),

              // Register Text
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text("Register Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
