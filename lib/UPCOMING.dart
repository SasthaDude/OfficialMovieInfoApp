import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:filminfo/OTTpage.dart';
import 'package:filminfo/TheaterPage.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  final PageController _pageController = PageController(initialPage: 0);

  int _selectedPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _selectedPage = page;
    });
  }

  void _onButtonPressed(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<String> MoviesUpcominginTheaters = [
    'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/maharaja-et00399737-1716978600.jpg',
    'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/garudan-et00398974-1716363155.jpg',
    'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00396811-wesexflnxd-portrait.jpg',
    'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00398799-quzfldxshc-portrait.jpg',
    'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00393228-ueeazljpdn-portrait.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton('THEATER', 0, textScaleFactor, context),
                _buildTabButton('OTT', 1, textScaleFactor, context),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  height: constraints.maxHeight,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    children: [
                      TheatrePage(),
                      Ottpage(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int page, double textScaleFactor, BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => _onButtonPressed(page),
      child: Container(
        width: screenWidth * 0.47, // Set the width to 47% of the screen width
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: _selectedPage == page
                ? [Colors.cyan, Colors.teal]
                : [Colors.grey, Colors.grey.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16 * textScaleFactor,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

