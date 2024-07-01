import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:filminfo/AboutApp.dart';
import 'package:filminfo/HelpCentre.dart';
import 'package:filminfo/Settings.dart';
import 'package:filminfo/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'OTTpage.dart';
import 'TheaterPage.dart';
import 'ThemePage.dart';
import 'UPCOMING.dart';
import 'GetStarted.dart';
import 'LANGUAGE.dart';
import 'PROFILE.dart';

class FirstHomePage extends StatefulWidget {
  const FirstHomePage({super.key});

  @override
  State<FirstHomePage> createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
  Future<void> share(String title, String text, String linkUrl) async {
    await FlutterShare.share(
        title: title,
        text: text,
        linkUrl: linkUrl,
        chooserTitle: 'Share via');
  }
  Future<void> shareapp() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title'
    );
  }

  void _handleDrawerSelection(String value) {
    switch (value) {
      case 'share':
        share('Example share', 'Example share text', 'https://flutter.dev/');
        Navigator.pop(context); // Close the drawer after sharing
        break;}}
  late final Theme_text = MediaQuery.of(context).platformBrightness == Brightness.dark ? "DarkTheme" : "LightTheme";
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select image from:'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: Text('Gallery'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: Text('Camera'),
          ),
          TextButton(
            onPressed: () async {
              bool confirm = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete Confirmation'),
                    content: Text('Are you sure you want to delete your profile picture?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          Navigator.of(context).pop();
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  );
                },
              );
              if (confirm) {
                _clearProfile(); // Call method to delete profile image
              }
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );

    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(source: pickedImage);
      if (pickedFile != null) {
        final bytes = await File(pickedFile.path).readAsBytes();
        setState(() {
          _image = bytes;
        });
        _saveImage(bytes);
      }
    }
  }

  Future<void> _saveImage(Uint8List bytes) async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = base64Encode(bytes);
    await prefs.setString('profile_image', base64String);
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = prefs.getString('profile_image');
    if (base64String != null) {
      setState(() {
        _image = base64Decode(base64String);
      });
    }
  }

  Future<void> _clearProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('profile_image'); // Remove stored image

    setState(() {
      _image = null; // Clear the image in the UI
    });
  }


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              currentAccountPicture: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                    radius: 80,
                    backgroundImage: MemoryImage(_image!),
                  )
                      : Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToiRnzzyrDtkmRzlAvPPbh77E-Mvsk3brlxQ&s",
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: -10,
                    child: IconButton(
                      onPressed: _selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              accountName: Text(
                'alagan',
                style: TextStyle(fontSize: 20 * textScaleFactor),
              ),
              accountEmail: Text(
                'alagan08@gmail.com',
                style: TextStyle(fontSize: 16 * textScaleFactor),
              ),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 18 * textScaleFactor),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.help_center),
              title: Text(
                'Language',
                style: TextStyle(fontSize: 18 * textScaleFactor),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Language()));
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box_outlined),
              title: Text(
                'Help Center',
                style: TextStyle(fontSize: 18 * textScaleFactor),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HelpCenter()
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 18 * textScaleFactor),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.touch_app_outlined),
              title: Text(
                'About app',
                style: TextStyle(fontSize: 18 * textScaleFactor),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AboutPage()
                ));
              },
            ),ListTile(
              leading: Icon(Icons.share),
              title: Text("Share",style: TextStyle(fontSize: 18 * textScaleFactor)
              ),
              onTap: shareapp,

            ),

            ListTile(
              leading: Icon(Icons.assignment_ind_outlined),
              title: Text(
                'Log out',
                style: TextStyle(fontSize: 18 * textScaleFactor),
              ),
              onTap: () async {
                bool confirm = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Logout Confirmation',
                        style: TextStyle(fontSize: 20 * textScaleFactor),
                      ),
                      content: Text(
                        'Are you sure you want to logout?',
                        style: TextStyle(fontSize: 18 * textScaleFactor),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 18 * textScaleFactor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(fontSize: 18 * textScaleFactor),
                          ),
                        ),
                      ],
                    );
                  },
                );
                if (confirm) {
                  try {
                    final GoogleSignIn goo = GoogleSignIn();
                    goo.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GetStarted()));
                  } catch (e) {
                    print(e);
                  }
                }
              },
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                title: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.cyan, Colors.teal],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    labelStyle: TextStyle(fontSize: 16 * textScaleFactor, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(fontSize: 14 * textScaleFactor),
                    tabs: [
                      Tab(
                        text: "THEATER",
                      ),
                      Tab(
                        text: "OTT",
                      ),
                      Tab(
                        text: "COMING",
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              TheatrePage(),
              Ottpage(),
              Upcoming(),
            ],
          ),
        ),
      ),
    );
  }
}


