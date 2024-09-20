import 'package:flutter/material.dart';
import 'package:music_play_bloc/core/theme/textstyle.dart';

Widget CustomTextField(
    IconData icon,
    TextInputType keyboardType,
    String label,
    String hint,
    bool obsecureText,
    TextEditingController controller,
    int validatorID,
    VoidCallback toggleObscureText, // Add this callback to toggle the obscureText value
    ) {
  return Container(
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.6),
        ),
        suffixIcon: validatorID == 0
            ? IconButton(
          onPressed: toggleObscureText, // Call the toggle function when pressed
          icon: Icon(obsecureText
              ? Icons.visibility
              : Icons.visibility_off,color: Colors.black,),
        )
            : null,
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(icon),
        labelStyle: txtFormField,
        hintStyle: txtFormField,
      ),
      validator: (value) {
        if (validatorID == 0) {
          return isPassword(value!);
        } else if (validatorID == 1) {
          return isEmail(value!);
        }
        return null;
      },
    ),
  );
}

String? isPassword(String value) {
  if (value.isEmpty) {
    return null;
  }
  if (value.length >= 8) {
    return null; // Password is valid
  }
  return "Password must be at least 8 characters long";
}

String? isEmail(String value) {
  if (value.isEmpty) {
    return null;
  }
  if (value.contains("@")) {
    return null;
  }
  return "Invalid email address";
}
