// import 'package:filminfo/FIRSTPAGE.dart';
// import 'package:filminfo/ForgotPassword.dart';
// import 'package:flutter/material.dart';
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final logFormKey = GlobalKey<FormState>();
//   final logEmailController = TextEditingController();
//   final logPasswordController = TextEditingController();
//   bool logIsPasswordVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final double height = MediaQuery.of(context).size.height;
//     final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Colors.black54,
//               Colors.black45,
//               Colors.black38,
//               Colors.black26,
//               Colors.black12
//             ],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: width * 0.06),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: height * 0.05),
//                   Row(
//                     children: [
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: Icon(Icons.arrow_back_ios_new_outlined,
//                               color: Colors.white,)
//                         ),
//                       ),
//                       SizedBox(width: width * 0.15),
//                       Text(
//                         'Welcome Back!',
//                         style: TextStyle(
//                           fontSize: 22 * textScaleFactor,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: height * 0.05),
//                   Container(
//                     padding: EdgeInsets.all(width * 0.04),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.8),
//                       borderRadius: BorderRadius.circular(16.0),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           offset: Offset(2, 15),
//                           blurRadius: 8.0,
//                         ),
//                       ],
//                     ),
//                     child: Form(
//                       key: logFormKey,
//                       child: Column(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(30.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   offset: Offset(2, 15),
//                                   blurRadius: 8.0,
//                                 ),
//                               ],
//                             ),
//                             child: TextFormField(
//                               controller: logEmailController,
//                               style: TextStyle(fontSize: 15 * textScaleFactor),
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(Icons.email),
//                                 contentPadding: EdgeInsets.all(15),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30.0),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 hintText: "Email ID",
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your email';
//                                 } else if (!RegExp(
//                                     r'^[^@]+@[^@]+\.[^@]+')
//                                     .hasMatch(value)) {
//                                   return 'Please enter a valid email';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           SizedBox(height: height * 0.03),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(30.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   offset: Offset(2, 15),
//                                   blurRadius: 8.0,
//                                 ),
//                               ],
//                             ),
//                             child: TextFormField(
//                               controller: logPasswordController,
//                               obscureText: !logIsPasswordVisible,
//                               style: TextStyle(fontSize: 15 * textScaleFactor),
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(Icons.lock),
//                                 contentPadding: EdgeInsets.all(15),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30.0),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.grey[200],
//                                 hintText: "Password",
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     logIsPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                                     color: Colors.black,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       logIsPasswordVisible = !logIsPasswordVisible;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your password';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: height * 0.06),
//                   GestureDetector(
//                     onTap: () {
//                       if (logFormKey.currentState!.validate()) {
//                         // Perform login action
//                         Navigator.push(context, MaterialPageRoute(
//                             builder: (context) => FirstHomePage()
//
//                         ));
//                       }
//
//                     },
//                     child: Container(
//                       height: height * 0.05,
//                       width: width * 0.5,
//                       decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black26,
//                             offset: Offset(2, 15),
//                             blurRadius: 5.0,
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Text(
//                           "LOGIN",
//                           style: TextStyle(
//                             fontSize: 15 * textScaleFactor,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ),
//                   SizedBox(height: height * 0.02),
//                   TextButton(
//                       onPressed: (){
//                         Navigator.push(context, MaterialPageRoute(
//                             builder: (context) => ForgotPassword()
//                         )
//                         );
//                       },
//                       child: Text("Forgot Password?", style: TextStyle(
//                         fontSize: 11 * textScaleFactor,
//                         color: Colors.white70,
//                       ),)
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:filminfo/FIRSTPAGE.dart';
import 'package:filminfo/ForgotPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final logFormKey = GlobalKey<FormState>();
  final logEmailController = TextEditingController();
  final logPasswordController = TextEditingController();
  bool logIsPasswordVisible = false;

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black54,
                Colors.black45,
                Colors.black38,
                Colors.black26,
                Colors.black12,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 48.0),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                    SizedBox(height: 48.0),
                    Container(
                      padding: EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 15),
                            blurRadius: 8.0,
                          ),
                        ],
                      ),
                      child: Form(
                        key: logFormKey,
                        child: Column(
                          children: [
                            buildTextFormField(
                              controller: logEmailController,
                              icon: Icons.email,
                              hintText: "Email ID",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(
                                    r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 24.0),
                            buildTextFormField(
                              controller: logPasswordController,
                              icon: Icons.lock,
                              hintText: "Password",
                              obscureText: !logIsPasswordVisible,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  logIsPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    logIsPasswordVisible =
                                    !logIsPasswordVisible;
                                  });
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 48.0),
                    GestureDetector(
                      onTap: () {
                        if (logFormKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstHomePage(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 48.0,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 15),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget buildTextFormField({
      required TextEditingController controller,
      required IconData icon,
      required String hintText,
      bool obscureText = false,
      Widget? suffixIcon,
      String? Function(String?)? validator,
    }) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2, 15),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            contentPadding: EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
      );
    }
  }
