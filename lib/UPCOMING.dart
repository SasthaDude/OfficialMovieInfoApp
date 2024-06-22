import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

class UpComing extends StatefulWidget {
  const UpComing({super.key});

  @override
  State<UpComing> createState() => _UpComingState();
}

const List<String> MoviesInTheraters = [
  'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/maharaja-et00399737-1716978600.jpg',
  'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/garudan-et00398974-1716363155.jpg',
  'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00396811-wesexflnxd-portrait.jpg',
  'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00398799-quzfldxshc-portrait.jpg',
  'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00393228-ueeazljpdn-portrait.jpg',
];

class _UpComingState extends State<UpComing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Scaffold(
        body: Column(
          children: [
            FanCarouselImageSlider.sliderType1(
              isAssets: false,
              turns: 50,
              autoPlay: true,
              sliderHeight: 400,
              showIndicator: true,
              imagesLink: MoviesInTheraters,
            ),
          ],
        ),
      ),
    );
  }
}