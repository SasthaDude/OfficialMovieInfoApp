// // import 'package:flutter/material.dart';
// //
// // class AttractiveTabBar extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Attractive TabBar'),
// //         bottom: TabBar(
// //           indicator: BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Colors.red, Colors.orange],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //             ),
// //             borderRadius: BorderRadius.circular(20),
// //           ),
// //           unselectedLabelColor: Colors.white70,
// //           labelColor: Colors.white,
// //           labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //           unselectedLabelStyle: TextStyle(fontSize: 14),
// //           tabs: [
// //             Tab(
// //               icon: Icon(Icons.theaters, size: 24),
// //               text: "THEATER",
// //             ),
// //             Tab(
// //               icon: Icon(Icons.ondemand_video, size: 24),
// //               text: "OTT",
// //             ),
// //             Tab(
// //               icon: Icon(Icons.upcoming, size: 24),
// //               text: "UPCOMING",
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: DefaultTabController(
// //         length: 3,
// //         child: TabBarView(
// //           children: [
// //             Center(child: Text('Theater Content')),
// //             Center(child: Text('OTT Content')),
// //             Center(child: Text('Upcoming Content')),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // void main() {
// //   runApp(MaterialApp(
// //     home: DefaultTabController(
// //       length: 3,
// //       child: AttractiveTabBar(),
// //     ),
// //   ));
// // }
//
// //-------------------------------------------------------------------
//
// // import 'package:flutter/material.dart';
// //
// // import 'LogSign.dart';
// //
// //
// // class GetStarted extends StatefulWidget {
// //   const GetStarted({super.key});
// //
// //   @override
// //   State<GetStarted> createState() => _GetStartedState();
// // }
// //
// // class _GetStartedState extends State<GetStarted> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Container(
// //             height: MediaQuery.of(context).size.height,
// //             width: MediaQuery.of(context).size.width,
// //             decoration: BoxDecoration(
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.black.withOpacity(0.6),
// //                   blurRadius: 10,
// //                   spreadRadius: 2,
// //                 ),
// //               ],
// //             ),
// //             child: Image.network(
// //               "https://img.freepik.com/free-photo/movie-background-collage_23-2149876008.jpg",
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           Container(
// //             height: MediaQuery.of(context).size.height,
// //             width: MediaQuery.of(context).size.width,
// //             color: Colors.black.withOpacity(0.4),
// //           ),
// //           Positioned(
// //             top: MediaQuery.of(context).size.height * 0.35,
// //             left: MediaQuery.of(context).size.width * 0.1,
// //             right: MediaQuery.of(context).size.width * 0.1,
// //             child: Text(
// //               'Never Miss Any Movie',
// //               textAlign: TextAlign.center,
// //               style: TextStyle(
// //                 fontSize: 35,
// //                 color: Colors.white,
// //                 fontWeight: FontWeight.bold,
// //                 shadows: [
// //                   Shadow(
// //                     blurRadius: 10.0,
// //                     color: Colors.black,
// //                     offset: Offset(2.0, 2.0),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             left: MediaQuery.of(context).size.width * 0.25,
// //             right: MediaQuery.of(context).size.width * 0.25,
// //             bottom: MediaQuery.of(context).size.height * 0.2,
// //             child: ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.black,
// //                 backgroundColor: Colors.white,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 padding: EdgeInsets.symmetric(vertical: 15),
// //               ),
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => LogSIGN()),
// //                 );
// //               },
// //               child: Text(
// //                 "Get Started",
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// //---------------------------------------------------------------------
//
//
// // import 'package:flutter/material.dart';
// // import 'package:filminfo/LogSign.dart';
// //
// // class GetStarted extends StatefulWidget {
// //   const GetStarted({super.key});
// //
// //   @override
// //   State<GetStarted> createState() => _GetStartedState();
// // }
// //
// // class _GetStartedState extends State<GetStarted> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Container(
// //             height: MediaQuery.of(context).size.height,
// //             width: MediaQuery.of(context).size.width,
// //             decoration: BoxDecoration(
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.black.withOpacity(0.6),
// //                   blurRadius: 10,
// //                   spreadRadius: 2,
// //                 ),
// //               ],
// //             ),
// //             child: Image.network(
// //               "https://img.freepik.com/free-photo/movie-background-collage_23-2149876008.jpg",
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           Container(
// //             height: MediaQuery.of(context).size.height,
// //             width: MediaQuery.of(context).size.width,
// //             color: Colors.black.withOpacity(0.4),
// //           ),
// //           Positioned(
// //             top: MediaQuery.of(context).size.height * 0.15,
// //             left: MediaQuery.of(context).size.width * 0.1,
// //             right: MediaQuery.of(context).size.width * 0.1,
// //             child: Column(
// //               children: [
// //                 Text(
// //                   'Never Miss Any Movie',
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(
// //                     fontSize: 35,
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold,
// //                     shadows: [
// //                       Shadow(
// //                         blurRadius: 10.0,
// //                         color: Colors.black,
// //                         offset: Offset(2.0, 2.0),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(height: 20),
// //                 Text(
// //                   'Discover and keep track of your favorite movies.',
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     color: Colors.white70,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Positioned(
// //             left: MediaQuery.of(context).size.width * 0.25,
// //             right: MediaQuery.of(context).size.width * 0.25,
// //             bottom: MediaQuery.of(context).size.height * 0.2,
// //             child: ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.black,
// //                 backgroundColor: Colors.white,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 padding: EdgeInsets.symmetric(vertical: 15),
// //               ),
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => LogSIGN()),
// //                 );
// //               },
// //               child: Text(
// //                 "Get Started",
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             left: 30,
// //             bottom: MediaQuery.of(context).size.height * 0.35,
// //             child: Icon(
// //               Icons.movie_creation_outlined,
// //               color: Colors.white70,
// //               size: 100,
// //             ),
// //           ),
// //           Positioned(
// //             right: 30,
// //             bottom: MediaQuery.of(context).size.height * 0.35,
// //             child: Icon(
// //               Icons.theaters_outlined,
// //               color: Colors.white70,
// //               size: 100,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// //----------------------------------------------------------------
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:filminfo/LogSign.dart';
// //
// // class GetStarted extends StatefulWidget {
// //   const GetStarted({super.key});
// //
// //   @override
// //   State<GetStarted> createState() => _GetStartedState();
// // }
// //
// // class _GetStartedState extends State<GetStarted> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Container(
// //             height: MediaQuery.of(context).size.height,
// //             width: MediaQuery.of(context).size.width,
// //             decoration: BoxDecoration(
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.black.withOpacity(0.6),
// //                   blurRadius: 10,
// //                   spreadRadius: 2,
// //                 ),
// //               ],
// //             ),
// //             child: Image.network(
// //               "https://img.freepik.com/free-photo/movie-background-collage_23-2149876008.jpg",
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           Container(
// //             height: MediaQuery.of(context).size.height,
// //             width: MediaQuery.of(context).size.width,
// //             color: Colors.black.withOpacity(0.4),
// //           ),
// //           Positioned(
// //             top: MediaQuery.of(context).size.height * 0.15,
// //             left: MediaQuery.of(context).size.width * 0.1,
// //             right: MediaQuery.of(context).size.width * 0.1,
// //             child: Column(
// //               children: [
// //                 Text(
// //                   'Never Miss Any Movie',
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(
// //                     fontSize: 35,
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold,
// //                     shadows: [
// //                       Shadow(
// //                         blurRadius: 10.0,
// //                         color: Colors.black,
// //                         offset: Offset(2.0, 2.0),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(height: 20),
// //                 Text(
// //                   'Discover and keep track of your favorite movies.',
// //                   textAlign: TextAlign.center,
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     color: Colors.white70,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Positioned(
// //             left: MediaQuery.of(context).size.width * 0.25,
// //             right: MediaQuery.of(context).size.width * 0.25,
// //             bottom: MediaQuery.of(context).size.height * 0.2,
// //             child: ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.black,
// //                 backgroundColor: Colors.white,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 padding: EdgeInsets.symmetric(vertical: 15),
// //               ),
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => LogSIGN()),
// //                 );
// //               },
// //               child: Text(
// //                 "Get Started",
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             left: 30,
// //             bottom: MediaQuery.of(context).size.height * 0.35,
// //             child: Column(
// //               children: [
// //                 Icon(
// //                   Icons.movie_creation_outlined,
// //                   color: Colors.white70,
// //                   size: 100,
// //                 ),
// //                 SizedBox(height: 20),
// //                 Icon(
// //                   Icons.star_border_outlined,
// //                   color: Colors.white70,
// //                   size: 50,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Positioned(
// //             right: 30,
// //             bottom: MediaQuery.of(context).size.height * 0.35,
// //             child: Column(
// //               children: [
// //                 Icon(
// //                   Icons.theaters_outlined,
// //                   color: Colors.white70,
// //                   size: 100,
// //                 ),
// //                 SizedBox(height: 20),
// //                 Icon(
// //                   Icons.favorite_border_outlined,
// //                   color: Colors.white70,
// //                   size: 50,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Positioned(
// //             left: 30,
// //             top: MediaQuery.of(context).size.height * 0.35,
// //             child: Column(
// //               children: [
// //                 Icon(
// //                   Icons.access_time_outlined,
// //                   color: Colors.white70,
// //                   size: 50,
// //                 ),
// //                 SizedBox(height: 20),
// //                 Icon(
// //                   Icons.notifications_outlined,
// //                   color: Colors.white70,
// //                   size: 50,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Positioned(
// //             right: 30,
// //             top: MediaQuery.of(context).size.height * 0.35,
// //             child: Column(
// //               children: [
// //                 Icon(
// //                   Icons.play_circle_outline,
// //                   color: Colors.white70,
// //                   size: 50,
// //                 ),
// //                 SizedBox(height: 20),
// //                 Icon(
// //                   Icons.calendar_today_outlined,
// //                   color: Colors.white70,
// //                   size: 50,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// //-----------------------------------------------------------------
//
//
//
//
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }



class MyHomePagesss extends StatefulWidget {
  MyHomePagesss({super.key, required this.title});

  final String title;

  @override
  _MyHomePagesssState createState() => _MyHomePagesssState();
}

class _MyHomePagesssState extends State<MyHomePagesss> {
  final List<String> imageUrls = [
    "https://m.media-amazon.com/images/M/MV5BZjFlZjljNDctODIyZi00ZmZkLWE4OWYtMDkxMTZkNmM2OGMyXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg",
    "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/d7590f135861167.61ef6fb49f8e4.jpg",
    "https://i.pinimg.com/736x/ae/8c/21/ae8c21bc78b35923cdd54ef5868915ef.jpg",
    "https://i.pinimg.com/736x/2e/98/c5/2e98c58c758e3080a2cc84682cd66e4b.jpg",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Swiper(

        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            imageUrls[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: imageUrls.length,
        itemWidth: 300.0,
        //pagination: SwiperPagination(),
        //control: SwiperControl(),
        layout: SwiperLayout.STACK,
        autoplay: true,
        autoplayDelay: 4000,
        axisDirection: AxisDirection.left,
       duration: 2,
      ),
    );
  }
}
// //
// //
// // ---------------------------------------------------------------------
//
//
//
// // import 'dart:math';
// //
// // import 'package:flutter/material.dart';
// // import 'package:overlapped_carousel/overlapped_carousel.dart';
// //
// // class MyHomePagess extends StatefulWidget {
// //   MyHomePagess({super.key, required this.title});
// //
// //   final String title;
// //
// //   @override
// //   _MyHomePagessState createState() => _MyHomePagessState();
// // }
// //
// //   class _MyHomePagessState extends State<MyHomePagess> {
// //
// //   List<String> widgets = [
// //     "https://m.media-amazon.com/images/M/MV5BZjFlZjljNDctODIyZi00ZmZkLWE4OWYtMDkxMTZkNmM2OGMyXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg",
// //     "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/d7590f135861167.61ef6fb49f8e4.jpg",
// //     "https://i.pinimg.com/736x/ae/8c/21/ae8c21bc78b35923cdd54ef5868915ef.jpg",
// //     "https://i.pinimg.com/736x/2e/98/c5/2e98c58c758e3080a2cc84682cd66e4b.jpg",
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var screenWidth = MediaQuery.of(context).size.width;
// //     var screenHeight = MediaQuery.of(context).size.height;
// //     return Scaffold(
// //       backgroundColor: Colors.blue,
// //       //Wrap with Center to place the carousel center of the screen
// //       body: Center(
// //         //Wrap the OverlappedCarousel widget with SizedBox to fix a height. No need to specify width.
// //         child: SizedBox(
// //           height: min(screenWidth / 3.3 * (16 / 9),screenHeight*.9),
// //           child: OverlappedCarousel(
// //             widgets: widgets, //List of widgets
// //             currentIndex: 2,
// //             onClicked: (index) {
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(
// //                   content: Text("You clicked at $index"),
// //                 ),
// //               );
// //             },
// //             // To obscure or blur cards not in focus use the obscure parameter.
// //             obscure: 0.4,
// //             // To control skew angle
// //             skewAngle: 0.25,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // ---------------------------------------------------------------------------
//
//
//
// import 'dart:math';
// import 'package:overlapped_carousel/overlapped_carousel.dart';
// import 'package:flutter/material.dart';
//
// class MyHomePagess extends StatefulWidget {
//   MyHomePagess({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _MyHomePagessState createState() => _MyHomePagessState();
// }
//
// class _MyHomePagessState extends State<MyHomePagess> {
//   // List of network images
//   final List<String> imageUrls = [
//     "https://m.media-amazon.com/images/M/MV5BZjFlZjljNDctODIyZi00ZmZkLWE4OWYtMDkxMTZkNmM2OGMyXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg",
//     "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/d7590f135861167.61ef6fb49f8e4.jpg",
//     "https://i.pinimg.com/736x/ae/8c/21/ae8c21bc78b35923cdd54ef5868915ef.jpg",
//     "https://i.pinimg.com/736x/2e/98/c5/2e98c58c758e3080a2cc84682cd66e4b.jpg",
//     "https://i.pinimg.com/564x/1c/e1/31/1ce1311c28db2c95b57a6686ec23c593.jpg",
//     // Add more image URLs if needed
//   ];
//
//   // Generate a list of widgets using the network images
//   List<Widget> widgets = [
//     Image.asset("assets/getstart.jpg"),
//     Image.asset("assets/getstart.jpg"),
//     Image.asset("assets/getstart.jpg"),
//     Image.asset("assets/getstart.jpg"),
//     //NetworkImage("https://i.pinimg.com/564x/1c/e1/31/1ce1311c28db2c95b57a6686ec23c593.jpg")
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     widgets = imageUrls.map((url) {
//       return ClipRRect(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(5.0),
//         ),
//         child: Image.network(
//           url,
//           fit: BoxFit.fill,
//         ),
//       );
//     }).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       // Wrap with Center to place the carousel center of the screen
//       body: Center(
//         // Wrap the OverlappedCarousel widget with SizedBox to fix a height. No need to specify width.
//         child: SizedBox(
//           height: min(screenWidth / 3.3 * (16 / 9), screenHeight * .9),
//           child: OverlappedCarousel(
//             widgets: widgets, // List of widgets
//             currentIndex: 2,
//             onClicked: (index) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text("You clicked at $index"),
//                 ),
//               );
//             },
//             obscure: 0.4,
//             skewAngle: 0.1,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
