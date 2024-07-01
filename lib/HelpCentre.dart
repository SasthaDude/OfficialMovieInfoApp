// import 'package:flutter/material.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
//
//
// class HelpCenter extends StatefulWidget {
//   const HelpCenter({super.key});
//
//   @override
//   State<HelpCenter> createState() => _HelpCenterState();
// }
//
// class _HelpCenterState extends State<HelpCenter> {
//   final ctl = TextEditingController();
//   static const apiKey = 'AIzaSyBcY0GbJlTsKaVzO6ACXnUVCgsYpItDrMY';
//   final model = GenerativeModel(
//     model: 'gemini-1.5-flash-latest',
//     apiKey: apiKey,
//   );
//   final List<Message> _messages = [];
//
//   Future<void> sendMessage() async {
//     final message = ctl.text;
//     setState(() {
//       _messages.add(Message(isUser: true, message: message));
//     });
//     final prompt = message;
//     ctl.clear();
//     final content = [Content.text(prompt)];
//     final response = await model.generateContent(content);
//
//     setState(() {
//       _messages.add(Message(isUser: false, message: response.text!));
//     });
//     print(response.text);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios_new_outlined)
//         ),
//         title: Text('HELP CENTER'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 15, bottom: 35),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//                 child: ListView.builder(
//                     itemCount: _messages.length,
//                     itemBuilder: (context, index) {
//                       final message = _messages[index];
//                       return Messages(
//                           isUser: message.isUser, message: message.message);
//                     })),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     width: 300,
//                     height: 50,
//                     child: TextFormField(
//                       controller: ctl,
//                       decoration: InputDecoration(
//                           hintText: 'Enter Your Text',
//                           contentPadding: EdgeInsets.only(
//                               top: 10, bottom: 10, right: 5, left: 5),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(9))),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 45,
//                   width: 45,
//                   decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(9)),
//                   child: IconButton(
//                       color: Colors.white,
//                       onPressed: () {
//                         sendMessage();
//                       },
//                       icon: Icon(Icons.send)),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Message {
//   final bool isUser;
//   final String message;
//   Message({required this.isUser, required this.message});
// }
//
// class Messages extends StatelessWidget {
//   final bool isUser;
//   final String message;
//   const Messages({
//     super.key,
//     required this.isUser,
//     required this.message,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(15),
//       margin: EdgeInsets.symmetric(vertical: 15)
//           .copyWith(left: isUser ? 100 : 10, right: isUser ? 10 : 100),
//       decoration: BoxDecoration(
//           color: isUser ? Colors.blueAccent : Colors.grey.shade400,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10),
//               bottomLeft: isUser ? Radius.circular(10) : Radius.zero,
//               topRight: Radius.circular(10),
//               bottomRight: isUser ? Radius.zero : Radius.circular(10))),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             message,
//             style: TextStyle(
//                 fontSize: 16, color: isUser ? Colors.white : Colors.black),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final ctl = TextEditingController();
  static const apiKey = 'AIzaSyBcY0GbJlTsKaVzO6ACXnUVCgsYpItDrMY';
  final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: apiKey,
  );
  final List<Message> _messages = [];

  Future<void> sendMessage() async {
    final message = ctl.text;
    setState(() {
      _messages.add(Message(isUser: true, message: message));
    });
    final prompt = message;
    ctl.clear();
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(isUser: false, message: response.text!));
    });
    print(response.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text('HELP CENTER'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 15, bottom: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                    isUser: message.isUser,
                    message: message.message,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: ctl,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Text',
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: sendMessage,
                    icon: Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  Message({required this.isUser, required this.message});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  const Messages({
    super.key,
    required this.isUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth > 600 ? 18 : 16;
        EdgeInsets padding = constraints.maxWidth > 600
            ? EdgeInsets.all(20)
            : EdgeInsets.all(15);

        return Container(
          width: double.infinity,
          padding: padding,
          margin: EdgeInsets.symmetric(vertical: 15)
              .copyWith(left: isUser ? 100 : 10, right: isUser ? 10 : 100),
          decoration: BoxDecoration(
            color: isUser ? Colors.blueAccent : Colors.grey.shade400,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: isUser ? Radius.circular(10) : Radius.zero,
              topRight: Radius.circular(10),
              bottomRight: isUser ? Radius.zero : Radius.circular(10),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(fontSize: fontSize, color: isUser ? Colors.white : Colors.black),
          ),
        );
      },
    );
  }
}


