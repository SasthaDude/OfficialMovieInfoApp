import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:filminfo/LOGIN.dart';
import 'package:filminfo/PROFILE.dart';
import 'package:flutter/material.dart';

class TheatrePage extends StatefulWidget {
  const TheatrePage({Key? key}) : super(key: key);

  @override
  State<TheatrePage> createState() => _TheatrePageState();
}

const List<String> MoviesInTheraters = [
  'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/maharaja-et00399737-1716978600.jpg',
  'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/garudan-et00398974-1716363155.jpg',
  'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00396811-wesexflnxd-portrait.jpg',
  'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00398799-quzfldxshc-portrait.jpg',
  'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00393228-ueeazljpdn-portrait.jpg',
];
final List<String> TamilSeries = [
  "https://m.media-amazon.com/images/M/MV5BYTczNGFhZmMtODc3YS00ZjhmLWIzODEtOWQxMjc4MjMxNzU1XkEyXkFqcGdeQXVyMjQzNDc4NDk@._V1_.jpg",
  "https://m.media-amazon.com/images/M/MV5BZDdiMmQ1ZTMtMDQ0NS00NDE1LTgzYzktZDdkYmU0ZjgzZmM3XkEyXkFqcGdeQXVyMjAwNzczNTU@._V1_.jpg",
  "https://images.plex.tv/photo?size=large-1920&scale=1&url=https%3A%2F%2Fimage.tmdb.org%2Ft%2Fp%2Foriginal%2Fp1VTdQ58aMEE8GkV9eBfu0ebnao.jpg",
  "https://image.tmdb.org/t/p/original/3jnMI7H5820bkAOpSVLckTBT2Wl.jpg",
  "https://middaycdn.s.llnwi.net/Radiocity-images/images/uploads/web-stories/Label1_ws.jpg",
  "https://1847884116.rsc.cdn77.org/telugu/webreviews/fall-web-series-review-4.jpg",
  "https://pbs.twimg.com/media/Esj5ZBHVoAUUXQ7.jpg",
];

class _TheatrePageState extends State<TheatrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: FanCarouselImageSlider.sliderType1(
                isClickable: false,
                expandImageHeight: MediaQuery.of(context).size.height * 0.5,
                isAssets: false,
                turns: 80,
                autoPlay: true,
                sliderHeight: MediaQuery.of(context).size.height * 0.5,
                showIndicator: true,
                imagesLink: MoviesInTheraters,
              ),
            ),
            SizedBox(
              height: 400,
              child: GridView.builder(
                itemCount: TamilSeries.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(TamilSeries[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
