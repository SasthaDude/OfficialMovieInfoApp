import 'package:filminfo/FIRSTPAGE.dart';
import 'package:filminfo/LOGIN.dart';
import 'package:filminfo/SIGNUP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogSIGN extends StatefulWidget {
  const LogSIGN({super.key});

  @override
  State<LogSIGN> createState() => _LogSIGNState();
}

class _LogSIGNState extends State<LogSIGN> {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: "858103429336-0b22hkkb1mete48l6u23gqsd9d2e78e4.apps.googleusercontent.com",
  );

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstHomePage()));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
        width: double.infinity,
        height: height/2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.black45,
              Colors.black38,
              Colors.black26,
              Colors.black12
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Spacer(),
            SizedBox(height: height * 0.05),
            Center(
              child: Text(
                'Welcome to FilmInfo',
                style: TextStyle(
                  fontSize: 12 * textScaleFactor,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            _buildButton(
              text: 'Sign up',
              textColor: Colors.green,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
              },
              width: width,
              height: height,
              textScaleFactor: textScaleFactor,
            ),
            SizedBox(height: height * 0.03),
            _buildButton(
              text: 'Login',
              textColor: Colors.red,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
              width: width,
              height: height,
              textScaleFactor: textScaleFactor,
            ),
            SizedBox(height: height * 0.03),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Divider(
                      thickness: 1,
                      color: Colors.white12,
                    ),
                  ), 
                ),
                Text(
                  'OR',
                  style: TextStyle(
                   // fontWeight: FontWeight.bold,
                    fontSize: 10 * textScaleFactor,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            _buildGoogleButton(width, height, textScaleFactor),
            Spacer(),
          ],
        ),
      );

  }

  Widget _buildButton({
    required String text,
    required Color textColor,
    required VoidCallback onPressed,
    required double width,
    required double height,
    required double textScaleFactor,
  }) {
    return Container(
      height: height * 0.05,
      width: width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white70],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 15),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15 * textScaleFactor,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleButton(double width, double height, double textScaleFactor) {
    return Container(
      height: height * 0.05,
      width: width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white70],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 15),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () async {
          signInWithGoogle(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),

        label: Text(
          'Sign in with Google',
          style: TextStyle(
            fontSize: 15 * textScaleFactor,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
