// import 'dart:async';
// import 'package:filminfo/GetStarted.dart';
// import 'package:flutter/material.dart';
//
// class splashScreen extends StatefulWidget {
//   splashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }
//
// class _splashScreenState extends State<splashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     );
//
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//
//     // Start the animation
//     _controller.forward();
//
//     // Navigate to home page after 6 seconds
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => GetStarted()),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: FadeTransition(
//           opacity: _animation,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 "assets/splash2.gif",
//                 height: 200,
//                 width: 200,
//                 color: Colors.white,
//                 fit: BoxFit.fill,
//               ),
//               Image.asset(
//                 "assets/splash1.gif",
//                 height: 150,
//                 width: 300,
//                 fit: BoxFit.fill,
//                 color: Colors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:async';
import 'package:filminfo/GetStarted.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start the animation
    _controller.forward();

    // Navigate to home page after 6 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStarted()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(
          context,
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/splash2.gif",
                    height: ResponsiveValue<double>(
                      context,
                      defaultValue: 200.0,
                      valueWhen: const [
                        Condition.smallerThan(name: MOBILE, value: 150.0),
                        Condition.largerThan(name: TABLET, value: 250.0),
                      ],
                    ).value,
                    width: ResponsiveValue<double>(
                      context,
                      defaultValue: 200.0,
                      valueWhen: const [
                        Condition.smallerThan(name: MOBILE, value: 150.0),
                        Condition.largerThan(name: TABLET, value: 250.0),
                      ],
                    ).value,
                    color: Colors.white,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/splash1.gif",
                    height: ResponsiveValue<double>(
                      context,
                      defaultValue: 150.0,
                      valueWhen: const [
                        Condition.smallerThan(name: MOBILE, value: 100.0),
                        Condition.largerThan(name: TABLET, value: 200.0),
                      ],
                    ).value,
                    width: ResponsiveValue<double>(
                      context,
                      defaultValue: 300.0,
                      valueWhen: const [
                        Condition.smallerThan(name: MOBILE, value: 200.0),
                        Condition.largerThan(name: TABLET, value: 400.0),
                      ],
                    ).value,
                    fit: BoxFit.fill,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        ],
      ),
    );
  }
}




