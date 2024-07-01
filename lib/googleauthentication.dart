// // import 'dart:developer';
// //
// // import 'package:firebase_auth/firebase_auth.dart';
// //
// // class AuthService {
// //   Future<String?> registration({
// //     required String email,
// //     required String password,
// //   }) async {
// //     try {
// //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //       return 'Success';
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == 'weak-password') {
// //         return 'The password provided is too weak.';
// //       } else if (e.code == 'email-already-in-use') {
// //         return 'The account already exists for that email.';
// //       } else {
// //         return e.message;
// //       }
// //     } catch (e) {
// //       return e.toString();
// //     }
// //   }
// //
// //   Future<String?> loginss({
// //     required String email,
// //     required String password,
// //   }) async {
// //     try {
// //       await FirebaseAuth.instance.signInWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //       return 'Success';
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == 'user-not-found') {
// //         return 'No user found for that email.';
// //       } else if (e.code == 'wrong-password') {
// //         return 'Wrong password provided for that user.';
// //       } else {
// //         return e.message;
// //       }
// //     } catch (e) {
// //       return e.toString();
// //     }
// //   }
// // }
//
//
//
//
// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   Future<String?> registration({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return 'Success';
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         return 'The password provided is too weak.';
//       } else if (e.code == 'email-already-in-use') {
//         return 'The account already exists for that email.';
//       } else {
//         return e.message;
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }
//
// //   Future<String?> loginss({
// //     required String email,
// //     required String password,
// //   }) async {
// //     try {
// //       await FirebaseAuth.instance.signInWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //       return 'Success';
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == 'user-not-found') {
// //         return 'No user found for that email.';
// //       } else if (e.code == 'wrong-password') {
// //         return 'Wrong password provided for that user.';
// //       } else {
// //         return e.message;
// //       }
// //     } catch (e) {
// //       return e.toString();
// //     }
// //   }
// // }
//
//
//   Future<User?> loginUserWithEmailAndPassword(String email,
//       String password) async {
//     try {
//       final cred = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return cred.user;
//     } on FirebaseException catch (e) {
//       exceptionHandler(e.code);
//     }
//     catch (e) {
//       log("Something went wrong: $e");
//       return null;
//     }
//     return null;
//   }
// }
//
// exceptionHandler(String code){
//   switch(code){
//     case"invalid-credential":
//       log("your login credentials are invalid");
//     case"Week password ":
//       log("Your password must contain 8 letter");
//     case"email is already in use":
//       log("user ifd already exit");
//     default:log("something went wrong");
//   }
// }