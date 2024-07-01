import 'package:flutter/material.dart';

class Ottpage extends StatefulWidget {
  const Ottpage({super.key});

  @override
  State<Ottpage> createState() => _OttpageState();
}

class _OttpageState extends State<Ottpage> {
  final List<String> series = [
    "https://m.media-amazon.com/images/M/MV5BZjFlZjljNDctODIyZi00ZmZkLWE4OWYtMDkxMTZkNmM2OGMyXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg",
    "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/d7590f135861167.61ef6fb49f8e4.jpg",
    "https://i.pinimg.com/736x/ae/8c/21/ae8c21bc78b35923cdd54ef5868915ef.jpg",
    "https://i.pinimg.com/736x/2e/98/c5/2e98c58c758e3080a2cc84682cd66e4b.jpg",
    "https://i.pinimg.com/564x/1c/e1/31/1ce1311c28db2c95b57a6686ec23c593.jpg",
    "https://i.pinimg.com/736x/8b/55/aa/8b55aa9b71b85499e4971c8d3c707b35.jpg",
    "https://image.tmdb.org/t/p/original/7Ns6tO3aYjppI5bFhyYZurOYGBT.jpg",
    "https://resizing.flixster.com/ysilru6FAJCqgnUkmTqLktrnpSc=/fit-in/705x460/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p16314966_b_v10_ad.jpg",
  ];

  final List<String> tamilSeries = [
    "https://m.media-amazon.com/images/M/MV5BYTczNGFhZmMtODc3YS00ZjhmLWIzODEtOWQxMjc4MjMxNzU1XkEyXkFqcGdeQXVyMjQzNDc4NDk@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BZDdiMmQ1ZTMtMDQ0NS00NDE1LTgzYzktZDdkYmU0ZjgzZmM3XkEyXkFqcGdeQXVyMjAwNzczNTU@._V1_.jpg",
    "https://images.plex.tv/photo?size=large-1920&scale=1&url=https%3A%2F%2Fimage.tmdb.org%2Ft%2Fp%2Foriginal%2Fp1VTdQ58aMEE8GkV9eBfu0ebnao.jpg",
    "https://image.tmdb.org/t/p/original/3jnMI7H5820bkAOpSVLckTBT2Wl.jpg",
    "https://middaycdn.s.llnwi.net/Radiocity-images/images/uploads/web-stories/Label1_ws.jpg",
    "https://1847884116.rsc.cdn77.org/telugu/webreviews/fall-web-series-review-4.jpg",
    "https://pbs.twimg.com/media/Esj5ZBHVoAUUXQ7.jpg",
  ];

  final List<String> indianSeries = [
    "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p27018866_b_v8_aa.jpg",
    "https://static.theprint.in/wp-content/uploads/2024/01/ANI-20240116082241.jpg",
    "https://image.tmdb.org/t/p/original/xvsHIsesEB4qPv8TpkH13g0NFUE.jpg",
    "https://metastory.in/wp-content/uploads/2023/12/Farzi-Web-Series-Dialogues.webp",
    "https://assets.gadgets360cdn.com/pricee/assets/product/202308/guns1_1692337032.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height / 1.8,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage("https://images-cdn.ubuy.co.in/655f0b93f79c175825542b76-breaking-bad-poster-24inx36in-61cm-x.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 80,
                  child: Text(
                    "gore · substance · tobacco use · violence",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textScaleFactor * 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "TV Series",
                  style: TextStyle(
                    fontSize: textScaleFactor * 20,
                    fontWeight: FontWeight.bold,
                   // color: Colors.white,
                  ),
                ),
              ),
            ),
            seriesList(series, width, height),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Tamil Series",
                  style: TextStyle(
                    fontSize: textScaleFactor * 20,
                    fontWeight: FontWeight.bold,
                    //color: Colors.white,
                  ),
                ),
              ),
            ),
            seriesList(tamilSeries, width, height),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Indian Series",
                  style: TextStyle(
                    fontSize: textScaleFactor * 20,
                    fontWeight: FontWeight.bold,
                    //color: Colors.black,
                  ),
                ),
              ),
            ),
            seriesList(indianSeries, width, height),
          ],
        ),
      ),
      //backgroundColor: Colors.black,
    );
  }

  Widget seriesList(List<String> series, double width, double height) {
    return Container(
      height: height / 5,
      child: ListView.builder(
        itemCount: series.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: width / 3.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(series[index]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
