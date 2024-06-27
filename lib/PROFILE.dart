import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final picker = ImagePicker();
  late SharedPreferences _prefs;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      // Load saved image path if available
      String? imagePath = _prefs.getString('imagePath');
      if (imagePath != null) {
        setState(() {
          _image = File(imagePath);
        });
      }
      // Load other saved data
      _nameController.text = _prefs.getString('name') ?? '';
      _passwordController.text = _prefs.getString('password') ?? '';
      _emailController.text = _prefs.getString('email') ?? '';
      _contactController.text = _prefs.getString('contact') ?? '';
    });
  }


  Future getImageFromGallery() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _prefs.setString('imagePath', pickedFile.path);
    }
  }

  Future<void> _saveData(String key, String value) async {
    await _prefs.setString(key, value);
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)
        ),
        title: Text('Profile'),
        backgroundColor: Colors.cyan,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double screenHeight = constraints.maxHeight;
          final double screenWidth = constraints.maxWidth;
          final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

          return SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: getImageFromGallery,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.2,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: _image != null ? FileImage(_image!) : null,
                        child: _image == null
                            ? Icon(
                          Icons.camera_alt,
                          size: screenWidth * 0.1,
                        )
                            : null,
                      ),
                      if (_image == null)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: screenWidth * 0.1,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _saveData('name', value);
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _saveData('password', value);
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _saveData('email', value);
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                TextField(
                  controller: _contactController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Contact Number',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _saveData('contact', value);
                  },
                ),
                SizedBox(height: screenHeight * 0.04),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Text(
                      'Update Profile',
                      style: TextStyle(fontSize: 20 * textScaleFactor),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
