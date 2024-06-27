import 'package:flutter/material.dart';
import 'package:filminfo/LogSign.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}
void _showMyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return LogSIGN();
    },
  );
}


class _GetStartedState extends State<GetStarted> {

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Image.asset("assets/getstart.jpg", fit: BoxFit.cover,),
          ),
          Container(
            height: height,
            width: width,
            color: Colors.black.withOpacity(0.4),
          ),
          Positioned(
            top: height * 0.15,
            left: width * 0.1,
            right: width * 0.1,
            child: Column(
              children: [
                Text(
                  'Never Miss Any Movie',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30 * textScaleFactor,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'Discover and keep track of your favorite movies.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12 * textScaleFactor,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: width * 0.25,
            right: width * 0.25,
            bottom: height * 0.2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: height * 0.01),
              ),
              onPressed: () {
                _showMyBottomSheet(context);
                },
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 13 * textScaleFactor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
