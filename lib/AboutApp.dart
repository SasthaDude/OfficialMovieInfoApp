// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class AboutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Colors.black54,
//               Colors.black45,
//               Colors.black38,
//               Colors.black26,
//               Colors.black12,
//             ],
//           ),
//         ),
//         constraints: BoxConstraints(maxWidth: 600),
//         child: SingleChildScrollView(
//           child: SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 30),
//                 Row(
//                   children: [
//                     SizedBox(width: 30,),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(
//                           Icons.arrow_back_ios_new_outlined,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 100,),
//                     Text(
//                       'About App',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 100),
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 60,
//                   backgroundImage: AssetImage('assets/logo.png'), // Replace with your app icon image
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Movie Info App',
//                   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueGrey[900]),
//                 ),
//                 SizedBox(height: 8),
//
//                 // App Version
//                 Text(
//                   'Version 1.0.0',
//                   style: TextStyle(fontSize: 18, color: Colors.grey),
//                 ),
//                 SizedBox(height: 24),
//
//                 // Description
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Text(
//                     'Based on the kind of shows or movies you like our recommendation engine '
//                         'searches over 100,000 titles to serve you only the best stuff you must see.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16, color: Colors.black54),
//                   ),
//                 ),
//                 SizedBox(height: 24),
//
//                 // Developer Information
//                 _buildSectionHeader('Developed by Movie Info Team'),
//                 SizedBox(height: 8),
//                 _buildContactInfo('Email', 'movieinfo@gmail.com'),
//                 SizedBox(height: 8),
//                 _buildLinkButton('Website', 'https://www.movieinfo.com'),
//
//                 SizedBox(height: 24),
//
//                 // Social Media Links
//                 _buildSocialMediaLinks(),
//
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to build section header
//   Widget _buildSectionHeader(String title) {
//     return Text(
//       title,
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[900]),
//     );
//   }
//
//   // Function to build contact information
//   Widget _buildContactInfo(String label, String value) {
//     return Text(
//       '$label: $value',
//       style: TextStyle(fontSize: 16, color: Colors.blueGrey[900]),
//     );
//   }
//
//   // Function to build link button
//   Widget _buildLinkButton(String label, String url) {
//     return TextButton(
//       onPressed: () {
//         _launchURL(url);
//       },
//       child: Text(
//         label,
//         style: TextStyle(fontSize: 16, color: Colors.blue),
//       ),
//     );
//   }
//
//   // Function to build social media links
//   Widget _buildSocialMediaLinks() {
//     return Wrap(
//       alignment: WrapAlignment.center,
//       spacing: 20,
//       children: [
//         _buildSocialIconButton(
//           onPressed: () {
//             _launchURL('https://www.facebook.com/yourcompany');
//           },
//           icon: Icons.facebook,
//           color: Colors.blue,
//         ),
//         _buildSocialIconButton(
//           onPressed: () {
//             _launchURL('https://twitter.com/yourcompany');
//           },
//           icon: Icons.email,
//           color: Colors.blue,
//         ),
//         _buildSocialIconButton(
//           onPressed: () {
//             _launchURL('https://www.linkedin.com/company/yourcompany');
//           },
//           icon: Icons.install_mobile_rounded,
//           color: Colors.blue,
//         ),
//       ],
//     );
//   }
//
//   // Function to launch URLs
//   void _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   // Widget for Social Media IconButton
//   Widget _buildSocialIconButton({required VoidCallback onPressed, required IconData icon, required Color color}) {
//     return IconButton(
//       onPressed: onPressed,
//       icon: Icon(icon),
//       iconSize: 36,
//       color: color,
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: AboutPage(),
//   ));
// }



import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black54,
              Colors.black45,
              Colors.black38,
              Colors.black26,
              Colors.black12,
            ],
          ),
        ),
        constraints: BoxConstraints(maxWidth: 600),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    Text(
                      'About App',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  backgroundImage: AssetImage('assets/icon.png'), // Replace with your app icon image
                ),
                SizedBox(height: 16),
                Text(
                  'Movie Info App',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 8),

                // App Version
                Text(
                  'Version 1.0.0',
                  style: TextStyle(fontSize: 18,),
                ),
                SizedBox(height: 24),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Based on the kind of shows or movies you like our recommendation engine '
                        'searches over 100,000 titles to serve you only the best stuff you must see.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, ),
                  ),
                ),
                SizedBox(height: 24),

                // Developer Information
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Developed by Movie Info team',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[900]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Email: movieinfo@gmail.com',
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey[900]),
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          _launchURL('https://www.movieinfo.com');
                        },
                        child: Text(
                          'Website: www.movieinfo.com',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Social Media Links
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  children: [
                    _buildSocialButton(
                      onPressed: () {
                        _launchURL('https://www.facebook.com/yourcompany');
                      },
                      icon: Icons.facebook,
                      color: Colors.blue,
                    ),
                    _buildSocialButton(
                      onPressed: () {
                        _launchURL('https://twitter.com/yourcompany');
                      },
                      icon: Icons.email,
                      color: Colors.blue,
                    ),
                    _buildSocialButton(
                      onPressed: () {
                        _launchURL('https://www.linkedin.com/company/yourcompany');
                      },
                      icon: Icons.install_mobile_rounded,
                      color: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to launch URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Widget for Social Media Button
  Widget _buildSocialButton({required VoidCallback onPressed, required IconData icon, required Color color}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 36,
      color: color,
    );
  }
}