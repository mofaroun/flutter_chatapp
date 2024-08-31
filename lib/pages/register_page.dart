import "package:chat_app/services/auth/auth_service.dart";
import "package:chat_app/components/myButton.dart";
import "package:chat_app/components/my_textfield.dart";
import "package:flutter/material.dart";

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  RegisterPage({super.key, this.onTap});

  final void Function()? onTap;

  void register(BuildContext context) {
    // get Auth Service

    final _auth = AuthService();

    // Passwords match -> make user
    if (_passwordController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }

      // Passwords dont match
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords do not match"),
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
                "Let's create an account for you!",
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

              const SizedBox(height: 15),
              // Password

              MyTextField(
                hintText: "Confirm Password",
                pw: true,
                controller: _confirmPwController,
              ),

              const SizedBox(height: 30),
              // Login Button
              MyButton(label: "Register", onTap: () => register(context)),

              // Register Text
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text("Login",
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
