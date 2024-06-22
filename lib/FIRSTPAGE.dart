// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
// import 'package:filminfo/LANGUAGE.dart';
// import 'package:filminfo/LogSign.dart';
// import 'package:filminfo/PROFILE.dart';
// import 'package:filminfo/test.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'LOGIN.dart';
// import 'OTTpage.dart';
// import 'UPCOMING.dart';
//
// class FirstHomePage extends StatefulWidget {
//   const FirstHomePage({super.key});
//
//
//   @override
//   State<FirstHomePage> createState() => _FirstHomePageState();
// }
//
// class _FirstHomePageState extends State<FirstHomePage> {
//   Uint8List? _image;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImage();
//   }
//
//   Future<void> _selectImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await showDialog<ImageSource>(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Select image from:'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context, ImageSource.gallery),
//             child: Text('Gallery'),
//           ),
//           TextButton(
//             onPressed: () => Navigator.pop(context, ImageSource.camera),
//             child: Text('Camera'),
//           ),
//         ],
//       ),
//     );
//
//     if (pickedImage != null) {
//       final pickedFile = await picker.pickImage(source: pickedImage);
//       if (pickedFile != null) {
//         final bytes = await File(pickedFile.path).readAsBytes();
//         setState(() {
//           _image = bytes;
//         });
//         _saveImage(bytes);
//       }
//     }
//   }
//
//   Future<void> _saveImage(Uint8List bytes) async {
//     final prefs = await SharedPreferences.getInstance();
//     final base64String = base64Encode(bytes);
//     await prefs.setString('profile_image', base64String);
//   }
//
//   Future<void> _loadImage() async {
//     final prefs = await SharedPreferences.getInstance();
//     final base64String = prefs.getString('profile_image');
//     if (base64String != null) {
//       setState(() {
//         _image = base64Decode(base64String);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.cyan, Colors.teal],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               currentAccountPicture: Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: _image != null
//                         ? MemoryImage(_image!)
//                         : NetworkImage(
//                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToiRnzzyrDtkmRzlAvPPbh77E-Mvsk3brlxQ&s",
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     right: -10,
//                     child: IconButton(
//                       onPressed: _selectImage,
//                       icon: Icon(
//                         Icons.add_a_photo,
//                         color: Colors.white,
//                         size: 25,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               accountName: Text(
//                 'Alagan',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               accountEmail: Text(
//                 'alagan08@gmail.com',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             _buildDrawerItem(
//               icon: Icons.person,
//               text: 'Profile',
//               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage())),
//             ),
//             _buildDrawerItem(
//               icon: Icons.language,
//               text: 'Language',
//               onTap: () => Navigator.push(context, MaterialPageRoute(
//                   builder: (context) => Language()
//               )),
//             ),
//             Divider(),
//             _buildDrawerItem(
//               icon: Icons.help_center,
//               text: 'Help Center',
//               onTap: () => Navigator.pop(context),
//             ),
//             _buildDrawerItem(
//               icon: Icons.settings,
//               text: 'Settings',
//               onTap: () => Navigator.pop(context),
//             ),
//             _buildDrawerItem(
//               icon: Icons.info_outline,
//               text: 'About App',
//               onTap: () => Navigator.pop(context),
//             ),
//             Divider(),
//             _buildDrawerItem(
//               icon: Icons.logout,
//               text: 'Log Out',
//               onTap: () async {
//                 bool confirm = await showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Logout Confirmation'),
//                       content: Text('Are you sure you want to logout?'),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop(false);
//                           },
//                           child: Text('Cancel'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop(true);
//                           },
//                           child: Text('Logout'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//                 if (confirm) {
//                   try {
//                     final GoogleSignIn googleSignIn = new GoogleSignIn();
//                     googleSignIn.signOut();
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => LogSIGN()),
//                     );
//                   } catch (e) {
//                     print(e);
//                   }
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//       body: DefaultTabController(
//         length: 3,
//         child: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return[
//               SliverAppBar(
//                 pinned: true,
//               title: Padding(
//                 padding: const EdgeInsets.only(top: 10, bottom: 10),
//                 child: TabBar(
//                   dividerColor: Colors.transparent,
//                   indicator: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.cyan, Colors.teal
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   indicatorSize: TabBarIndicatorSize.tab,
//                   unselectedLabelColor: Colors.black,
//                   labelColor: Colors.white,
//                   labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   unselectedLabelStyle: TextStyle(fontSize: 14),
//                   tabs: [
//                     Tab(
//                       text: "THEATER",
//                     ),
//                     Tab(
//                       text: "OTT",
//                     ),
//                     Tab(
//                       text: "COMING",
//                     ),
//                   ],
//                 ),
//               ),
//             )
//             ];
//           },
//           body: TabBarView(
//             children: [
//               UpComing(),
//               Ottpage(),
//               UpComing(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String text,
//     GestureTapCallback? onTap,
//   }) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//       child: ListTile(
//         leading: Icon(icon, color: Colors.blueGrey),
//         title: Text(
//           text,
//           style: TextStyle(fontSize: 18, color: Colors.black),
//         ),
//         onTap: onTap,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         tileColor: Colors.cyan.withOpacity(0.1),
//       ),
//     );
//   }
// }




import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:filminfo/GetStarted.dart';
import 'package:filminfo/LANGUAGE.dart';
import 'package:filminfo/PROFILE.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'OTTpage.dart';
import 'ThemePage.dart';
import 'UPCOMING.dart';



class FirstHomePage extends StatefulWidget {
  const FirstHomePage({super.key});

  @override
  State<FirstHomePage> createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
  late final Theme_text = MediaQuery
      .of(context)
      .platformBrightness == Brightness.dark
      ? "DarkTheme"
      :"LightTheme";
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
      builder: (context) =>
          AlertDialog(
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
    return Scaffold(
      drawer: Drawer(
        child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.cyan),
                currentAccountPicture: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(radius: 80,
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
                  ],),
                accountName: Text('alagan'),
                accountEmail: Text('alagan08@gmail.com'),

              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      Text('Theme', style: TextStyle(fontSize: 25),),
                      ChangeThemeButtonWidget(),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                    Icons.person
                ),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                },
              ),
              ListTile(
                leading: Icon(
                    Icons.help_center
                ), title: const Text('Language'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Language()));
                },
              ),
              ListTile(
                leading: Icon(
                    Icons.add_box_outlined
                ),
                title: const Text('Help Center'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                    Icons.settings
                ),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                    Icons.touch_app_outlined
                ), title: const Text('About app'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                    Icons.assignment_ind_outlined
                ),
                title: const Text('Log out'),
                onTap: () async {
                  bool confirm = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Logout Confirmation'),
                        content: Text('Are you sure you want to logout?'),
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
                            },
                            child: Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );
                  if (confirm) {
                    try {
                      final GoogleSignIn goo = new GoogleSignIn();
                      goo.signOut();
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => GetStarted() ));
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              ), ListTile(
                leading: Icon(Icons.delete),
                title: const Text('Delete Profile'),
                onTap: () async {
                  bool confirm = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Delete Confirmation'),
                        content: Text(
                            'Are you sure you want to delete your profile picture?'),
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
              ),

            ]),
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
                        colors: [
                          Colors.cyan, Colors.teal
                        ],
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
                    //unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    labelStyle: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(fontSize: 14),
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
              UpComing(),
              Ottpage(),
              UpComing(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch(value: themeProvider.isDakMode,
      onChanged: (value){
        final provider = Provider.of<ThemeProvider>(context,listen:false );
        provider.toggleTheme(value);
      },);
  }
}