
import 'package:flutter/material.dart';

class Ottpage extends StatefulWidget {
  const Ottpage({super.key});

  @override
  State<Ottpage> createState() => _OttpageState();
}

class _OttpageState extends State<Ottpage> {


  final List series = [
    "https://m.media-amazon.com/images/M/MV5BZjFlZjljNDctODIyZi00ZmZkLWE4OWYtMDkxMTZkNmM2OGMyXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg",
    "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/d7590f135861167.61ef6fb49f8e4.jpg",
    "https://i.pinimg.com/736x/ae/8c/21/ae8c21bc78b35923cdd54ef5868915ef.jpg",
    "https://i.pinimg.com/736x/2e/98/c5/2e98c58c758e3080a2cc84682cd66e4b.jpg",
    "https://i.pinimg.com/564x/1c/e1/31/1ce1311c28db2c95b57a6686ec23c593.jpg",
    "https://i.pinimg.com/736x/8b/55/aa/8b55aa9b71b85499e4971c8d3c707b35.jpg",
    "https://image.tmdb.org/t/p/original/7Ns6tO3aYjppI5bFhyYZurOYGBT.jpg",
    "https://resizing.flixster.com/ysilru6FAJCqgnUkmTqLktrnpSc=/fit-in/705x460/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p16314966_b_v10_ad.jpg",
  ];

  final List tamilSeries = [
    "https://m.media-amazon.com/images/M/MV5BYTczNGFhZmMtODc3YS00ZjhmLWIzODEtOWQxMjc4MjMxNzU1XkEyXkFqcGdeQXVyMjQzNDc4NDk@._V1_.jpg",
    "https://m.media-amazon.com/images/M/MV5BZDdiMmQ1ZTMtMDQ0NS00NDE1LTgzYzktZDdkYmU0ZjgzZmM3XkEyXkFqcGdeQXVyMjAwNzczNTU@._V1_.jpg",
    "https://images.plex.tv/photo?size=large-1920&scale=1&url=https%3A%2F%2Fimage.tmdb.org%2Ft%2Fp%2Foriginal%2Fp1VTdQ58aMEE8GkV9eBfu0ebnao.jpg",
    "https://image.tmdb.org/t/p/original/3jnMI7H5820bkAOpSVLckTBT2Wl.jpg",
    "https://middaycdn.s.llnwi.net/Radiocity-images/images/uploads/web-stories/Label1_ws.jpg",
    "https://1847884116.rsc.cdn77.org/telugu/webreviews/fall-web-series-review-4.jpg",
    "https://pbs.twimg.com/media/Esj5ZBHVoAUUXQ7.jpg",
  ];

  final List indianSeries = [
    "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p27018866_b_v8_aa.jpg",
    "https://static.theprint.in/wp-content/uploads/2024/01/ANI-20240116082241.jpg",
    "https://image.tmdb.org/t/p/original/xvsHIsesEB4qPv8TpkH13g0NFUE.jpg",
    "https://metastory.in/wp-content/uploads/2023/12/Farzi-Web-Series-Dialogues.webp",
    "https://assets.gadgets360cdn.com/pricee/assets/product/202308/guns1_1692337032.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20,),

            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height/1.8,
              width: MediaQuery.of(context).size.width/1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage("https://images-cdn.ubuy.co.in/655f0b93f79c175825542b76-breaking-bad-poster-24inx36in-61cm-x.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 350,),
                  Container(
                    height: MediaQuery.of(context).size.height/25,
                    width: MediaQuery.of(context).size.width/1,
                    child: Center(
                      child: Text("gore · substance · tobacco use · violence", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/25,
                        width: MediaQuery.of(context).size.width/3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.play_arrow, size: 35,),
                            Text("Play", style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/25,
                        width: MediaQuery.of(context).size.width/3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, size: 25, color: Colors.white,),
                            Text("My List", style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("TV Series", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/5,
              child: ListView.builder(
                  itemCount: series.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(series[index]),
                            fit: BoxFit.fill,
                          ),
                          //border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Tamil Series", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/5,
              child: ListView.builder(
                  itemCount: tamilSeries.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(tamilSeries[index]),
                            fit: BoxFit.fill,
                          ),
                          //border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Indian Series", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/5,
              child: ListView.builder(
                  itemCount: indianSeries.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(indianSeries[index]),
                            fit: BoxFit.fill,
                          ),
                          //border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }
              ),
            ),

          ],
        ),
      ),
      backgroundColor: Colors.black,

    );
  }
}
