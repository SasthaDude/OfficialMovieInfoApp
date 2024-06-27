import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  // List of language data (for demonstration)
  final List<Map<String, dynamic>> languages = [
    {'name': 'சினிமா',  'color': Colors.grey},
    {'name': 'cinema',  'color': Colors.blue},
    {'name': 'സിനിമ',  'color': Colors.green},
    {'name': 'సినిమా',  'color': Colors.red},
    {'name': 'ಸಿನಿಮಾ',  'color': Colors.purple},
    {'name': 'हिंदी',  'color': Colors.deepOrange},
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)
        ),
        title: Text('Languages'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(width * 0.04),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width > 600 ? 3 : 2, // More columns on larger screens
          crossAxisSpacing: width * 0.04,
          mainAxisSpacing: height * 0.02,
          childAspectRatio: 0.85, // Aspect ratio for each grid item
        ),
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return _buildLanguageCard(
            languages[index]['name'],
            languages[index]['color'],
            width,
            textScaleFactor,
          );
        },
      ),
    );
  }

  Widget _buildLanguageCard(String name, Color color, double width, double textScaleFactor) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          // Handle tap on the card
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: width * 0.03),
            Text(
              name,
              style: TextStyle(
                fontSize: 20 * textScaleFactor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
