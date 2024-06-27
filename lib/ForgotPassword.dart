
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final forgotFormKey = GlobalKey<FormState>();
  final TextEditingController forgotNewPasswordController = TextEditingController();
  final TextEditingController forgotConfirmPasswordController = TextEditingController();
  bool ForgotIsPasswordVisible = false;
  bool ForgotIsConfirmPasswordVisible = false;

  void _resetPassword() {
    if (forgotFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset successfully!')),
      );
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    }
    if (value != forgotNewPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF455A64),
              Color(0xFF607D8B),
              Color(0xFF78909C),
              Color(0xFF90A4AE),
              Color(0xFFB0BEC5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(width * 0.04), // Responsive padding
            child: Container(
              padding: EdgeInsets.all(width * 0.06), // Responsive padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 15),
                  ),
                ],
              ),
              child: Form(
                key: forgotFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CREATE NEW PASSWORD",
                      style: TextStyle(
                        fontSize: 14 * textScaleFactor, // Responsive text size
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: height * 0.03), // Responsive height
                    Text(
                      "NEW PASSWORD",
                      style: TextStyle(
                        fontSize: 12 * textScaleFactor, // Responsive text size
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.01), // Responsive height
                    TextFormField(
                      controller: forgotNewPasswordController,
                      obscureText: !ForgotIsPasswordVisible,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(width * 0.04), // Responsive padding
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(208, 211, 212, 0.7),
                        suffixIcon: IconButton(
                          icon: Icon(
                            size: 22,
                            ForgotIsPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              ForgotIsPasswordVisible = !ForgotIsPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: _validatePassword,
                    ),
                    SizedBox(height: height * 0.02), // Responsive height
                    Text(
                      "CONFIRM PASSWORD",
                      style: TextStyle(
                        fontSize: 12 * textScaleFactor, // Responsive text size
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.01), // Responsive height
                    TextFormField(
                      controller: forgotConfirmPasswordController,
                      obscureText: !ForgotIsConfirmPasswordVisible,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(width * 0.04), // Responsive padding
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(208, 211, 212, 0.7),
                        suffixIcon: IconButton(
                          icon: Icon(
                            size: 22,
                            ForgotIsConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              ForgotIsConfirmPasswordVisible = !ForgotIsConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: _validateConfirmPassword,
                    ),
                    SizedBox(height: height * 0.03), // Responsive height
                    Center(
                      child: ElevatedButton(
                        onPressed: _resetPassword,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.10, vertical: height * 0.01), // Responsive padding
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "RESET PASSWORD",
                          style: TextStyle(fontSize: 11 * textScaleFactor, color: Colors.white), // Responsive text size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
