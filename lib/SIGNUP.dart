import 'package:filminfo/LOGIN.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> signFormKey = GlobalKey<FormState>();
  final TextEditingController signNameController = TextEditingController();
  final TextEditingController signEmailController = TextEditingController();
  final TextEditingController signPhoneController = TextEditingController();
  final TextEditingController signPasswordController = TextEditingController();
  bool signIsPasswordVisible = false;


  Future<void> _register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signEmailController.text,
        password: signPasswordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Registration Failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF455A64),
              Color(0xFF607D8B),
              Color(0xFF78909C),
              Color(0xFF90A4AE),
              Color(0xFFB0BEC5),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Form(
                key: signFormKey,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("NAME", style: TextStyle(
                            fontSize: 20
                        ),)),
                    _buildTextFormField(
                      controller: signNameController,
                      // helperText: "NAME",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("EMAIL ID", style: TextStyle(
                            fontSize: 20
                        ),)),
                    _buildTextFormField(
                      controller: signEmailController,
                      //helperText: "EMAIL ID",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("PHONE NUMBER", style: TextStyle(
                            fontSize: 20
                        ),)),
                    _buildTextFormField(
                      controller: signPhoneController,
                      //helperText: "PHONE NUMBER",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("PASSWORD", style: TextStyle(
                            fontSize: 20
                        ),)),
                    _buildTextFormField(
                      controller: signPasswordController,
                      obscureText: !signIsPasswordVisible,
                      suffixIcon: signIsPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      onSuffixIconPressed: () {
                        setState(() {
                          signIsPasswordVisible = !signIsPasswordVisible;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 80),
                    GestureDetector(
                      onTap: () {
                        if (signFormKey.currentState!.validate()) {
                          _register();
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,

                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" Already a member?", style: TextStyle(
                          fontSize: 25,
                        ),),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Login()
                              )
                              );
                            },
                            child: Text(" LOGIN", style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    //required String helperText,
    required String? Function(String?) validator,
    bool obscureText = false,
    IconData? suffixIcon,
    void Function()? onSuffixIconPressed,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(fontSize: 25),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: Color.fromRGBO(208, 211, 212, 0.7),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon, color: Colors.black, size: 25,),
          onPressed: onSuffixIconPressed,
        )
            : null,
        helperStyle: TextStyle(fontSize: 20, color: Colors.black),
      ),
      validator: validator,
    );
  }
}
