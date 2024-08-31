import "package:flutter/material.dart";

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool pw;
  final TextEditingController controller;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.pw,
      required this.controller});

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        obscureText: pw,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          fillColor: Theme.of(context).colorScheme.tertiary,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
