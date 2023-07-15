// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
//
// class GoogleSignInProvider extends ChangeNotifier {
//   final googleSignIn = GoogleSignIn();
//   late User? _user;
//
//   User? get user => _user;
//
//   Future<void> login(BuildContext context) async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//
//         final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//         _user = userCredential.user;
//
//         if (_user != null) {
//           // Check if the user is already registered or new
//           bool isRegistered = /* Implement your logic here */;
//           if (isRegistered) {
//             // Navigate to MyScreen if the user is already registered
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => MyScreen()),
//             );
//           } else {
//             // Navigate to NewScreen if the user is new
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => NewScreen()),
//             );
//           }
//         }
//       }
//     } catch (error) {
//       print('Error signing in with Google: $error');
//     }
//   }
//
//   void logout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//     _user = null;
//     notifyListeners();
//   }
// }
//
// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<GoogleSignInProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose Login Option'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             provider.login(context);
//           },
//           child: Text('Sign in with Google'),
//         ),
//       ),
//     );
//   }
// }
//
// class MyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Screen'),
//       ),
//       body: Center(
//         child: Text('Welcome to My Screen!'),
//       ),
//     );
//   }
// }
//
// class NewScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New Screen'),
//       ),
//       body: Center(
//         child: Text('Welcome to New Screen!'),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => GoogleSignInProvider(),
//       child: MaterialApp(
//         title: 'Google Sign-In',
//         theme: ThemeData(
//           primarySwatch: Colors.orange,
//         ),
//         home: MainPage(),
//       ),
//     );
//   }
// }
