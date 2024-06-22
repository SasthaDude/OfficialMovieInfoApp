import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  // List of language data (for demonstration)
  final List<Map<String, dynamic>> languages = [
    {'name': 'சினிமா',  'color': Colors.orange},
    {'name': 'cinema',  'color': Colors.blue},
    {'name': 'സിനിമ',  'color': Colors.green},
    {'name': 'సినిమా',  'color': Colors.red},
    {'name': 'ಸಿನಿಮಾ',  'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Languages'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.85, // Aspect ratio for each grid item
        ),
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return _buildLanguageCard(
            languages[index]['name'],
            languages[index]['color'],
          );
        },
      ),
    );
  }

  Widget _buildLanguageCard(String name, Color color) {
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

            SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}