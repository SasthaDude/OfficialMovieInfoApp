import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool receiveNotifications = true;
  String selectedLanguage = 'English';
  String selectedTheme = 'Light';
  String playbackQuality = 'High';
  List<String> selectedGenres = ['Action', 'Adventure'];
  List<String> availableLanguages = ['English', 'Spanish', 'French', 'German'];
  List<String> availableThemes = ['Light', 'Dark', 'System'];
  List<String> availableQualities = ['Low', 'Medium', 'High'];
  List<String> availableGenres = ['Action', 'Adventure', 'Comedy', 'Drama', 'Fantasy', 'Horror', 'Sci-Fi', 'Thriller'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = constraints.maxWidth * 0.05;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined)
              ),
              title: Text('Settings', style: TextStyle(fontSize: fontSize)),
            ),
            body: Container(
              color: Colors.deepPurple[50], // Set your desired background color here
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  _buildNotificationSwitchTile(fontSize),
                  SizedBox(height: 16.0),
                  _buildLanguageSelectionTile(fontSize),
                  SizedBox(height: 16.0),
                  _buildThemeSelectionTile(fontSize),
                  SizedBox(height: 16.0),
                  _buildPlaybackQualityTile(fontSize),
                  SizedBox(height: 16.0),
                  _buildGenresSelectionTile(fontSize),
                  SizedBox(height: 16.0),
                  _buildPrivacySettingsTile(fontSize),
                ],
              ),
            ),
          );
        }
    );
  }

  Widget _buildNotificationSwitchTile(double fontSize) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: ListTile(
        title: Text('Receive Notifications', style: TextStyle(fontSize: fontSize)),
        trailing: Switch(
          value: receiveNotifications,
          activeColor: Colors.deepPurple,
          onChanged: (value) {
            setState(() {
              receiveNotifications = value;
            });
            // Handle notification toggle
          },
        ),
      ),
    );
  }

  Widget _buildLanguageSelectionTile(double fontSize) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: ListTile(
        title: Text('Preferred Language', style: TextStyle(fontSize: fontSize)),
        trailing: DropdownButton<String>(
          value: selectedLanguage,
          dropdownColor: Colors.white.withOpacity(0.9),
          onChanged: (String? value) {
            setState(() {
              selectedLanguage = value!;
            });
            // Handle language selection
          },
          items: availableLanguages.map<DropdownMenuItem<String>>((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildThemeSelectionTile(double fontSize) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: ListTile(
        title: Text('Theme', style: TextStyle(fontSize: fontSize)),
        trailing: DropdownButton<String>(
          value: selectedTheme,
          dropdownColor: Colors.white.withOpacity(0.9),
          onChanged: (String? value) {
            setState(() {
              selectedTheme = value!;
            });
            // Handle theme selection
          },
          items: availableThemes.map<DropdownMenuItem<String>>((String theme) {
            return DropdownMenuItem<String>(
              value: theme,
              child: Text(theme),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPlaybackQualityTile(double fontSize) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: ListTile(
        title: Text('Playback Quality', style: TextStyle(fontSize: fontSize)),
        trailing: DropdownButton<String>(
          value: playbackQuality,
          dropdownColor: Colors.white.withOpacity(0.9),
          onChanged: (String? value) {
            setState(() {
              playbackQuality = value!;
            });
            // Handle quality selection
          },
          items: availableQualities.map<DropdownMenuItem<String>>((String quality) {
            return DropdownMenuItem<String>(
              value: quality,
              child: Text(quality),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildGenresSelectionTile(double fontSize) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Preferred Genres',
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: availableGenres.map((genre) {
                bool isSelected = selectedGenres.contains(genre);
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FilterChip(
                    label: Text(genre),
                    selected: isSelected,
                    selectedColor: Colors.deepPurpleAccent,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedGenres.add(genre);
                        } else {
                          selectedGenres.remove(genre);
                        }
                      });
                      // Handle genre selection
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacySettingsTile(double fontSize) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: ListTile(
        title: Text('Privacy Settings', style: TextStyle(fontSize: fontSize)),
        trailing: Icon(Icons.arrow_forward, color: Colors.deepPurple),
        onTap: () {
          // Navigate to privacy settings page
        },
      ),
    );
  }
}

